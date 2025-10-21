# 🚀 User Setup Guide - Agnostic Configuration System

This guide explains how to set up the agentic learning project for any user, making it completely agnostic.

## 🎯 What This System Does

The agnostic configuration system allows:
- **Any user** to personalize the project automatically
- **No hardcoded names** in configuration files
- **Dynamic generation** of all documentation and configurations
- **Secure handling** of personal information via environment variables

## 📋 Quick Setup (5 minutes)

### Step 1: Configure Your Environment
```bash
# Copy the template
cp .env.sample .env.local

# Edit with your information
nano .env.local
```

**Required variables in `.env.local`:**
```bash
USER_NAME=Your Full Name
USER_GITHUB_USERNAME=your_github_username
USER_EMAIL=your.email@example.com
PROJECT_TITLE=Your Agentic Learning Journey
PROJECT_DESCRIPTION=Your collaborative adventure in agentic systems
```

### Step 2: Run Initial Setup
```bash
# Complete automated setup
./scripts/setup-user.sh
```

### Step 3: Verify Configuration
```bash
# Regenerate configurations
./scripts/generate-configs.sh

# Check that files contain your name
grep "Your Name" README.md CLAUDE.md workspace/CLAUDE.md notes/001-introduction.md
```

## 🔄 How It Works

### Template System
All personal references use environment variable placeholders:
- `${USER_NAME}` - Your full name
- `${USER_GITHUB_USERNAME}` - Your GitHub username
- `${PROJECT_TITLE}` - Your project title
- `${MAIN_AGENT_NAME}` - Agent name (default: Claude)

### Files Generated from Templates
- `README.md` ← `README.md.template`
- `CLAUDE.md` ← `CLAUDE.md.template`
- `workspace/CLAUDE.md` ← `workspace/CLAUDE.md.template`
- `notes/001-introduction.md` ← `notes/001-introduction.md.template`

### Security Features
- ✅ `.env.local` never committed to Git
- ✅ All secrets in `.gitignore`
- ✅ Templates contain no personal data
- ✅ Generated files are local only

## 🛠️ Manual Generation (Optional)

If you want to regenerate files manually:
```bash
# Load environment variables
source .env.local

# Generate specific file
envsubst < README.md.template > README.md

# Or regenerate all files
./scripts/generate-configs.sh
```

## 📁 File Structure

```
agentic-learning-journey/
├── .env.sample              # Template for environment variables
├── .env.local               # Your personal config (NEVER COMMIT)
├── .gitignore               # Protects sensitive files
├── scripts/
│   ├── setup-user.sh        # Complete setup automation
│   ├── generate-configs.sh  # Configuration generator
│   └── clone-tac-1.sh       # TAC-1 repository cloner
├── *.template               # Template files with placeholders
├── README.md                # Generated main documentation
├── CLAUDE.md                # Generated main agent config
├── workspace/CLAUDE.md      # Generated subordinate agent config
└── notes/001-introduction.md # Generated learning notes
```

## 🎨 Customization Examples

### Example 1: Different User Name
```bash
# In .env.local
USER_NAME=Alice Johnson
PROJECT_TITLE=Alice's AI Learning Journey

# After running generate-configs.sh
# README.md will show "Alice's AI Learning Journey"
# CLAUDE.md will reference "Alice Johnson"
```

### Example 2: Different Agent Name
```bash
# In .env.local
MAIN_AGENT_NAME=BARD
MAIN_AGENT_ROLE=Creative Assistant

# After generation
# All files will reference "BARD" instead of "Claude"
```

### Example 3: Custom Project Description
```bash
# In .env.local
PROJECT_DESCRIPTION=Custom AI research and development journey

# After generation
# README.md will show your custom description
```

## 🔧 Troubleshooting

### Issue: Generated files still show placeholders
**Solution**: Ensure `.env.local` is properly configured:
```bash
# Check your configuration
cat .env.local

# Verify variables are loaded
source .env.local
echo $USER_NAME
```

### Issue: Script permission errors
**Solution**: Make scripts executable:
```bash
chmod +x scripts/*.sh
```

### Issue: Git wants to commit .env.local
**Solution**: Ensure `.gitignore` contains `.env.local`:
```bash
echo ".env.local" >> .gitignore
git rm --cached .env.local  # If already tracked
```

## 🔄 Updating Configurations

When you change `.env.local`:
```bash
# Regenerate all files
./scripts/generate-configs.sh

# Or regenerate specific file
source .env.local
envsubst < README.md.template > README.md
```

## 🎯 Best Practices

1. **Never commit `.env.local`** - it contains personal information
2. **Keep templates updated** - modify `.template` files for changes
3. **Use the setup script** for new installations
4. **Test after configuration** - verify files contain your information
5. **Back up templates** - they're preserved in `backup/` automatically

## 🚀 Ready to Start

Once setup is complete:
1. Your personalized configuration is ready
2. All documentation references you correctly
3. Agent configurations know who you are
4. You can begin your agentic learning journey!

**Start with**: `notes/001-introduction.md` to begin Lesson 001.