#!/usr/bin/env bash
#
#-----------------------------------------------------------------------------------------
#     SMARTI – Smart Management of Automated Resources for Technology Infrastructure.
#-----------------------------------------------------------------------------------------
# AUTHOR:      Sandro Dias (gitdias)
# REPOSITORY:  https://github.com/gitdias/SMARTI
# VERSION:     v01.00.04_u2025-12-26
# LICENSE:     MIT License
# SCRIPT:      detect_language.lib.sh
# PATH:        /opt/smarti/libs/
# DESCRIPTION: i18n engine - detect system locale and load language files
# DEPENDENCIES: bash
#
# Copyright (c) 2025 Sandro Dias
#-----------------------------------------------------------------------------------------
#

# Prevent direct execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Error: This is a library file and should not be executed directly."
    echo "Usage: source ${BASH_SOURCE[0]}"
    exit 1
fi

# Error handling with trap inheritance
set -euTo pipefail

#-----------------------------------------------------------------------------------------
# GLOBAL VARIABLES
#-----------------------------------------------------------------------------------------

# i18n directory
readonly SMARTI_I18N_DIR="${SMARTI_I18N_DIR:-/opt/smarti/i18n}"

# Default language (fallback)
readonly SMARTI_DEFAULT_LANG="us"

# Currently loaded language
SMARTI_CURRENT_LANG=""

# Flag indicating if language file was loaded
SMARTI_LANG_LOADED=false

