#!/bin/bash

# Task Management Filter Scripts
# Usage: ./scripts/tasks/task-filters.sh [filter-type]

set -euo pipefail

TASKS_FILE="$(dirname "$0")/../../tasks/TASKS.md"
FILTER_TYPE="${1:-help}"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper function to print colored output
print_section() {
    local color=$1
    local title=$2
    echo -e "${color}=== $title ===${NC}"
}

show_help() {
    echo "Task Management Filter Scripts"
    echo
    echo "Usage: $0 [filter-type]"
    echo
    echo "Available filters:"
    echo "  help        Show this help message"
    echo "  critical    Show critical priority tasks"
    echo "  high        Show high priority tasks"
    echo "  medium      Show medium priority tasks"
    echo "  standard    Show standard priority tasks"
    echo "  future      Show future consideration tasks"
    echo "  todo        Show all pending tasks"
    echo "  progress    Show progress summary"
    echo "  stats       Show task statistics"
    echo "  search      Search tasks by keyword"
    echo "  id          Show task by ID"
    echo
    echo "Examples:"
    echo "  $0 critical    # Show critical priority tasks"
    echo "  $0 search MCP  # Search for tasks containing 'MCP'"
    echo "  $0 id 0005     # Show task 0005 details"
}

show_critical_tasks() {
    print_section "$RED" "CRITICAL PRIORITY TASKS"
    echo

    # Extract critical tasks from the overview table
    awk '/\|\s*0015\s*\|.*Critical/ {found=1} found && /^\|/ {print} /^\s*## 🚨 Critical/ {exit}' "$TASKS_FILE" | head -20

    echo
    echo "🔍 Critical Tasks Overview:"
    echo "- Task 0015: Behavioral Issue - Solution Prematurity (CRITICAL)"
    echo "- Task 0001: Critical Error - Global Installation Violation (CRITICAL)"
}

show_high_priority_tasks() {
    print_section "$YELLOW" "HIGH PRIORITY TASKS"
    echo

    awk '/\|\s*000[56]\s*\|.*High/ {found=1} found && /^\|/ {print} /^\s*## 🔥 High/ {exit}' "$TASKS_FILE"

    echo
    echo "🔥 High Priority Tasks:"
    echo "- Task 0005: Fix environment file variable count alignment"
    echo "- Task 0006: Improve zai-mcp-server vision capabilities"
}

show_medium_priority_tasks() {
    print_section "$BLUE" "MEDIUM PRIORITY TASKS"
    echo

    awk '/\|\s*000[3-9]\s*\|.*Medium/ {found=1} found && /^\|/ {print} /^\s*## 📋 Medium/ {exit}' "$TASKS_FILE"

    echo
    echo "📋 Medium Priority Tasks:"
    echo "- Task 0003: Rename and relocate CONFIGURATION_KNOWLEDGE.md"
    echo "- Task 0004: Research and document UV by Astral"
    echo "- Task 0007: Create regular MCP server maintenance schedule"
    echo "- Task 0008: Update CONFIGURATION_KNOWLEDGE.md with latest test results"
    echo "- Task 0009: Create MCP server troubleshooting guide"
}

show_standard_priority_tasks() {
    print_section "$GREEN" "STANDARD PRIORITY TASKS"
    echo

    awk '/\|\s*001[0-3]\s*\|.*Standard/ {found=1} found && /^\|/ {print} /^\s*## 🔧 Standard/ {exit}' "$TASKS_FILE"

    echo
    echo "🔧 Standard Priority Tasks:"
    echo "- Task 0010: Create configuration audit procedure"
    echo "- Task 0011: Create backup and recovery procedure"
    echo "- Task 0012: Add MCP server performance monitoring"
    echo "- Task 0013: Create automated configuration validation script"
}

show_future_tasks() {
    print_section "$BLUE" "FUTURE CONSIDERATIONS"
    echo

    awk '/\|\s*0014\s*\|.*Future/ {found=1} found && /^\|/ {print} /^\s*## 🔮 Future/ {exit}' "$TASKS_FILE"

    echo
    echo "🔮 Future Considerations:"
    echo "- Task 0014: Test UV integration with GLM Coding Plan"
}

show_all_pending_tasks() {
    print_section "$YELLOW" "ALL PENDING TASKS"
    echo

    echo "Total pending tasks: $(grep -c 'Pending' "$TASKS_FILE")"
    echo

    # Show overview table
    awk '/^| ID/,/^---/ {print}' "$TASKS_FILE"

    echo
    echo "📊 Task Distribution by Priority:"
    echo "- Critical: 2 tasks"
    echo "- High: 2 tasks"
    echo "- Medium: 5 tasks"
    echo "- Standard: 4 tasks"
    echo "- Future: 1 task"
}

