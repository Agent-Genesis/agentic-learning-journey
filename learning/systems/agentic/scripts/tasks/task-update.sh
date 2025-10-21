#!/bin/bash

# Task Update Script
# Usage: ./scripts/tasks/task-update.sh <task-id> <status> [progress]

set -uo pipefail

TASKS_FILE="$(dirname "$0")/../../tasks/TASKS.md"

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Helper function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}✅ $message${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

show_help() {
    echo "Task Update Script"
    echo
    echo "Usage: $0 <task-id> <status> [progress]"
    echo
    echo "Task IDs: 0001, 0003, 0004, 0005, 0006, 0007, 0008, 0009, 0010, 0011, 0012, 0013, 0014, 0015"
    echo
    echo "Status options:"
    echo "  pending     Set task to pending status"
    echo "  progress    Set task to in-progress status"
    echo "  done        Set task to completed status"
    echo
    echo "Progress (optional):"
    echo "  0-100       Progress percentage"
    echo
    echo "Examples:"
    echo "  $0 0015 done 100    # Mark task 0015 as completed"
    echo "  $0 0005 progress 25  # Mark task 0005 as 25% in progress"
    echo "  $0 0003 pending      # Mark task 0003 as pending"
}

validate_task_id() {
    if ! grep -q "Task $TASK_ID" "$TASKS_FILE"; then
        print_error "Task $TASK_ID not found"
        echo
        echo "Available task IDs:"
        grep -o 'Task [0-9]*' "$TASKS_FILE" | sort | uniq
        exit 1
    fi
}

validate_status() {
    case "$STATUS" in
        "pending"|"Pending")
            STATUS_TEXT="Pending"
            ;;
        "progress"|"in-progress"|"In Progress")
            STATUS_TEXT="In Progress"
            ;;
        "done"|"Done")
            STATUS_TEXT="Done"
            ;;
        *)
            print_error "Invalid status: $STATUS"
            echo "Valid options: pending, progress, done"
            exit 1
            ;;
    esac
}

validate_progress() {
    if [[ -n "$PROGRESS" ]]; then
        if ! [[ "$PROGRESS" =~ ^[0-9]+$ ]] || [[ "$PROGRESS" -lt 0 ]] || [[ "$PROGRESS" -gt 100 ]]; then
            print_error "Progress must be a number between 0 and 100"
            exit 1
        fi
    fi
}

update_task_status() {
    # Create backup
    cp "$TASKS_FILE" "$TASKS_FILE.backup.$(date +%Y%m%d_%H%M%S)"

    # Update overview table
    sed -i "s/|\s*$TASK_ID\s*|[^|]*|[^|]*|/| $TASK_ID | $STATUS_TEXT |/" "$TASKS_FILE"

    # Update detailed task section
    sed -i "/^### Task $TASK_ID:/,/^### Task [0-9]/ s/\*\*Status:\*\* [^*]*/**Status:** $STATUS_TEXT/" "$TASKS_FILE"

    # Update progress if provided
    if [[ -n "$PROGRESS" ]]; then
        sed -i "s/|\s*$TASK_ID\s*|[^|]*|[^|]*|[^|]*|[^|]*|/| $TASK_ID | $STATUS_TEXT |[^|]*|[^|]*| $PROGRESS% |/" "$TASKS_FILE"
    fi

    print_status "$GREEN" "Task $TASK_ID updated to $STATUS_TEXT"
    if [[ -n "$PROGRESS" ]]; then
        print_status "$GREEN" "Progress set to $PROGRESS%"
    fi
}

move_task_between_sections() {
    local temp_file=$(mktemp)

    # Extract the task content
    local task_content=$(awk "/^### Task $TASK_ID:/,/^### Task [0-9]/" "$TASKS_FILE")

    # Remove the task from current location
    awk "/^### Task $TASK_ID:/,/^### Task [0-9]/ {next} {print}" "$TASKS_FILE" > "$temp_file"

    # Add task to appropriate section based on status
    case "$STATUS_TEXT" in
        "In Progress")
            # Add before "🟡 In Progress" section
            awk '/^## 🟡 In Progress/ {print "'"$(echo "$task_content" | head -20)"'\n"; print; next} {print}' "$temp_file" > "$TASKS_FILE"
            ;;
        "Done")
            # Add before "✅ Done" section
            awk '/^## ✅ Done/ {print "'"$(echo "$task_content" | head -20)"'\n"; print; next} {print}' "$temp_file" > "$TASKS_FILE"
            ;;
        "Pending")
            # Add before "🔴 Todo (Backlog)" section
            awk '/^## 🔴 Todo/ {print "'"$(echo "$task_content" | head -20)"'\n"; print; next} {print}' "$temp_file" > "$TASKS_FILE"
            ;;
    esac

    rm "$temp_file"
}

# Main execution logic
if [[ $# -lt 2 ]]; then
    show_help
    exit 1
fi

case "$1" in
    "help"|"-h"|"--help")
        show_help
        exit 0
        ;;
esac

TASK_ID="$1"
STATUS="$2"
PROGRESS="${3:-}"

# Validate inputs
validate_task_id
validate_status
validate_progress

# Update task
update_task_status

# Update timestamp
sed -i "s/\*\*Last Updated\*\*: [^*]*/**Last Updated**: $(date '+%Y-%m-%d')/" "$TASKS_FILE"

print_status "$GREEN" "Task update completed successfully!"
echo
echo "📊 Current status of Task $TASK_ID:"
"$(dirname "$0")/task-filters.sh" id "$TASK_ID"