#!/usr/bin/env bash
#
#-----------------------------------------------------------------------------------------
# SMARTI Development Tool - Version Update Automation
#-----------------------------------------------------------------------------------------
# This script automates the version increment process for SMARTI project
# Author: Sandro Dias (gitdias)
# Repository: https://github.com/gitdias/SMARTI
#-----------------------------------------------------------------------------------------

set -euTo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# Symbols
SYMBOL_SUCCESS="✓"
SYMBOL_ERROR="✗"
SYMBOL_INFO="ℹ"
SYMBOL_QUESTION="❓"
SYMBOL_ROCKET="🚀"

# Project paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
VERSION_FILE="${PROJECT_ROOT}/conf/version.conf"
CURRENT_VERSION_FILE="${PROJECT_ROOT}/conf/current_version.conf"
RELEASE_NOTES="${PROJECT_ROOT}/docs/RELEASE_NOTES.md"
CHANGELOG="${PROJECT_ROOT}/docs/CHANGELOG.md"

#-----------------------------------------------------------------------------------------
# FUNCTION: print_message
# Print colored message
#-----------------------------------------------------------------------------------------
print_message() {
    local type="$1"
    local message="$2"

    case "$type" in
        success) echo -e "${GREEN}${SYMBOL_SUCCESS}${RESET} ${message}" ;;
        error)   echo -e "${RED}${SYMBOL_ERROR}${RESET} ${message}" ;;
        info)    echo -e "${CYAN}${SYMBOL_INFO}${RESET} ${message}" ;;
        warn)    echo -e "${YELLOW}${SYMBOL_QUESTION}${RESET} ${message}" ;;
        title)   echo -e "\n${BOLD}${BLUE}${message}${RESET}\n" ;;
        *)       echo "$message" ;;
    esac
}

