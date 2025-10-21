#!/bin/bash
# Bulletproof System Verification Framework
# PREVENTS ALL THE PROFESSIONAL FAILURES IDENTIFIED

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Verification results
TOTAL_CHECKS=0
PASSED_CHECKS=0
FAILED_CHECKS=0
CRITICAL_FAILURES=0

# Logging
LOG_FILE="logs/bulletproof-verification-$(date +%Y%m%d_%H%M%S).log"
mkdir -p logs

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}❌ CRITICAL FAILURE: $1${NC}" | tee -a "$LOG_FILE"
    ((FAILED_CHECKS++))
    ((CRITICAL_FAILURES++))
}

warning() {
    echo -e "${YELLOW}⚠️  WARNING: $1${NC}" | tee -a "$LOG_FILE"
    ((FAILED_CHECKS++))
}

success() {
    echo -e "${GREEN}✅ PASS: $1${NC}" | tee -a "$LOG_FILE"
    ((PASSED_CHECKS++))
}

info() {
    echo -e "${BLUE}ℹ️  INFO: $1${NC}" | tee -a "$LOG_FILE"
}

check() {
    ((TOTAL_CHECKS++))
    local test_name="$1"
    local test_command="$2"

    info "Running: $test_name"

    if eval "$test_command" >/dev/null 2>&1; then
        success "$test_name"
        return 0
    else
        error "$test_name - FAILED"
        return 1
    fi
}

# ===========================================
# ENVIRONMENT ALIGNMENT VERIFICATION
# ===========================================

verify_environment_alignment() {
    log "=== ENVIRONMENT ALIGNMENT VERIFICATION ==="

    # Check if .env.sample and .env.local have same variable count
    local sample_vars=$(grep -c '^[A-Z_]*=' .env.sample 2>/dev/null || echo "0")
    local local_vars=$(grep -c '^[A-Z_]*=' .env.local 2>/dev/null || echo "0")

    check "Environment file variable count alignment" \
          "[[ $sample_vars -eq $local_vars ]]"

    # Check critical variables exist in both files
    local critical_vars=("USER_NAME" "MAIN_AGENT_ROLE" "PROJECT_TITLE" "ULTRA_THINKING_MODE")

    for var in "${critical_vars[@]}"; do
        check "Critical variable $var exists in both files" \
              "grep -q '^$var=' .env.sample && grep -q '^$var=' .env.local"
    done

    # Check quoting consistency (protect against spaces)
    check "USER_NAME properly quoted in .env.local" \
          "grep -q '^USER_NAME=\".*\"' .env.local"

    check "MAIN_AGENT_ROLE properly quoted in .env.local" \
          "grep -q '^MAIN_AGENT_ROLE=\".*\"' .env.local"
}

# ===========================================
# TEMPLATE ALIGNMENT VERIFICATION
# ===========================================

verify_template_alignment() {
    log "=== TEMPLATE ALIGNMENT VERIFICATION ==="

    local templates=(
        "CLAUDE.md.template:CLAUDE.md"
        "README.md.template:README.md"
        "workspace/CLAUDE.md.template:workspace/CLAUDE.md"
        "notes/001-introduction.md.template:notes/001-introduction.md"
    )

    for template_pair in "${templates[@]}"; do
        local template_file="${template_pair%:*}"
        local generated_file="${template_pair#*:}"

        # Check both files exist
        check "Template file exists: $template_file" \
              "[[ -f '$template_file' ]]"

        check "Generated file exists: $generated_file" \
              "[[ -f '$generated_file' ]]"

        # Check template contains placeholders
        check "Template contains placeholders: $template_file" \
              "grep -q '\${USER_NAME}' '$template_file'"

        # Check generated file contains personalization
        check "Generated file personalized: $generated_file" \
              "grep -q 'Omar El Mountassir' '$generated_file'"

        # Check generated file has NO placeholders
        check "Generated file has no placeholders: $generated_file" \
              "! grep -q '\${.*}' '$generated_file'"
    done
}

# ===========================================
# SCRIPT INTEGRITY VERIFICATION
# ===========================================

verify_script_integrity() {
    log "=== SCRIPT INTEGRITY VERIFICATION ==="

    local scripts=(
        "scripts/generate-configs.sh"
        "scripts/setup-user.sh"
        "scripts/validate-system.sh"
    )

    for script in "${scripts[@]}"; do
        # Check script exists and is executable
        check "Script exists and executable: $script" \
              "[[ -x '$script' ]]"

        # Check script has valid syntax
        check "Script has valid bash syntax: $script" \
              "bash -n '$script'"

        # Check script sources environment properly
        check "Script sources environment: $script" \
              "grep -q 'source .env.local' '$script'"
    done
}

