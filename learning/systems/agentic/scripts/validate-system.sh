#!/bin/bash

# Synergy Framework Validation Script
# Tests complete system functionality and user scenario simulation

# Note: Removed 'set -e' to allow graceful error handling in validation script

# Load environment variables
source .env.local

# Load Synergy Framework
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="validate-system.sh"
if [ -f "$SCRIPT_DIR/synergy-framework.sh" ]; then
    source "$SCRIPT_DIR/synergy-framework.sh"
    init_synergy_framework
else
    echo "⚠️  Warning: Synergy Framework not found, using basic mode"
fi

echo "🧪 Synergy Framework System Validation"
echo "===================================="
echo ""

# =============================================================================
# STEP 1: COMMUNICATE TASK INTENT
# =============================================================================

if [ -f "$SCRIPT_DIR/synergy-framework.sh" ]; then
    communicate_task_start \
        "System Validation" \
        "Test complete Synergy Framework functionality with user scenario simulation" \
        "Template processing, script execution, collaborative functions, and end-to-end workflow" \
        "All system components: templates, scripts, framework functions, generated files" \
        "3-5 minutes" \
        "System ready for testing"
fi

# Color codes for test results
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TESTS_TOTAL=0
TESTS_PASSED=0
TESTS_FAILED=0

# Helper functions
print_test() {
    echo -e "${BLUE}🧪 Testing: $1${NC}"
    ((TESTS_TOTAL++))
}

print_pass() {
    echo -e "${GREEN}✅ PASS: $1${NC}"
    ((TESTS_PASSED++))
}

print_fail() {
    echo -e "${RED}❌ FAIL: $1${NC}"
    ((TESTS_FAILED++))
}

print_warning() {
    echo -e "${YELLOW}⚠️  WARNING: $1${NC}"
}

# =============================================================================
# STEP 2: TEMPLATE SYSTEM VALIDATION
# =============================================================================

echo ""
echo "📋 Template System Validation"
echo "============================="

# Test 1: Check required templates exist
print_test "Required template files exist"
required_templates=("CLAUDE.md.template" "workspace/CLAUDE.md.template" "README.md.template" "notes/001-introduction.md.template")
templates_missing=false

for template in "${required_templates[@]}"; do
    if [ -f "$template" ]; then
        echo "   ✅ $template found"
    else
        echo "   ❌ $template missing"
        templates_missing=true
    fi
done

if [ "$templates_missing" = false ]; then
    print_pass "All required templates found"
else
    print_fail "Some templates are missing"
fi

# Test 2: Check templates use proper placeholders
print_test "Templates use correct placeholder syntax"
placeholders_ok=true

for template in "${required_templates[@]}"; do
    if [ -f "$template" ]; then
        if grep -q "\${USER_NAME}" "$template"; then
            echo "   ✅ $template uses \${USER_NAME} placeholder"
        else
            echo "   ❌ $template missing \${USER_NAME} placeholder"
            placeholders_ok=false
        fi
    fi
done

if [ "$placeholders_ok" = true ]; then
    print_pass "All templates use correct placeholder syntax"
else
    print_fail "Some templates have incorrect placeholder syntax"
fi

# =============================================================================
# STEP 3: SCRIPT INTEGRATION VALIDATION
# =============================================================================

echo ""
echo "📋 Script Integration Validation"
echo "==============================="

# Test 3: Check scripts have Synergy Framework integration
print_test "Scripts integrate Synergy Framework"
scripts_ok=true

for script in "generate-configs.sh" "setup-user.sh"; do
    if [ -f "scripts/$script" ]; then
        if grep -q "synergy-framework.sh" "scripts/$script"; then
            echo "   ✅ $script loads Synergy Framework"
        else
            echo "   ❌ $script missing Synergy Framework integration"
            scripts_ok=false
        fi

        if grep -q "init_synergy_framework" "scripts/$script"; then
            echo "   ✅ $script initializes Synergy Framework"
        else
            echo "   ❌ $script missing Synergy Framework initialization"
            scripts_ok=false
        fi
    else
        echo "   ❌ $script not found"
        scripts_ok=false
    fi
