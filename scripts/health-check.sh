#!/bin/bash
# Repository Health Check Script
# Checks repository against best practices

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Counters
PASSED=0
FAILED=0
WARNINGS=0

# Output functions
print_pass() {
    echo -e "${GREEN}✓${NC} $1"
    ((PASSED++))
}

print_fail() {
    echo -e "${RED}✗${NC} $1"
    ((FAILED++))
}

print_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
    ((WARNINGS++))
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_section() {
    echo ""
    echo -e "${BLUE}━━━ $1 ━━━${NC}"
}

# Health checks

check_readme() {
    print_section "README Check"
    
    if [ -f "README.md" ]; then
        word_count=$(wc -w < README.md)
        if [ $word_count -gt 100 ]; then
            print_pass "README.md exists and is comprehensive ($word_count words)"
        else
            print_warn "README.md is short ($word_count words, recommend >100)"
        fi
        
        # Check for required sections
        if grep -q "## Installation" README.md; then
            print_pass "Has Installation section"
        else
            print_warn "Missing Installation section"
        fi
        
        if grep -q "## Usage" README.md; then
            print_pass "Has Usage section"
        else
            print_warn "Missing Usage section"
        fi
    else
        print_fail "README.md not found"
    fi
}

check_license() {
    print_section "License Check"
    
    if [ -f "LICENSE" ] || [ -f "LICENSE.md" ] || [ -f "LICENSE.txt" ]; then
        print_pass "LICENSE file exists"
    else
        print_fail "LICENSE file not found"
    fi
}

check_gitignore() {
    print_section ".gitignore Check"
    
    if [ -f ".gitignore" ]; then
        print_pass ".gitignore exists"
        
        # Check for common patterns
        if grep -q "node_modules" .gitignore || grep -q "venv" .gitignore; then
            print_pass "Ignores dependencies"
        else
            print_warn "May not be ignoring dependencies"
        fi
    else
        print_warn ".gitignore not found"
    fi
}