#-----------------------------------------------------------------------------------------
# FUNCTION: _normalize_locale
# Extract clean language code from locale string
# Arguments:
#   $1 - Locale string (e.g., pt_BR.UTF-8, en_US, pt_BR)
# Returns:
#   Clean language code (e.g., pt_BR, en_US, us)
#-----------------------------------------------------------------------------------------
_normalize_locale() {
    local locale="$1"

    # Remove encoding suffix (.UTF-8, .utf8, etc.)
    locale="${locale%%.*}"

    # Remove @variant suffix
    locale="${locale%%@*}"

    # Convert en_US to us (special case for American English)
    if [[ "$locale" =~ ^en(_US)?$ ]]; then
        echo "us"
        return 0
    fi

    # Return cleaned locale
    echo "$locale"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: _detect_system_locale
# Detect system locale with proper precedence
# Precedence: LC_ALL > LANGUAGE > LANG
# Returns:
#   Detected language code
#-----------------------------------------------------------------------------------------
_detect_system_locale() {
    local detected_lang=""

    # Check LC_ALL first (highest priority)
    if [[ -n "${LC_ALL:-}" ]]; then
        detected_lang="$(_normalize_locale "$LC_ALL")"
    # Check LANGUAGE second
    elif [[ -n "${LANGUAGE:-}" ]]; then
        # LANGUAGE can contain multiple values (e.g., pt_BR:pt:en)
        # Extract first value
        detected_lang="$(_normalize_locale "${LANGUAGE%%:*}")"
    # Check LANG last (lowest priority)
    elif [[ -n "${LANG:-}" ]]; then
        detected_lang="$(_normalize_locale "$LANG")"
    fi

    # Return detected language or default
    echo "${detected_lang:-$SMARTI_DEFAULT_LANG}"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: _validate_lang_file
# Validate language file integrity before sourcing
# Prevents code injection by checking file format
# Arguments:
#   $1 - Path to .lang file
# Returns:
#   0 if valid, 1 if invalid
#-----------------------------------------------------------------------------------------
_validate_lang_file() {
    local lang_file="$1"

    # Check if file exists and is readable
    if [[ ! -f "$lang_file" || ! -r "$lang_file" ]]; then
        return 1
    fi

    # Validate file content line by line
    while IFS= read -r line; do
        # Skip empty lines
        [[ -z "$line" ]] && continue

        # Skip comments
        [[ "$line" =~ ^[[:space:]]*# ]] && continue

        # Validate KEY="value" format
        # Allow only alphanumeric, underscore for KEY
        # Allow any content inside quotes for value
        if ! [[ "$line" =~ ^[A-Z_][A-Z0-9_]*=\"[^\"]*\"[[:space:]]*$ ]]; then
            # Invalid line detected
            return 1
        fi
    done < "$lang_file"

    return 0
}

#-----------------------------------------------------------------------------------------
# FUNCTION: load_language
# Load language file based on detected or specified locale
# Arguments:
#   $1 - Optional: Force specific language code (e.g., pt_BR, us)
# Returns:
#   0 on success, 1 on failure
#-----------------------------------------------------------------------------------------
load_language() {
    local lang_code="${1:-}"
    local lang_file=""

    # If no language specified, detect from system
    if [[ -z "$lang_code" ]]; then
        lang_code="$(_detect_system_locale)"
    fi

    # Build language file path
    lang_file="${SMARTI_I18N_DIR}/${lang_code}.lang"

    # Try to load specified language
    if [[ -f "$lang_file" ]]; then
        # Validate file before sourcing
        if _validate_lang_file "$lang_file"; then
            # Source language file
            # shellcheck source=/dev/null
            source "$lang_file"
            SMARTI_CURRENT_LANG="$lang_code"
            SMARTI_LANG_LOADED=true

            # Log success if log library is available
            if declare -f log &>/dev/null; then
                log "DEBUG" "Language loaded: ${lang_code}"
            fi

            return 0
        else
            # Invalid language file, try fallback
            if declare -f log &>/dev/null; then
                log "WARN" "Invalid language file: ${lang_file}"
            fi
        fi
    fi

    # Fallback to default language if not already tried
    if [[ "$lang_code" != "$SMARTI_DEFAULT_LANG" ]]; then
        lang_file="${SMARTI_I18N_DIR}/${SMARTI_DEFAULT_LANG}.lang"

        if [[ -f "$lang_file" ]] && _validate_lang_file "$lang_file"; then
            # shellcheck source=/dev/null
            source "$lang_file"
            SMARTI_CURRENT_LANG="$SMARTI_DEFAULT_LANG"
            SMARTI_LANG_LOADED=true

            if declare -f log &>/dev/null; then
                log "DEBUG" "Fallback to default language: ${SMARTI_DEFAULT_LANG}"
            fi

            return 0
        fi
    fi

    # Failed to load any language file
    SMARTI_LANG_LOADED=false

    if declare -f log &>/dev/null; then
        log "ERROR" "Failed to load language files"
    fi

    return 1
}

#-----------------------------------------------------------------------------------------
# FUNCTION: get_message
# Get translated message with fallback
# Arguments:
#   $1 - Message key (e.g., MSG_WELCOME)
#   $2 - Optional: Fallback message if key not found
# Returns:
#   Message value or fallback
#-----------------------------------------------------------------------------------------
get_message() {
    local key="$1"
    local fallback="${2:-[Missing translation: $key]}"

    # Check if variable exists and is not empty
    if [[ -n "${!key:-}" ]]; then
        echo "${!key}"
    else
        echo "$fallback"
    fi
}

#-----------------------------------------------------------------------------------------
# FUNCTION: list_available_languages
# List all available language files in i18n directory
# Returns:
#   List of language codes (one per line)
#-----------------------------------------------------------------------------------------
list_available_languages() {
    local lang_file

    # Check if i18n directory exists
    if [[ ! -d "$SMARTI_I18N_DIR" ]]; then
        return 1
    fi

    # List all .lang files
    for lang_file in "${SMARTI_I18N_DIR}"/*.lang; do
        # Check if any .lang files exist
        [[ -e "$lang_file" ]] || continue

        # Extract language code (filename without path and extension)
        basename "$lang_file" .lang
    done | sort
}

#-----------------------------------------------------------------------------------------
# FUNCTION: get_language_name
# Get human-readable language name from code
# Arguments:
#   $1 - Language code (e.g., us, pt_BR)
# Returns:
#   Language name (e.g., "American English", "Brazilian Portuguese")
#-----------------------------------------------------------------------------------------
get_language_name() {
    local lang_code="$1"

    case "$lang_code" in
        us)    echo "American English" ;;
        pt_BR) echo "Brazilian Portuguese" ;;
        es_ES) echo "Spanish (Spain)" ;;
        es_MX) echo "Spanish (Mexico)" ;;
        fr_FR) echo "French" ;;
        de_DE) echo "German" ;;
        it_IT) echo "Italian" ;;
        ja_JP) echo "Japanese" ;;
        zh_CN) echo "Chinese (Simplified)" ;;
        ru_RU) echo "Russian" ;;
        *)     echo "Unknown ($lang_code)" ;;
    esac
}

#-----------------------------------------------------------------------------------------
# FUNCTION: show_language_info
# Display formatted information about available languages
# Used by scripts with -l/--language option
#-----------------------------------------------------------------------------------------
show_language_info() {
    local lang_code

    echo "i18n support for user messages in scripts."
    echo "USAGE EXAMPLES"
    echo "a) To list the available languages:"
    echo "  ${BASH_SOURCE[1]##*/} -l"
    echo "b) To force the use of a specific language:"
    echo "  ${BASH_SOURCE[1]##*/} -l pt_BR"
    echo ""
    echo "LANGUAGES AVAILABLE:"

    while IFS= read -r lang_code; do
        printf "  %-6s - %s\n" "$lang_code" "$(get_language_name "$lang_code")"
    done < <(list_available_languages)

    echo ""
    echo "Copyright (c) 2025 Sandro Dias"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: get_current_language
# Get currently loaded language code
# Returns:
#   Current language code or empty if none loaded
#-----------------------------------------------------------------------------------------
get_current_language() {
    echo "$SMARTI_CURRENT_LANG"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: is_language_loaded
# Check if language file was successfully loaded
# Returns:
#   0 if loaded, 1 if not
#-----------------------------------------------------------------------------------------
is_language_loaded() {
    [[ "$SMARTI_LANG_LOADED" == true ]]
}
