# 📂 Scripts Directory

This directory contains utility scripts for the agentic learning journey.

## 🚀 Available Scripts

### `clone-tac-1.sh`
Securely clones the TAC-1 course repository using environment variables.

**Usage:**
```bash
# Setup (one time)
cp .env.sample .env.local
# Edit .env.local with your actual GitHub token

# Clone the repository
./scripts/clone-tac-1.sh
```

**Features:**
- ✅ Secure environment variable loading
- ✅ Input validation and error checking
- ✅ Existing directory handling
- ✅ Clear success/error messages
- ✅ Security reminders

## 🔒 Security Notes

- Never commit `.env.local` to version control
- Keep your GitHub tokens secure and private
- Scripts automatically check for proper setup
- Environment files are properly ignored by `.gitignore`

## 📝 Adding New Scripts

When adding new scripts:
1. Make them executable (`chmod +x script-name.sh`)
2. Include proper error handling
3. Add documentation in this README
4. Follow security best practices
5. Use environment variables for sensitive data