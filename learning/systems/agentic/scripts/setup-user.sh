#!/bin/bash

# Complete User Setup Script for Agentic Learning Journey
# This script sets up the entire project for a new user

set -e  # Exit on any error

echo "🚀 Agentic Learning Journey - User Setup"
echo "======================================"
echo ""

# Color codes for better UX
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_step() {
    echo -e "${BLUE}📋 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Step 1: Check if .env.local exists
print_step "Step 1: Checking environment configuration"
if [ ! -f ".env.local" ]; then
    print_warning ".env.local not found. Creating from template..."

    if [ ! -f ".env.sample" ]; then
        print_error ".env.sample not found! Cannot create environment file."
        exit 1
    fi

    cp .env.sample .env.local
    print_success "Created .env.local from template"

    echo ""
    echo "🔧 Please edit .env.local with your information:"
    echo "   nano .env.local"
    echo ""
    read -p "Press Enter once you've configured .env.local..."

    # Validate the file was configured
    if grep -q "Your Full Name" .env.local || grep -q "your_github_username" .env.local; then
        print_error "Please complete the configuration in .env.local before continuing."
        exit 1
    fi
else
    print_success "Found existing .env.local"
fi

# Step 2: Source environment variables
print_step "Step 2: Loading environment variables"
source .env.local

# Validate required variables
check_var() {
    local var_name="$1"
    local var_value="${!var_name}"

    if [ -z "$var_value" ] || [ "$var_value" = "Your Full Name" ] || [ "$var_value" = "your_github_username" ]; then
        print_error "$var_name is not properly configured in .env.local"
        return 1
    fi
    return 0
}

if ! check_var "USER_NAME" || ! check_var "USER_GITHUB_USERNAME"; then
    print_error "Please fix the environment variables in .env.local"
    exit 1
fi

print_success "Environment variables loaded successfully"
echo "   User: $USER_NAME"
echo "   GitHub: $USER_GITHUB_USERNAME"
echo ""

# Step 3: Generate personalized configurations
print_step "Step 3: Generating personalized configuration files"
if [ -f "scripts/generate-configs.sh" ]; then
    chmod +x scripts/generate-configs.sh
    ./scripts/generate-configs.sh
else
    print_warning "generate-configs.sh not found, skipping..."
fi
echo ""

# Step 4: Set up proper file permissions
print_step "Step 4: Setting up file permissions"
chmod +x scripts/*.sh 2>/dev/null || true
print_success "Made scripts executable"
echo ""

# Step 5: Initialize git repository if needed
print_step "Step 5: Checking Git configuration"
if [ ! -d ".git" ]; then
    print_warning "No git repository found. Initializing..."
    git init

    # Set up user git config if not set
    if [ -n "$USER_EMAIL" ]; then
        git config user.email "$USER_EMAIL"
    fi

    if [ -n "$USER_GITHUB_USERNAME" ]; then
        git config user.name "$USER_NAME"
    fi

    print_success "Git repository initialized"
else
    print_success "Git repository already exists"
fi
echo ""

# Step 6: Create initial backup of templates
print_step "Step 6: Creating backup of templates"
if [ ! -d "backup" ]; then
    mkdir -p backup
fi

# Backup original templates
cp *.template backup/ 2>/dev/null || true
cp workspace/*.template backup/ 2>/dev/null || true
cp notes/*.template backup/ 2>/dev/null || true
print_success "Templates backed up to backup/ directory"
echo ""

# Step 7: Final validation
print_step "Step 7: Final validation"

# Check that generated files exist and contain user data
files_to_check=("CLAUDE.md" "README.md" "workspace/CLAUDE.md" "notes/001-introduction.md")
all_good=true

for file in "${files_to_check[@]}"; do
    if [ -f "$file" ]; then
        if grep -q "\${USER_NAME}" "$file"; then
            print_warning "$file still contains unprocessed placeholders"
            all_good=false
        elif grep -q "$USER_NAME" "$file"; then
            print_success "$file is properly personalized"
        else
            print_warning "$file may not be properly personalized"
            all_good=false
        fi
    else
        print_warning "$file not found"
        all_good=false
    fi
done

echo ""
# Step 8: Display summary and next steps
echo "🎉 Setup Complete!"
echo "=================="

if [ "$all_good" = true ]; then
    print_success "All files are properly configured!"
else
    print_warning "Some files may need attention. Check the warnings above."
fi

echo ""
echo "📋 Your personalized agentic learning journey is ready!"
echo ""
echo "🚀 Next steps:"
echo "   1. Review your generated files:"
echo "      - CLAUDE.md (Main agent configuration)"
echo "      - README.md (Your project documentation)"
echo "      - workspace/CLAUDE.md (Subordinate agent configuration)"
echo ""
echo "   2. Test your setup:"
echo "      - Run: ./scripts/generate-configs.sh"
echo "      - Check that all files contain your name"
echo ""
echo "   3. Start your learning:"
echo "      - Read: notes/001-introduction.md"
echo "      - Begin Lesson 001 of the TAC course"
echo ""
echo "   4. Configure Git remote (if needed):"
echo "      - git remote add origin https://github.com/${USER_GITHUB_USERNAME}/your-repo.git"
echo ""
echo "🔐 Security reminder:"
echo "   - Never commit .env.local to version control"
echo "   - Keep your GitHub tokens secure"
echo "   - The .gitignore file protects sensitive data"
echo ""
echo "📚 For help:"
echo "   - Check: scripts/README.md"
echo "   - Review: docs/architecture-hierarchique-agentic.md"
echo ""
print_success "Enjoy your agentic learning journey, ${USER_NAME}!"