show_progress_summary() {
    print_section "$GREEN" "PROGRESS SUMMARY"
    echo

    local total=$(grep -c 'Task [0-9]' "$TASKS_FILE" || echo "14")
    local pending=$(grep -c 'Pending' "$TASKS_FILE" || echo "14")
    local in_progress=$(grep -c 'In Progress' "$TASKS_FILE" || echo "0")
    local done=$(grep -c 'Done' "$TASKS_FILE" || echo "0")

    echo "📈 Overall Progress:"
    echo "  Total Tasks: $total"
    echo "  Pending: $pending ($(( pending * 100 / total ))%)"
    echo "  In Progress: $in_progress ($(( in_progress * 100 / total ))%)"
    echo "  Done: $done ($(( done * 100 / total ))%)"
    echo

    echo "🎯 Priority Breakdown:"
    echo "  Critical: $(grep -c 'Critical' "$TASKS_FILE") tasks"
    echo "  High: $(grep -c 'High' "$TASKS_FILE") tasks"
    echo "  Medium: $(grep -c 'Medium' "$TASKS_FILE") tasks"
    echo "  Standard: $(grep -c 'Standard' "$TASKS_FILE") tasks"
    echo "  Future: $(grep -c 'Future' "$TASKS_FILE") tasks"
}

show_statistics() {
    print_section "$BLUE" "TASK STATISTICS"
    echo

    echo "📊 File Statistics:"
    echo "  TASKS.md size: $(wc -l < "$TASKS_FILE") lines"
    echo "  Total sections: $(grep -c '^##' "$TASKS_FILE")"
    echo "  Total tasks: $(grep -c '^### Task [0-9]' "$TASKS_FILE")"
    echo

    echo "🏷️ Task Types:"
    echo "  Documentation: 4 tasks"
    echo "  Process: 2 tasks"
    echo "  Research: 2 tasks"
    echo "  Automation: 1 task"
    echo "  Monitoring: 1 task"
    echo "  Maintenance: 1 task"
    echo "  Bug Fix: 1 task"
    echo "  Enhancement: 1 task"
    echo "  Behavioral: 1 task"

    echo
    echo "📅 Creation Date Analysis:"
    echo "  All tasks created on: 2025-10-21"
    echo "  Days since creation: $(( ($(date +%s) - $(date -d '2025-10-21' +%s)) / 86400 )) days"
}

search_tasks() {
    local keyword="$1"
    if [[ -z "$keyword" ]]; then
        echo "❌ Please provide a search keyword"
        echo "Usage: $0 search <keyword>"
        return 1
    fi

    print_section "$YELLOW" "SEARCH RESULTS FOR: $keyword"
    echo

    # Search in overview table
    echo "📋 Matches in Overview Table:"
    grep -i "$keyword" "$TASKS_FILE" | head -10
    echo

    # Search in detailed task sections
    echo "📝 Matches in Task Details:"
    awk -v keyword="$keyword" '
    /^### Task [0-9]/ {task=$0}
    tolower($0) ~ tolower(keyword) && task {
        print task
        print "  " $0
        print ""
        task=""
    }
    ' "$TASKS_FILE"
}

show_task_by_id() {
    local task_id="$1"
    if [[ -z "$task_id" ]]; then
        echo "❌ Please provide a task ID"
        echo "Usage: $0 id <task-id>"
        echo "Example: $0 id 0005"
        return 1
    fi

    print_section "$GREEN" "TASK $task_id DETAILS"
    echo

    # Find and display the task section
    awk -v task_id="$task_id" '
    /^### Task '"$task_id"'/ {found=1}
    found && /^### Task [0-9]/ && !/^### Task '"$task_id"'/ {exit}
    found {print}
    ' "$TASKS_FILE"

    if ! grep -q "Task $task_id" "$TASKS_FILE"; then
        echo "❌ Task $task_id not found"
        echo
        echo "Available task IDs:"
        grep -o 'Task [0-9]*' "$TASKS_FILE" | sort | uniq
    fi
}

# Main execution logic
case "$FILTER_TYPE" in
    "help"|"-h"|"--help")
        show_help
        ;;
    "critical")
        show_critical_tasks
        ;;
    "high")
        show_high_priority_tasks
        ;;
    "medium")
        show_medium_priority_tasks
        ;;
    "standard")
        show_standard_priority_tasks
        ;;
    "future")
        show_future_tasks
        ;;
    "todo"|"pending")
        show_all_pending_tasks
        ;;
    "progress")
        show_progress_summary
        ;;
    "stats"|"statistics")
        show_statistics
        ;;
    "search")
        search_tasks "$2"
        ;;
    "id")
        show_task_by_id "$2"
        ;;
    *)
        echo "❌ Unknown filter type: $FILTER_TYPE"
        echo
        show_help
        exit 1
        ;;
esac