done

if [ "$scripts_ok" = true ]; then
    print_pass "All scripts properly integrate Synergy Framework"
else
    print_fail "Some scripts missing Synergy Framework integration"
fi

# Test 4: Check script syntax
print_test "Script syntax validation"
syntax_ok=true

for script in "generate-configs.sh" "setup-user.sh" "validate-system.sh"; do
    if [ -f "scripts/$script" ]; then
        if bash -n "scripts/$script" 2>/dev/null; then
            echo "   ✅ $script syntax valid"
        else
            echo "   ❌ $script has syntax errors"
            syntax_ok=false
        fi
    else
        echo "   ❌ $script not found"
        syntax_ok=false
    fi
done

if [ "$syntax_ok" = true ]; then
    print_pass "All scripts have valid syntax"
else
    print_fail "Some scripts have syntax errors"
fi

# =============================================================================
# STEP 4: USER SCENARIO SIMULATION
# =============================================================================

echo ""
echo "📋 User Scenario Simulation"
echo "==========================="
echo "🎭 Simulating user: Jane Doe"
echo "============================"

# Backup current environment if exists
if [ -f ".env.local" ]; then
    cp .env.local .env.local.backup
    echo "📁 Backed up current .env.local to .env.local.backup"
fi

# Create test environment
print_test "User scenario - Jane Doe configuration"
cat > .env.local << EOF
# Test Configuration for Jane Doe
USER_NAME="Jane Doe"
USER_GITHUB_USERNAME="janedoe"
USER_EMAIL="jane.doe@example.com"
PROJECT_TITLE="Jane's Agentic Learning Journey"
PROJECT_DESCRIPTION="Personalized learning experience for Jane Doe"
MAIN_AGENT_NAME="Claude"
EOF

if [ -f ".env.local" ]; then
    print_pass "Test environment created for Jane Doe"
else
    print_fail "Failed to create test environment"
fi

# Test 5: Configuration generation with test user
print_test "Configuration generation for Jane Doe"

if [ -f "scripts/generate-configs.sh" ]; then
    chmod +x scripts/generate-configs.sh

    # Run generation script
    if bash scripts/generate-configs.sh > /tmp/generation.log 2>&1; then
        echo "   ✅ Configuration generation completed"

        # Check if files were generated
        files_generated=true
        generated_files=("CLAUDE.md" "README.md" "workspace/CLAUDE.md" "notes/001-introduction.md")

        for file in "${generated_files[@]}"; do
            if [ -f "$file" ]; then
                echo "   ✅ $file generated"
            else
                echo "   ❌ $file not generated"
                files_generated=false
            fi
        done

        if [ "$files_generated" = true ]; then
            print_pass "All configuration files generated for Jane Doe"
        else
            print_fail "Some configuration files missing"
        fi
    else
        print_fail "Configuration generation failed"
        echo "   Check logs in /tmp/generation.log"
    fi
else
    print_fail "generate-configs.sh script not found"
fi

# Test 6: Personalization validation
print_test "Personalization validation for Jane Doe"
personalization_ok=true

for file in "CLAUDE.md" "README.md" "workspace/CLAUDE.md" "notes/001-introduction.md"; do
    if [ -f "$file" ]; then
        if grep -q "Jane Doe" "$file"; then
            echo "   ✅ $file contains Jane Doe"
        else
            echo "   ❌ $file missing Jane Doe"
            personalization_ok=false
        fi

        if grep -q "janedoe" "$file"; then
            echo "   ✅ $file contains janedoe (GitHub username)"
        else
            echo "   ⚠️  $file missing GitHub username"
        fi

        # Check for no remaining placeholders
        if grep -q "\${USER_NAME}" "$file"; then
            echo "   ❌ $file still has unprocessed placeholders"
            personalization_ok=false
        fi
    else
        echo "   ❌ $file not found for validation"
        personalization_ok=false
    fi
done

if [ "$personalization_ok" = true ]; then
    print_pass "All files properly personalized for Jane Doe"
