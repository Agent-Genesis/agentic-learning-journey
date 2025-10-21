#!/bin/bash

# TAC-1 Repository Cloning Script
# This script securely clones the TAC-1 repository using environment variables

set -e  # Exit on any error

echo "🚀 TAC-1 Repository Cloning Script"
echo "=================================="

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo "❌ Error: .env.local file not found!"
    echo ""
    echo "Please create it from the template:"
    echo "  cp .env.sample .env.local"
    echo "Then edit .env.local with your actual GitHub token."
    exit 1
fi

# Source environment variables
echo "📝 Loading environment variables from .env.local..."
source .env.local

# Check if token is set
if [ -z "$TAC_1_GITHUB_TOKEN" ] || [ "$TAC_1_GITHUB_TOKEN" = "your_personal_access_token_here" ]; then
    echo "❌ Error: TAC_1_GITHUB_TOKEN not set or still using placeholder value!"
    echo "Please edit .env.local and add your actual GitHub Personal Access Token."
    exit 1
fi

# Check if repo URL is set
if [ -z "$TAC_1_REPO_URL" ]; then
    echo "⚠️  Warning: TAC_1_REPO_URL not set, using default..."
    TAC_1_REPO_URL="https://github.com/disler/tac-1.git"
fi

# Extract repo name for directory
REPO_NAME=$(basename "$TAC_1_REPO_URL" .git)

# Check if directory already exists
if [ -d "$REPO_NAME" ]; then
    echo "⚠️  Warning: Directory '$REPO_NAME' already exists!"
    read -p "Do you want to remove it and re-clone? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🗑️  Removing existing directory..."
        rm -rf "$REPO_NAME"
    else
        echo "❌ Aborting. Repository already exists."
        exit 1
    fi
fi

# Clone the repository
echo "📥 Cloning TAC-1 repository..."
echo "   Repository: $TAC_1_REPO_URL"
echo "   Target directory: $REPO_NAME"
echo ""

# Construct the clone URL with token
CLONE_URL="https://${TAC_1_GITHUB_TOKEN}@github.com/disler/tac-1.git"

# Perform the clone
if git clone "$CLONE_URL"; then
    echo ""
    echo "✅ Success! Repository cloned to '$REPO_NAME/'"
    echo ""
    echo "📁 Next steps:"
    echo "   cd $REPO_NAME"
    echo "   ls -la"
    echo ""
    echo "🔐 Security reminder: Never commit .env.local to version control!"
else
    echo ""
    echo "❌ Failed to clone repository!"
    echo "Please check:"
    echo "   1. Your GitHub token is valid"
    echo "   2. The token has repository access permissions"
    echo "   3. Your internet connection is working"
    exit 1
fi