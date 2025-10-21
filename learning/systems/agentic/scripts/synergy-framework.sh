#!/bin/bash

# Synergy Framework - Collaborative Functions
# Following STOP, REPORT, ASK, WAIT philosophy
# Author: Agentic System
# Version: 1.0.0

# set -euo pipefail  # Disabled for better compatibility

# Global variables
SYNERGY_LOG_DIR="${SYNERGY_LOG_DIR:-$(pwd)/logs}"
SYNERGY_CONFIG_FILE="${SYNERGY_CONFIG_FILE:-$(pwd)/config/synergy.conf}"
SYNERGY_STATE_FILE="${SYNERGY_STATE_FILE:-$(pwd)/.synergy_state}"
SYNERGY_PID_FILE="${SYNERGY_PID_FILE:-$(pwd)/.synergy_pid}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Logging levels
LOG_DEBUG=0
LOG_INFO=1
LOG_WARN=2
LOG_ERROR=3
LOG_CURRENT_LEVEL=${LOG_CURRENT_LEVEL:-$LOG_INFO}

# Initialize the Synergy Framework
init_synergy_framework() {
    local log_level="${1:-$LOG_INFO}"
    local config_file="${2:-$SYNERGY_CONFIG_FILE}"

    log_debug "Initializing Synergy Framework..."

    # Create necessary directories
    mkdir -p "$SYNERGY_LOG_DIR"
    mkdir -p "$(dirname "$SYNERGY_CONFIG_FILE")"
    mkdir -p "$(dirname "$SYNERGY_STATE_FILE")"

    # Set log level
    LOG_CURRENT_LEVEL="$log_level"

    # Create default config if not exists
    if [[ ! -f "$config_file" ]]; then
        create_default_config "$config_file"
    fi

    # Source configuration
    if [[ -f "$config_file" ]]; then
        source "$config_file"
        log_debug "Configuration loaded from $config_file"
    else
        log_warn "Configuration file not found: $config_file"
    fi

    # Initialize state
    initialize_state

    # Setup signal handlers
    setup_signal_handlers

    # Store PID for cleanup
    echo $$ > "$SYNERGY_PID_FILE"

    log_info "Synergy Framework initialized successfully"
    log_info "Log directory: $SYNERGY_LOG_DIR"
    log_info "Config file: $config_file"

    return 0
}

# Create default configuration
create_default_config() {
    local config_file="$1"

    cat > "$config_file" << 'EOF'
# Synergy Framework Configuration
# Generated automatically on first run

# Communication settings
SYNERGY_TIMEOUT="${SYNERGY_TIMEOUT:-30}"
SYNERGY_RETRY_COUNT="${SYNERGY_RETRY_COUNT:-3}"
SYNERGY_RETRY_DELAY="${SYNERGY_RETRY_DELAY:-2}"

# Decision making settings
DECISION_TIMEOUT="${DECISION_TIMEOUT:-60}"
DECISION_RETRY_COUNT="${DECISION_RETRY_COUNT:-3}"
AUTO_ACCEPT_DECISIONS="${AUTO_ACCEPT_DECISIONS:-false}"

# Progress reporting
PROGRESS_UPDATE_INTERVAL="${PROGRESS_UPDATE_INTERVAL:-5}"
PROGRESS_LOG_LEVEL="${PROGRESS_LOG_LEVEL:-info}"

# Task management
MAX_CONCURRENT_TASKS="${MAX_CONCURRENT_TASKS:-3}"
TASK_TIMEOUT="${TASK_TIMEOUT:-300}"
TASK_CLEANUP_ON_EXIT="${TASK_CLEANUP_ON_EXIT:-true}"

# Reflection settings
REFLECTION_ENABLED="${REFLECTION_ENABLED:-true}"
REFLECTION_DEPTH="${REFLECTION_DEPTH:-3}"
REFLECTION_SAVE_INSIGHTS="${REFLECTION_SAVE_INSIGHTS:-true}"
EOF

    log_info "Default configuration created: $config_file"
}

