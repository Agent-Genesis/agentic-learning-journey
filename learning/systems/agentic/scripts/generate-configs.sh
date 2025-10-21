#!/bin/bash

# Dynamic Configuration Generator Script
# This script generates personalized configuration files from templates

set -e  # Exit on any error

echo "🔧 Dynamic Configuration Generator"
echo "================================="

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo "❌ Error: .env.local file not found!"
    echo ""
    echo "Please create it from the template:"
    echo "  cp .env.sample .env.local"
    echo "Then edit .env.local with your actual information."
    exit 1
fi

# Source environment variables
echo "📝 Loading environment variables from .env.local..."
source .env.local

# Check if required variables are set
check_var() {
    local var_name="$1"
    local var_value="${!var_name}"

    if [ -z "$var_value" ] || [ "$var_value" = "Your Full Name" ] || [ "$var_value" = "your_github_username" ]; then
        echo "❌ Error: $var_name is not set or still using placeholder value!"
        echo "Please edit .env.local and set your actual $var_name."
        return 1
    fi
    return 0
}

# Validate required variables
echo "🔍 Validating environment variables..."
check_var "USER_NAME" || exit 1
check_var "USER_GITHUB_USERNAME" || exit 1

# Set defaults for optional variables
PROJECT_TITLE="${PROJECT_TITLE:-Agentic Learning Journey}"
PROJECT_DESCRIPTION="${PROJECT_DESCRIPTION:-Collaborative adventure in agentic systems}"
MAIN_AGENT_NAME="${MAIN_AGENT_NAME:-Claude}"
MAIN_AGENT_ROLE="${MAIN_AGENT_ROLE:-Agentic Orchestrator}"

echo ""
echo "✅ Configuration loaded:"
echo "   User: $USER_NAME"
echo "   GitHub: $USER_GITHUB_USERNAME"
echo "   Project: $PROJECT_TITLE"
echo ""

# Function to generate file from template
generate_file() {
    local template_file="$1"
    local output_file="$2"
    local description="$3"

    echo "🔄 Generating $description..."

    # Process template with environment variable substitution
    envsubst < "$template_file" > "$output_file"

    echo "   ✅ Created: $output_file"
}

# Generate CLAUDE.md (main agent)
echo ""
echo "📄 Generating Agent Configuration Files..."
if [ -f "CLAUDE.md.template" ]; then
    generate_file "CLAUDE.md.template" "CLAUDE.md" "Main Agent Configuration"
else
    echo "⚠️  Warning: CLAUDE.md.template not found, skipping..."
fi

# Generate workspace CLAUDE.md
if [ -f "workspace/CLAUDE.md.template" ]; then
    generate_file "workspace/CLAUDE.md.template" "workspace/CLAUDE.md" "Subordinate Agent Configuration"
else
    echo "⚠️  Warning: workspace/CLAUDE.md.template not found, skipping..."
fi

# Generate README.md
echo ""
echo "📖 Generating Documentation..."
if [ -f "README.md.template" ]; then
    generate_file "README.md.template" "README.md" "Main Documentation"
else
    echo "⚠️  Warning: README.md.template not found, skipping..."
fi

# Generate notes
if [ -f "notes/001-introduction.md.template" ]; then
    generate_file "notes/001-introduction.md.template" "notes/001-introduction.md" "Learning Notes"
else
    echo "⚠️  Warning: notes/001-introduction.md.template not found, skipping..."
fi

echo ""
echo "🎉 Configuration generation completed!"
echo ""
echo "📋 Next steps:"
echo "   1. Review the generated files"
echo "   2. Test your agentic setup"
echo "   3. Start your learning journey"
echo ""
echo "🔐 Security reminder: Never commit .env.local to version control!"