# ===========================================
# CROSS-FILE CONSISTENCY VERIFICATION
# ===========================================

verify_cross_file_consistency() {
    log "=== CROSS-FILE CONSISTENCY VERIFICATION ==="

    # Check that all generated files use the same user name
    local claude_md_name=$(grep -o 'Omar El Mountassir' CLAUDE.md | head -1 || echo "NOT_FOUND")
    local readme_name=$(grep -o 'Omar El Mountassir' README.md | head -1 || echo "NOT_FOUND")

    check "User name consistency across files" \
          "[[ '$claude_md_name' == '$readme_name' && '$claude_md_name' != 'NOT_FOUND' ]]"

    # Check that no templates contain hardcoded user names
    check "No hardcoded names in templates" \
          "! grep -r 'Omar El Mountassir' *.template 2>/dev/null"

    # Check environment files don't have unquoted spaces
    check "No unquoted spaces in environment variables" \
          "! grep -E '^[A-Z_]+=[^\"].* ' .env.local"
}

verify_configuration_knowledge() {
    log "=== CONFIGURATION KNOWLEDGE VERIFICATION ==="

    # Check that CONFIGURATION_KNOWLEDGE.md exists
    check "Configuration knowledge file exists" \
          "[[ -f 'CONFIGURATION_KNOWLEDGE.md' ]]"

    # Check that it contains GLM Coding Plan information
    check "GLM Coding Plan documentation" \
          "grep -q 'GLM Coding Plan' CONFIGURATION_KNOWLEDGE.md"

    # Check that MCP servers are documented
    check "MCP server documentation" \
          "grep -q 'mcpServers' CONFIGURATION_KNOWLEDGE.md"

    # Check that Claude.md references configuration knowledge
    check "CLAUDE.md references configuration knowledge" \
          "grep -q 'CONFIGURATION_KNOWLEDGE.md' CLAUDE.md"

    # Check that workspace has symbolic link
    check "Workspace configuration knowledge link" \
          "[[ -L 'workspace/CONFIGURATION_KNOWLEDGE.md' ]]"

    # Check MCP configuration file exists
    check "MCP configuration file exists" \
          "[[ -f '.mcp.json' ]]"

    # Verify sequential-thinking MCP configuration
    check "Sequential-thinking MCP configured" \
          "grep -q 'sequential-thinking' .mcp.json"

    # Verify web-search-prime MCP configuration
    check "Web-search-prime MCP configured" \
          "grep -q 'web-search-prime' .mcp.json"

    # Verify zai-mcp-server configuration
    check "ZAI MCP server configured" \
          "grep -q 'zai-mcp-server' .mcp.json"
}

# ===========================================
# COMPREHENSIVE SYSTEM VALIDATION
# ===========================================

run_comprehensive_validation() {
    log "=== COMPREHENSIVE SYSTEM VALIDATION START ==="

    info "Starting bulletproof verification framework..."
    info "Log file: $LOG_FILE"

    # Run all verification categories
    verify_environment_alignment
    verify_template_alignment
    verify_script_integrity
    verify_cross_file_consistency
    verify_configuration_knowledge

    # Final results
    log "=== VALIDATION RESULTS ==="
    info "Total checks: $TOTAL_CHECKS"
    success "Passed checks: $PASSED_CHECKS"

    if [[ $FAILED_CHECKS -gt 0 ]]; then
        error "Failed checks: $FAILED_CHECKS"
    fi

    if [[ $CRITICAL_FAILURES -gt 0 ]]; then
        error "CRITICAL FAILURES: $CRITICAL_FAILURES"
        echo -e "\n${RED}🚨 SYSTEM NOT READY FOR PRODUCTION${NC}"
        echo -e "${RED}❌ CRITICAL ISSUES MUST BE RESOLVED${NC}"
        return 1
    else
        success "✅ SYSTEM BULLETPROOF VERIFIED - READY FOR PRODUCTION"
        return 0
    fi
}

# ===========================================
# MAIN EXECUTION
# ===========================================

main() {
    echo "🛡️  BULLETPROOF SYSTEM VERIFICATION"
    echo "==================================="
    echo "Preventing professional failures through rigorous validation..."
    echo ""

    if run_comprehensive_validation; then
        echo -e "\n${GREEN}🎉 ALL SYSTEMS VERIFIED AND OPERATIONAL${NC}"
        exit 0
    else
        echo -e "\n${RED}💥 CRITICAL FAILURES DETECTED - SYSTEM NOT READY${NC}"
        echo -e "${RED}📋 Check log file: $LOG_FILE${NC}"
        exit 1
    fi
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi