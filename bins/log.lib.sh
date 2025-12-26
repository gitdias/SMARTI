#!/usr/bin/env bash
#
#-----------------------------------------------------------------------------------------
#     SMARTI – Smart Management of Automated Resources for Technology Infrastructure.
#-----------------------------------------------------------------------------------------
# AUTHOR:      Sandro Dias (gitdias)
# REPOSITORY:  https://github.com/gitdias/SMARTI
# VERSION:     v01.00.04_u2025-12-26
# LICENSE:     MIT License
# SCRIPT:      log.lib.sh
# PATH:        /opt/smarti/libs/
# DESCRIPTION: Centralized logging system with severity levels and rotation support
# DEPENDENCIES: bash, date
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

# Log directory
readonly SMARTI_LOG_DIR="${SMARTI_LOG_DIR:-/opt/smarti/logs}"

# Log levels
readonly LOG_LEVEL_DEBUG=0
readonly LOG_LEVEL_INFO=1
readonly LOG_LEVEL_WARN=2
readonly LOG_LEVEL_ERROR=3

# Current log level (INFO by default)
SMARTI_LOG_LEVEL="${SMARTI_LOG_LEVEL:-$LOG_LEVEL_INFO}"

# Script-specific log file (set by init_log)
SMARTI_SCRIPT_LOG=""

# Generic events log
readonly SMARTI_EVENTS_LOG="${SMARTI_LOG_DIR}/events.log"

# Flags for output control
SMARTI_LOG_VERBOSE="${SMARTI_LOG_VERBOSE:-false}"
SMARTI_LOG_SILENCE="${SMARTI_LOG_SILENCE:-false}"

#-----------------------------------------------------------------------------------------
# FUNCTION: init_log
# Initialize logging system for a script
# Arguments:
#   $1 - Script name (without .sh extension)
# Returns:
#   0 on success, 1 on failure
#-----------------------------------------------------------------------------------------
init_log() {
    local script_name="${1:-unknown}"

    # Remove .sh extension if present
    script_name="${script_name%.sh}"

    # Create log directory if doesn't exist
    if [[ ! -d "${SMARTI_LOG_DIR}" ]]; then
        mkdir -p "${SMARTI_LOG_DIR}" 2>/dev/null || {
            echo "ERROR: Cannot create log directory: ${SMARTI_LOG_DIR}" >&2
            return 1
        }
    fi

    # Set script-specific log file
    SMARTI_SCRIPT_LOG="${SMARTI_LOG_DIR}/${script_name}.log"

    # Create log file if doesn't exist
    if [[ ! -f "${SMARTI_SCRIPT_LOG}" ]]; then
        touch "${SMARTI_SCRIPT_LOG}" 2>/dev/null || {
            echo "ERROR: Cannot create log file: ${SMARTI_SCRIPT_LOG}" >&2
            return 1
        }
    fi

    # Create events log if doesn't exist
    if [[ ! -f "${SMARTI_EVENTS_LOG}" ]]; then
        touch "${SMARTI_EVENTS_LOG}" 2>/dev/null || {
            echo "ERROR: Cannot create events log: ${SMARTI_EVENTS_LOG}" >&2
            return 1
        }
    fi

    return 0
}

#-----------------------------------------------------------------------------------------
# FUNCTION: _get_log_level_name
# Convert log level number to name
# Arguments:
#   $1 - Log level number
# Returns:
#   Log level name (DEBUG|INFO|WARN|ERROR)
#-----------------------------------------------------------------------------------------
_get_log_level_name() {
    case "$1" in
        "$LOG_LEVEL_DEBUG") echo "DEBUG" ;;
        "$LOG_LEVEL_INFO")  echo "INFO" ;;
        "$LOG_LEVEL_WARN")  echo "WARN" ;;
        "$LOG_LEVEL_ERROR") echo "ERROR" ;;
        *) echo "UNKNOWN" ;;
    esac
}

#-----------------------------------------------------------------------------------------
# FUNCTION: _should_log
# Check if message should be logged based on current log level
# Arguments:
#   $1 - Message log level
# Returns:
#   0 if should log, 1 if should skip
#-----------------------------------------------------------------------------------------
_should_log() {
    local msg_level="$1"
    [[ "$msg_level" -ge "$SMARTI_LOG_LEVEL" ]]
}

#-----------------------------------------------------------------------------------------
# FUNCTION: _write_log
# Write formatted log entry to file
# Arguments:
#   $1 - Log file path
#   $2 - Log level name
#   $3 - Script name
#   $4 - Message
#-----------------------------------------------------------------------------------------
_write_log() {
    local log_file="$1"
    local level="$2"
    local script="$3"
    local message="$4"
    local timestamp

    # Generate timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"

    # Format: [YYYY-MM-DD HH:MM:SS] NIVEL:SCRIPT:"MENSAGEM"
    printf '[%s] %s:%s:"%s"\n' \
        "${timestamp}" \
        "${level}" \
        "${script}" \
        "${message}" >> "${log_file}"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: log
# Main logging function with severity levels
# Arguments:
#   $1 - Log level (DEBUG|INFO|WARN|ERROR)
#   $2 - Message
# Usage:
#   log "INFO" "Operation completed successfully"
#   log "ERROR" "Failed to connect to database"
#-----------------------------------------------------------------------------------------
log() {
    local level_name="${1^^}"  # Convert to uppercase
    local message="$2"
    local level_num
    local script_name

    # Get script name (caller)
    script_name="$(basename "${BASH_SOURCE[2]}" .sh 2>/dev/null || echo "unknown")"

    # Convert level name to number
    case "$level_name" in
        DEBUG) level_num=$LOG_LEVEL_DEBUG ;;
        INFO)  level_num=$LOG_LEVEL_INFO ;;
        WARN)  level_num=$LOG_LEVEL_WARN ;;
        ERROR) level_num=$LOG_LEVEL_ERROR ;;
        *)
            echo "ERROR: Invalid log level: $level_name" >&2
            return 1
            ;;
    esac

    # Check if should log based on current log level
    if ! _should_log "$level_num"; then
        return 0
    fi

    # Write to script-specific log if initialized
    if [[ -n "${SMARTI_SCRIPT_LOG}" && -f "${SMARTI_SCRIPT_LOG}" ]]; then
        _write_log "${SMARTI_SCRIPT_LOG}" "${level_name}" "${script_name}" "${message}"
    fi

    # Echo to stdout if verbose mode and not silence
    if [[ "${SMARTI_LOG_VERBOSE}" == "true" && "${SMARTI_LOG_SILENCE}" != "true" ]]; then
        printf '[%s] %s: %s\n' "$(date '+%H:%M:%S')" "${level_name}" "${message}"
    fi

    return 0
}

#-----------------------------------------------------------------------------------------
# FUNCTION: log_event
# Log generic events to events.log (INFO level only)
# Used for SUCCESS/FAILURE tracking across all scripts
# Arguments:
#   $1 - Event type (SUCCESS|FAILURE)
#   $2 - Message
# Usage:
#   log_event "SUCCESS" "Installation completed"
#   log_event "FAILURE" "Connection timeout"
#-----------------------------------------------------------------------------------------
log_event() {
    local event_type="${1^^}"  # Convert to uppercase
    local message="$2"
    local script_name

    # Validate event type
    if [[ "$event_type" != "SUCCESS" && "$event_type" != "FAILURE" ]]; then
        echo "ERROR: Invalid event type. Use SUCCESS or FAILURE" >&2
        return 1
    fi

    # Get script name (caller)
    script_name="$(basename "${BASH_SOURCE[1]}" .sh 2>/dev/null || echo "unknown")"

    # Write to events.log
    if [[ -f "${SMARTI_EVENTS_LOG}" ]]; then
        _write_log "${SMARTI_EVENTS_LOG}" "INFO" "${script_name}" "${event_type}: ${message}"
    fi

    return 0
}

#-----------------------------------------------------------------------------------------
# FUNCTION: set_log_level
# Change current log level at runtime
# Arguments:
#   $1 - Log level (DEBUG|INFO|WARN|ERROR)
# Usage:
#   set_log_level "DEBUG"
#-----------------------------------------------------------------------------------------
set_log_level() {
    local level_name="${1^^}"

    case "$level_name" in
        DEBUG) SMARTI_LOG_LEVEL=$LOG_LEVEL_DEBUG ;;
        INFO)  SMARTI_LOG_LEVEL=$LOG_LEVEL_INFO ;;
        WARN)  SMARTI_LOG_LEVEL=$LOG_LEVEL_WARN ;;
        ERROR) SMARTI_LOG_LEVEL=$LOG_LEVEL_ERROR ;;
        *)
            echo "ERROR: Invalid log level: $level_name" >&2
            echo "Valid levels: DEBUG, INFO, WARN, ERROR" >&2
            return 1
            ;;
    esac

    return 0
}

#-----------------------------------------------------------------------------------------
# FUNCTION: enable_verbose
# Enable verbose mode (echo logs to stdout)
#-----------------------------------------------------------------------------------------
enable_verbose() {
    SMARTI_LOG_VERBOSE="true"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: disable_verbose
# Disable verbose mode
#-----------------------------------------------------------------------------------------
disable_verbose() {
    SMARTI_LOG_VERBOSE="false"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: enable_silence
# Enable silence mode (suppress all stdout)
#-----------------------------------------------------------------------------------------
enable_silence() {
    SMARTI_LOG_SILENCE="true"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: disable_silence
# Disable silence mode
#-----------------------------------------------------------------------------------------
disable_silence() {
    SMARTI_LOG_SILENCE="false"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: get_log_file
# Get path to current script log file
# Returns:
#   Path to log file
#-----------------------------------------------------------------------------------------
get_log_file() {
    echo "${SMARTI_SCRIPT_LOG:-${SMARTI_LOG_DIR}/unknown.log}"
}

#-----------------------------------------------------------------------------------------
# FUNCTION: get_events_log
# Get path to events log file
# Returns:
#   Path to events.log
#-----------------------------------------------------------------------------------------
get_events_log() {
    echo "${SMARTI_EVENTS_LOG}"
}