else
    print_fail "Personalization issues detected"
fi

# =============================================================================
# STEP 5: COLLABORATIVE FUNCTIONS VALIDATION
# =============================================================================

echo ""
echo "📋 Collaborative Functions Validation"
echo "====================================="

# Test 7: Synergy Framework functions availability
print_test "Synergy Framework collaborative functions available"

if [ -f "$SCRIPT_DIR/synergy-framework.sh" ]; then
    # Source the framework to test functions
    source "$SCRIPT_DIR/synergy-framework.sh"

    functions_available=true

    # Check if functions exist
    if declare -f communicate_task_start >/dev/null; then
        echo "   ✅ communicate_task_start function available"
    else
        echo "   ❌ communicate_task_start function missing"
        functions_available=false
    fi

    if declare -f report_progress >/dev/null; then
        echo "   ✅ report_progress function available"
    else
        echo "   ❌ report_progress function missing"
        functions_available=false
    fi

    if declare -f request_decision >/dev/null; then
        echo "   ✅ request_decision function available"
    else
        echo "   ❌ request_decision function missing"
        functions_available=false
    fi

    if declare -f reflect_on_task >/dev/null; then
        echo "   ✅ reflect_on_task function available"
    else
        echo "   ❌ reflect_on_task function missing"
        functions_available=false
    fi

    if [ "$functions_available" = true ]; then
        print_pass "All collaborative functions available"
    else
        print_fail "Some collaborative functions missing"
    fi
else
    print_fail "Synergy Framework not found for function validation"
fi

# =============================================================================
# STEP 6: CLEANUP AND RESTORATION
# =============================================================================

echo ""
echo "📋 Cleanup and Restoration"
echo "=========================="

# Restore original environment if backup exists
if [ -f ".env.local.backup" ]; then
    mv .env.local.backup .env.local
    echo "📁 Restored original .env.local"
else
    echo "ℹ️  No original .env.local to restore"
fi

# Remove generated test files
echo "🗑️  Cleaning up test-generated files..."
rm -f CLAUDE.md README.md workspace/CLAUDE.md notes/001-introduction.md 2>/dev/null || true

# =============================================================================
# STEP 7: TEST RESULTS SUMMARY
# =============================================================================

echo ""
echo "📊 Test Results Summary"
echo "======================"
echo "Total Tests: $TESTS_TOTAL"
echo "Passed: $TESTS_PASSED"
echo "Failed: $TESTS_FAILED"
echo ""

if [ $TESTS_FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 ALL TESTS PASSED!${NC}"
    echo ""
    echo "✅ Synergy Framework is fully functional"
    echo "✅ Template system working correctly"
    echo "✅ Scripts properly integrated"
    echo "✅ User scenarios validated"
    echo "✅ System ready for production use"
else
    echo -e "${RED}❌ SOME TESTS FAILED${NC}"
    echo ""
    echo "⚠️  Please review failed tests and fix issues before proceeding"
    echo "⚠️  Check logs and error messages above for details"
fi

echo ""
echo "📋 Validation Components Tested:"
echo "   🔹 Template system integrity"
echo "   🔹 Placeholder syntax validation"
echo "   🔹 Script integration testing"
echo "   🔹 Syntax validation"
echo "   🔹 User scenario simulation"
echo "   🔹 Personalization validation"
echo "   🔹 Collaborative functions testing"
echo ""

# =============================================================================
# STEP 8: SYNERGY FRAMEWORK REFLECTION
# =============================================================================

# Use Synergy Framework reflection if available
if [ -f "$SCRIPT_DIR/synergy-framework.sh" ]; then
    reflect_on_task \
        "System Validation" \
        "Validated $TESTS_TOTAL tests with $TESTS_PASSED passes and $TESTS_FAILED failures" \
        "System validation completed with user scenario simulation and collaborative function testing"
fi

echo ""
echo "✅ System validation completed!"

# Exit with appropriate code
if [ $TESTS_FAILED -eq 0 ]; then
    exit 0
else
    exit 1
fi