#-----------------------------------------------------------------------------------------
# FUNCTION: get_current_version
# Extract current version from version.conf
#-----------------------------------------------------------------------------------------
get_current_version() {
    if [[ ! -f "$VERSION_FILE" ]]; then
        print_message error "Version file not found: $VERSION_FILE"
        exit 1
    fi

    grep -oP 'VERSION="v\K[^"]+' "$VERSION_FILE"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: parse_version
# Parse version string into components
#-----------------------------------------------------------------------------------------
parse_version() {
    local version="$1"

    # Extract vXX.YY.ZZ_uYYYY-MM-DD
    local version_part="${version%%_u*}"
    local date_part="${version##*_u}"

    # Parse Major.Minor.Patch
    IFS='.' read -r MAJOR MINOR PATCH <<< "$version_part"

    echo "$MAJOR|$MINOR|$PATCH|$date_part"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: increment_version
# Increment version based on type
#-----------------------------------------------------------------------------------------
increment_version() {
    local type="$1"
    local current="$2"

    IFS='|' read -r major minor patch date <<< "$(parse_version "$current")"

    # Get current date
    local new_date="$(date +%Y-%m-%d)"

    case "$type" in
        major)
            major=$((10#$major + 1))
            minor="00"
            patch="00"
            ;;
        minor)
            minor=$((10#$minor + 1))
            patch="00"
            ;;
        patch)
            patch=$((10#$patch + 1))
            ;;
        *)
            print_message error "Invalid version type: $type"
            exit 1
            ;;
    esac

    # Format with leading zeros
    printf "%02d.%02d.%02d_u%s" "$major" "$minor" "$patch" "$new_date"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: update_config_files
# Update version in configuration files
#-----------------------------------------------------------------------------------------
update_config_files() {
    local new_version="$1"

    print_message info "Updating configuration files..."

    # Update version.conf
    sed -i "s/VERSION=\"v.*\"/VERSION=\"v${new_version}\"/" "$VERSION_FILE"
    print_message success "Updated: conf/version.conf"

    # Update current_version.conf
    sed -i "s/VERSION=\"v.*\"/VERSION=\"v${new_version}\"/" "$CURRENT_VERSION_FILE"
    print_message success "Updated: conf/current_version.conf"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: update_headers
# Update VERSION field in all script and library headers
#-----------------------------------------------------------------------------------------
update_headers() {
    local new_version="$1"
    local count=0

    print_message info "Updating headers in scripts and libraries..."

    # Find all .sh files in bins/ and libs/
    while IFS= read -r file; do
        if grep -q "# VERSION:" "$file"; then
            sed -i "s/# VERSION:.*$/# VERSION:     v${new_version}/" "$file"
            print_message success "Updated: ${file#$PROJECT_ROOT/}"
            ((count++))
        fi
    done < <(find "${PROJECT_ROOT}/bins" "${PROJECT_ROOT}/libs" -type f -name "*.sh" 2>/dev/null)

    print_message info "Total files updated: $count"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: update_changelog
# Copy RELEASE_NOTES.md to CHANGELOG.md preserving header
#-----------------------------------------------------------------------------------------
update_changelog() {
    print_message info "Updating CHANGELOG.md..."

    if [[ ! -f "$RELEASE_NOTES" ]]; then
        print_message error "RELEASE_NOTES.md not found"
        return 1
    fi

    if [[ ! -f "$CHANGELOG" ]]; then
        print_message error "CHANGELOG.md not found"
        return 1
    fi

    # Extract header (first 6 lines) from CHANGELOG
    local header
    header="$(head -n 6 "$CHANGELOG")"

    # Extract content from RELEASE_NOTES (skip first line if it's a title)
    local release_content
    release_content="$(tail -n +2 "$RELEASE_NOTES")"

    # Get existing changelog content (from line 7 onwards)
    local existing_content
    existing_content="$(tail -n +7 "$CHANGELOG")"

    # Rebuild CHANGELOG
    {
        echo "$header"
        echo ""
        echo "$release_content"
        echo ""
        echo "$existing_content"
    } > "${CHANGELOG}.tmp"

    mv "${CHANGELOG}.tmp" "$CHANGELOG"

    print_message success "CHANGELOG.md updated"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: generate_git_commands
# Generate git commands for commit and tag
#-----------------------------------------------------------------------------------------
generate_git_commands() {
    local old_version="$1"
    local new_version="$2"
    local increment_type="$3"

    print_message title "${SYMBOL_ROCKET} GIT COMMANDS"

    echo -e "${BOLD}Step 1: Add modified files${RESET}"
    echo "cd ~/git/SMARTI"
    echo "git add conf/version.conf conf/current_version.conf docs/CHANGELOG.md"
    echo "git add bins/*.sh libs/*.sh"
    echo ""

    echo -e "${BOLD}Step 2: Commit changes${RESET}"
    cat <<EOF
git commit -m "chore(version): increment ${increment_type} version to v${new_version}

Changed:
- Updated version from v${old_version} to v${new_version}
- Updated all script and library headers
- Updated CHANGELOG.md with latest release notes

Version: v${new_version}"
EOF
    echo ""

    echo -e "${BOLD}Step 3: Create annotated tag${RESET}"
    cat <<EOF
git tag -a v${new_version%.0.0*}.${new_version#*.} -m "Release v${new_version}

Version increment: ${increment_type^^}
Previous: v${old_version}
Current: v${new_version}

See CHANGELOG.md for details.

Date: $(date +%Y-%m-%d)"
EOF
    echo ""

    echo -e "${BOLD}Step 4: Push to remote${RESET}"
    local tag_version="${new_version%%_u*}"
    echo "git push origin main"
    echo "git push origin v${tag_version}"
    echo ""
}

#-----------------------------------------------------------------------------------------
# MAIN EXECUTION
#-----------------------------------------------------------------------------------------
main() {
    print_message title "🔄 SMARTI Version Update Tool"

    # Get current version
    local current_version
    current_version="$(get_current_version)"

    print_message info "Current version: ${BOLD}v${current_version}${RESET}"
    echo ""

    # Ask for increment type
    echo -e "${YELLOW}${SYMBOL_QUESTION}${RESET} Select version increment type:"
    echo ""
    echo "  ${BOLD}1)${RESET} MAJOR - Breaking changes (resets Minor and Patch to 00)"
    echo "  ${BOLD}2)${RESET} MINOR - New features (resets Patch to 00)"
    echo "  ${BOLD}3)${RESET} PATCH - Bug fixes and improvements"
    echo ""
    read -p "Choice (1-3): " choice

    local increment_type
    case "$choice" in
        1) increment_type="major" ;;
        2) increment_type="minor" ;;
        3) increment_type="patch" ;;
        *)
            print_message error "Invalid choice"
            exit 1
            ;;
    esac

    # Calculate new version
    local new_version
    new_version="$(increment_version "$increment_type" "$current_version")"

    echo ""
    print_message warn "New version will be: ${BOLD}v${new_version}${RESET}"
    echo ""
    read -p "Proceed with update? (y/N): " confirm

    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        print_message info "Operation cancelled"
        exit 0
    fi

    echo ""
    print_message title "🔧 Updating project..."

    # Update files
    update_config_files "$new_version"
    echo ""

    update_headers "$new_version"
    echo ""

    update_changelog
    echo ""

    # Generate git commands
    generate_git_commands "$current_version" "$new_version" "$increment_type"

    print_message success "Version update completed!"
    print_message info "Review changes and execute git commands above"
}

# Run main function
main "$@"