check_ci() {
    print_section "CI/CD Check"
    
    if [ -d ".github/workflows" ]; then
        workflow_count=$(ls -1 .github/workflows/*.yml 2>/dev/null | wc -l)
        if [ $workflow_count -gt 0 ]; then
            print_pass "CI/CD configured ($workflow_count workflow(s))"
        else
            print_warn "No workflows found in .github/workflows/"
        fi
    else
        print_warn "No .github/workflows/ directory"
    fi
}

check_tests() {
    print_section "Tests Check"
    
    if [ -d "tests" ] || [ -d "test" ]; then
        test_count=$(find tests test -name "test_*.py" -o -name "*_test.py" -o -name "*.test.js" -o -name "*.test.ts" 2>/dev/null | wc -l)
        if [ $test_count -gt 0 ]; then
            print_pass "Tests found ($test_count test file(s))"
        else
            print_warn "Test directory exists but no test files found"
        fi
    else
        print_fail "No tests/ directory"
    fi
}

check_dependencies() {
    print_section "Dependencies Check"
    
    # Python
    if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
        print_pass "Python dependencies defined"
        
        # Check for lockfile
        if [ -f "poetry.lock" ] || [ -f "uv.lock" ]; then
            print_pass "Python lockfile present"
        else
            print_warn "No Python lockfile (consider using poetry or uv)"
        fi
    fi
    
    # JavaScript
    if [ -f "package.json" ]; then
        print_pass "Node.js dependencies defined"
        
        if [ -f "package-lock.json" ] || [ -f "yarn.lock" ] || [ -f "pnpm-lock.yaml" ]; then
            print_pass "Node.js lockfile present"
        else
            print_warn "No Node.js lockfile"
        fi
    fi
    
    # Rust
    if [ -f "Cargo.toml" ]; then
        print_pass "Rust dependencies defined"
        
        if [ -f "Cargo.lock" ]; then
            print_pass "Cargo.lock present"
        else
            print_warn "No Cargo.lock"
        fi
    fi
    
    # Go
    if [ -f "go.mod" ]; then
        print_pass "Go dependencies defined"
        
        if [ -f "go.sum" ]; then
            print_pass "go.sum present"
        else
            print_warn "No go.sum"
        fi
    fi
}

check_code_quality() {
    print_section "Code Quality Check"
    
    # Python linting
    if command -v ruff &> /dev/null; then
        if ruff check . --quiet 2>/dev/null; then
            print_pass "Ruff linting passed"
        else
            print_warn "Ruff found issues"
        fi
    fi
    
    # JavaScript linting
    if [ -f "package.json" ] && command -v npm &> /dev/null; then
        if npm run lint --silent 2>/dev/null; then
            print_pass "ESLint passed"
        else
            print_warn "ESLint found issues"
        fi
    fi
    
    # Rust linting
    if [ -f "Cargo.toml" ] && command -v cargo &> /dev/null; then
        if cargo clippy --quiet 2>/dev/null; then
            print_pass "Clippy passed"
        else
            print_warn "Clippy found issues"
        fi
    fi
}

check_security() {
    print_section "Security Check"
    
    # Check for secrets in git history
    if command -v git-secrets &> /dev/null; then
        if git secrets --scan 2>/dev/null; then
            print_pass "No secrets detected"
        else
            print_fail "Potential secrets found!"
        fi
    else
        print_info "Install git-secrets for secret scanning"
    fi
    
    # Check for .env in git
    if git ls-files | grep -q "\.env$"; then
        print_fail ".env file is tracked in git!"
    else
        print_pass "No .env in git"
    fi
}

check_documentation() {
    print_section "Documentation Check"
    
    if [ -d "docs" ]; then
        print_pass "docs/ directory exists"
    else
        print_info "No docs/ directory (optional)"
    fi
    
    if [ -f "CONTRIBUTING.md" ]; then
        print_pass "CONTRIBUTING.md exists"
    else
        print_warn "No CONTRIBUTING.md"
    fi
}

check_issue_templates() {
    print_section "Issue Templates Check"
    
    if [ -d ".github/ISSUE_TEMPLATE" ]; then
        template_count=$(ls -1 .github/ISSUE_TEMPLATE/*.yml .github/ISSUE_TEMPLATE/*.md 2>/dev/null | wc -l)
        if [ $template_count -gt 0 ]; then
            print_pass "Issue templates configured ($template_count template(s))"
        else
            print_warn "Issue template directory exists but empty"
        fi
    else
        print_warn "No issue templates"
    fi
    
    if [ -f ".github/PULL_REQUEST_TEMPLATE.md" ]; then
        print_pass "PR template exists"
    else
        print_warn "No PR template"
    fi
}

# Run all checks
main() {
    echo "🔍 Running repository health check..."
    
    check_readme
    check_license
    check_gitignore
    check_ci
    check_tests
    check_dependencies
    check_code_quality
    check_security
    check_documentation
    check_issue_templates
    
    # Summary
    print_section "Summary"
    
    TOTAL=$((PASSED + FAILED + WARNINGS))
    SCORE=$((PASSED * 100 / TOTAL))
    
    echo ""
    echo "Results:"
    echo -e "${GREEN}✓ Passed:${NC} $PASSED"
    echo -e "${YELLOW}⚠ Warnings:${NC} $WARNINGS"
    echo -e "${RED}✗ Failed:${NC} $FAILED"
    echo ""
    echo -e "Health Score: ${BLUE}$SCORE/100${NC}"
    echo ""
    
    if [ $SCORE -ge 80 ]; then
        echo -e "${GREEN}🎉 Excellent! Repository is healthy.${NC}"
    elif [ $SCORE -ge 60 ]; then
        echo -e "${YELLOW}👍 Good, but room for improvement.${NC}"
    else
        echo -e "${RED}⚠️  Needs work. Address failed checks.${NC}"
    fi
    
    echo ""
    echo "For detailed guidance, see:"
    echo "https://github.com/sunilkumarvalmiki/research/tree/main/profile-analysis"
    
    # Exit with error if critical failures
    if [ $FAILED -gt 3 ]; then
        exit 1
    fi
}

main