# Initialize state management
initialize_state() {
    if [[ ! -f "$SYNERGY_STATE_FILE" ]]; then
        cat > "$SYNERGY_STATE_FILE" << 'EOF'
# Synergy Framework State
SYNERGY_ACTIVE_TASKS=()
SYNERGY_COMPLETED_TASKS=()
SYNERGY_DECISIONS_PENDING=()
SYNERGY_INSIGHTS=[]
SYNERGY_SESSION_START="$(date -Iseconds)"
EOF
    fi

    source "$SYNERGY_STATE_FILE"
    log_debug "State initialized from $SYNERGY_STATE_FILE"
}

# Setup signal handlers for cleanup
setup_signal_handlers() {
    trap 'cleanup_on_exit' EXIT
    trap 'cleanup_on_exit; exit 130' INT
    trap 'cleanup_on_exit; exit 143' TERM

    log_debug "Signal handlers configured"
}

# Cleanup function
cleanup_on_exit() {
    if [[ -f "$SYNERGY_PID_FILE" ]] && [[ $(cat "$SYNERGY_PID_FILE") == $$ ]]; then
        log_info "Cleaning up Synergy Framework..."

        # Save final state
        save_state

        # Clean up PID file
        rm -f "$SYNERGY_PID_FILE"

        log_info "Cleanup completed"
    fi
}

# Save current state
save_state() {
    local temp_state="${SYNERGY_STATE_FILE}.tmp"

    cat > "$temp_state" << EOF
# Synergy Framework State
SYNERGY_ACTIVE_TASKS=($(printf '"%s" ' "${SYNERGY_ACTIVE_TASKS[@]}"))
SYNERGY_COMPLETED_TASKS=($(printf '"%s" ' "${SYNERGY_COMPLETED_TASKS[@]}"))
SYNERGY_DECISIONS_PENDING=($(printf '"%s" ' "${SYNERGY_DECISIONS_PENDING[@]}"))
SYNERGY_INSIGHTS=($(printf '"%s" ' "${SYNERGY_INSIGHTS[@]}"))
SYNERGY_SESSION_START="$SYNERGY_SESSION_START"
SYNERGY_LAST_UPDATE="$(date -Iseconds)"
EOF

    mv "$temp_state" "$SYNERGY_STATE_FILE"
    log_debug "State saved to $SYNERGY_STATE_FILE"
}

# Communicate task start - STOP phase
communicate_task_start() {
    local task_name="$1"
    local task_description="${2:-}"
    local task_priority="${3:-normal}"
    local estimated_duration="${4:-unknown}"

    log_info "=== TASK START ==="
    log_info "Task: $task_name"
    [[ -n "$task_description" ]] && log_info "Description: $task_description"
    log_info "Priority: $task_priority"
    log_info "Estimated duration: $estimated_duration"
    log_info "Start time: $(date -Iseconds)"

    # Add to active tasks
    SYNERGY_ACTIVE_TASKS+=("$task_name")

    # Save state
    save_state

    # Log to file
    local task_log="$SYNERGY_LOG_DIR/task_${task_name//[^a-zA-Z0-9]/_}_$(date +%Y%m%d_%H%M%S).log"
    {
        echo "Task started: $(date -Iseconds)"
        echo "Task name: $task_name"
        echo "Description: $task_description"
        echo "Priority: $task_priority"
        echo "Estimated duration: $estimated_duration"
        echo "---"
    } > "$task_log"

    log_info "Task logged to: $task_log"
    return 0
}

# Report progress - REPORT phase
report_progress() {
    local task_name="$1"
    local progress_percentage="$2"
    local status_message="${3:-}"
    local current_step="${4:-}"
    local total_steps="${5:-}"

    local timestamp=$(date -Iseconds)

    # Validate progress percentage
    if ! [[ "$progress_percentage" =~ ^[0-9]+$ ]] || [[ "$progress_percentage" -gt 100 ]]; then
        log_error "Invalid progress percentage: $progress_percentage"
        return 1
    fi

    # Build progress bar
    local bar_length=40
    local filled_length=$((progress_percentage * bar_length / 100))
    local bar=""

    for ((i=0; i<filled_length; i++)); do
        bar+="█"
    done
    for ((i=filled_length; i<bar_length; i++)); do
        bar+="░"
    done

    # Format step information
    local step_info=""
    if [[ -n "$current_step" ]]; then
        if [[ -n "$total_steps" ]]; then
            step_info=" (Step $current_step/$total_steps)"
        else
            step_info=" (Step: $current_step)"
        fi
    fi

    # Output progress
    echo -e "${CYAN}=== PROGRESS REPORT ===${NC}"
    echo -e "${BLUE}Task:${NC} $task_name$step_info"
    echo -e "${BLUE}Progress:${NC} [$bar] $progress_percentage%"
    [[ -n "$status_message" ]] && echo -e "${BLUE}Status:${NC} $status_message"
    echo -e "${BLUE}Time:${NC} $timestamp"
    echo

    # Log to file
    local task_log="$SYNERGY_LOG_DIR/task_${task_name//[^a-zA-Z0-9]/_}_$(date +%Y%m%d_*)*.log"
    local latest_log=$(ls -t $task_log 2>/dev/null | head -1)

    if [[ -n "$latest_log" ]]; then
        {
            echo "Progress update: $timestamp"
            echo "Progress: $progress_percentage%"
            [[ -n "$status_message" ]] && echo "Status: $status_message"
            [[ -n "$current_step" ]] && echo "Current step: $current_step"
            [[ -n "$total_steps" ]] && echo "Total steps: $total_steps"
            echo "---"
        } >> "$latest_log"
    fi

    # Check if task is complete
    if [[ "$progress_percentage" -eq 100 ]]; then
        complete_task "$task_name"
    fi

    return 0
}

# Request decision - ASK phase
request_decision() {
    local decision_point="$1"
    local options_array="$2"
    local context="${3:-}"
    local timeout="${4:-$DECISION_TIMEOUT}"
    local auto_accept="${5:-$AUTO_ACCEPT_DECISIONS}"

    log_info "=== DECISION REQUESTED ==="
    log_info "Decision point: $decision_point"
    [[ -n "$context" ]] && log_info "Context: $context"

    # Parse options
    local options=()
    if [[ -n "$options_array" ]]; then
        IFS=',' read -ra options <<< "$options_array"
    fi

    if [[ ${#options[@]} -eq 0 ]]; then
        log_error "No options provided for decision"
        return 1
    fi

    # Display options
    echo -e "${YELLOW}Available options:${NC}"
    for i in "${!options[@]}"; do
        echo -e "  ${GREEN}$((i+1))${NC}) ${options[i]}"
    done

    # Add to pending decisions
    SYNERGY_DECISIONS_PENDING+=("$decision_point")
    save_state

    # Wait for decision if not auto-accept
    local decision=""
    if [[ "$auto_accept" != "true" ]]; then
        echo -e "${PURPLE}Please select an option (1-${#options[@]}) or press Enter for default (1):${NC}"

        local start_time=$(date +%s)
        local end_time=$((start_time + timeout))

        while [[ $(date +%s) -lt $end_time ]]; do
            if read -t 5 -r response 2>/dev/null; then
                if [[ -z "$response" ]]; then
                    decision=1
                    break
                elif [[ "$response" =~ ^[0-9]+$ ]] && [[ "$response" -ge 1 ]] && [[ "$response" -le ${#options[@]} ]]; then
                    decision="$response"
                    break
                else
                    echo -e "${RED}Invalid option. Please choose 1-${#options[@]}:${NC}"
                fi
            fi
        done

        if [[ -z "$decision" ]]; then
            log_warn "Decision timeout, using default option"
            decision=1
        fi
    else
        log_info "Auto-accept mode, using first option"
        decision=1
    fi

    local selected_option="${options[$((decision-1))]}"

    # Record decision
    local decision_log="$SYNERGY_LOG_DIR/decisions_$(date +%Y%m%d).log"
    {
        echo "Decision made: $(date -Iseconds)"
        echo "Decision point: $decision_point"
        echo "Context: $context"
        echo "Options: ${options[*]}"
        echo "Selected: $selected_option (Option $decision)"
        echo "---"
    } >> "$decision_log"

    # Remove from pending decisions
    SYNERGY_DECISIONS_PENDING=("${SYNERGY_DECISIONS_PENDING[@]/$decision_point}")
    save_state

    log_info "Decision made: $selected_option"

    # Return the selected option
    echo "$selected_option"
    return 0
}

# Reflect on task - reflection phase
reflect_on_task() {
    local task_name="$1"
    local outcome="${2:-completed}"
    local insights="${3:-}"
    local lessons_learned="${4:-}"
    local improvement_suggestions="${5:-}"

    if [[ "$REFLECTION_ENABLED" != "true" ]]; then
        log_debug "Reflection is disabled"
        return 0
    fi

    log_info "=== TASK REFLECTION ==="
    log_info "Task: $task_name"
    log_info "Outcome: $outcome"

    local reflection_data=""
    local timestamp=$(date -Iseconds)

    # Generate insights if not provided
    if [[ -z "$insights" ]]; then
        insights=$(generate_insights "$task_name" "$outcome")
    fi

    reflection_data="Reflection for task '$task_name' ($outcome) at $timestamp:\n"
    reflection_data+="Insights: $insights\n"

    if [[ -n "$lessons_learned" ]]; then
        reflection_data+="Lessons learned: $lessons_learned\n"
    fi

    if [[ -n "$improvement_suggestions" ]]; then
        reflection_data+="Improvement suggestions: $improvement_suggestions\n"
    fi

    # Save reflection
    local reflection_log="$SYNERGY_LOG_DIR/reflections_$(date +%Y%m%d).log"
    {
        echo "---"
        echo "$reflection_data"
        echo "Timestamp: $timestamp"
    } >> "$reflection_log"

    # Add to insights array if enabled
    if [[ "$REFLECTION_SAVE_INSIGHTS" == "true" ]]; then
        SYNERGY_INSIGHTS+=("$task_name:$insights")
        save_state
    fi

    log_info "Reflection completed and logged"
    return 0
}

# Generate insights automatically
generate_insights() {
    local task_name="$1"
    local outcome="$2"

    local insights=""

    # Check task duration
    local task_log="$SYNERGY_LOG_DIR/task_${task_name//[^a-zA-Z0-9]/_}_$(date +%Y%m%d_*)*.log"
    local latest_log=$(ls -t $task_log 2>/dev/null | head -1)

    if [[ -n "$latest_log" ]]; then
        local start_time=$(grep "Task started:" "$latest_log" | head -1 | cut -d' ' -f3-)
        local end_time=$(date -Iseconds)

        if [[ -n "$start_time" ]]; then
            local duration_seconds=$(date -d "$end_time" +%s) - $(date -d "$start_time" +%s)
            local duration_minutes=$((duration_seconds / 60))

            if [[ $duration_minutes -gt 30 ]]; then
                insights+="Task took longer than expected (${duration_minutes} minutes). "
            elif [[ $duration_minutes -lt 5 ]]; then
                insights+="Task completed quickly (${duration_minutes} minutes). "
            fi
        fi
    fi

    # Analyze outcome
    case "$outcome" in
        "completed")
            insights+="Task completed successfully. "
            ;;
        "failed")
            insights+="Task failed. Consider retry strategy. "
            ;;
        "partial")
            insights+="Task partially completed. Review remaining work. "
            ;;
        *)
            insights+="Unknown outcome. Please review. "
            ;;
    esac

    # Add default insight if none generated
    if [[ -z "$insights" ]]; then
        insights="Task processed. Review logs for details."
    fi

    echo "$insights"
}

# Complete task
complete_task() {
    local task_name="$1"

    # Remove from active tasks
    local new_active_tasks=()
    for task in "${SYNERGY_ACTIVE_TASKS[@]}"; do
        if [[ "$task" != "$task_name" ]]; then
            new_active_tasks+=("$task")
        fi
    done
    SYNERGY_ACTIVE_TASKS=("${new_active_tasks[@]}")

    # Add to completed tasks
    SYNERGY_COMPLETED_TASKS+=("$task_name")

    # Save state
    save_state

    log_info "Task marked as completed: $task_name"
}

# Logging functions
log_debug() {
    [[ $LOG_CURRENT_LEVEL -le $LOG_DEBUG ]] && echo -e "${PURPLE}[DEBUG]${NC} $(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$SYNERGY_LOG_DIR/synergy.log"
}

log_info() {
    [[ $LOG_CURRENT_LEVEL -le $LOG_INFO ]] && echo -e "${GREEN}[INFO]${NC} $(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$SYNERGY_LOG_DIR/synergy.log"
}

log_warn() {
    [[ $LOG_CURRENT_LEVEL -le $LOG_WARN ]] && echo -e "${YELLOW}[WARN]${NC} $(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$SYNERGY_LOG_DIR/synergy.log"
}

log_error() {
    [[ $LOG_CURRENT_LEVEL -le $LOG_ERROR ]] && echo -e "${RED}[ERROR]${NC} $(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$SYNERGY_LOG_DIR/synergy.log"
}

# Get framework status
get_synergy_status() {
    echo "=== SYNERGY FRAMEWORK STATUS ==="
    echo "Session start: $SYNERGY_SESSION_START"
    echo "Active tasks: ${#SYNERGY_ACTIVE_TASKS[@]}"
    echo "Completed tasks: ${#SYNERGY_COMPLETED_TASKS[@]}"
    echo "Pending decisions: ${#SYNERGY_DECISIONS_PENDING[@]}"
    echo "Saved insights: ${#SYNERGY_INSIGHTS[@]}"
    echo

    if [[ ${#SYNERGY_ACTIVE_TASKS[@]} -gt 0 ]]; then
        echo "Active tasks:"
        for task in "${SYNERGY_ACTIVE_TASKS[@]}"; do
            echo "  - $task"
        done
        echo
    fi

    if [[ ${#SYNERGY_DECISIONS_PENDING[@]} -gt 0 ]]; then
        echo "Pending decisions:"
        for decision in "${SYNERGY_DECISIONS_PENDING[@]}"; do
            echo "  - $decision"
        done
        echo
    fi

    return 0
}

# List available functions
list_functions() {
    echo "=== SYNERGY FRAMEWORK FUNCTIONS ==="
    echo "init_synergy_framework [log_level] [config_file]"
    echo "communicate_task_start <task_name> [description] [priority] [duration]"
    echo "report_progress <task_name> <percentage> [message] [current_step] [total_steps]"
    echo "request_decision <decision_point> <options> [context] [timeout] [auto_accept]"
    echo "reflect_on_task <task_name> [outcome] [insights] [lessons] [improvements]"
    echo "get_synergy_status"
    echo "list_functions"
    echo
    echo "Logging functions:"
    echo "log_debug <message>"
    echo "log_info <message>"
    echo "log_warn <message>"
    echo "log_error <message>"
    echo
    return 0
}

# Export functions if sourced
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    export -f init_synergy_framework
    export -f communicate_task_start
    export -f report_progress
    export -f request_decision
    export -f reflect_on_task
    export -f get_synergy_status
    export -f list_functions
    export -f log_debug log_info log_warn log_error
else
    # Script mode - show usage
    echo "Synergy Framework - Collaborative Functions"
    echo "Source this file to use the functions:"
    echo "  source $0"
    echo
    list_functions
fi