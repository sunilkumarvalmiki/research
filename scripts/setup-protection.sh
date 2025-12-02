#!/bin/bash
# AI Work Protection System - Automated Setup Script
# This script sets up comprehensive protection mechanisms

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== AI Work Protection System Setup ===${NC}"
echo ""

# Check if running in correct directory
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}Initializing Git repository...${NC}"
    git init
    echo -e "${GREEN}✓ Git initialized${NC}"
fi

# Step 1: Create three-branch structure
echo -e "${YELLOW}Setting up branch structure...${NC}"

# Ensure we're on main
git checkout -b main 2>/dev/null || git checkout main

# Create dev branch
git checkout -b dev 2>/dev/null || git checkout dev

# Create test branch
git checkout -b test 2>/dev/null || git checkout test

# Return to dev for active development
git checkout dev

echo -e "${GREEN}✓ Branch structure created (main, test, dev)${NC}"

# Step 2: Install pre-commit framework
echo -e "${YELLOW}Installing pre-commit framework...${NC}"

if ! command -v pre-commit &> /dev/null; then
    pip3 install pre-commit --quiet
    echo -e "${GREEN}✓ pre-commit installed${NC}"
else
    echo -e "${GREEN}✓ pre-commit already installed${NC}"
fi

# Step 3: Create .pre-commit-config.yaml
echo -e "${YELLOW}Creating pre-commit configuration...${NC}"

cat > .pre-commit-config.yaml << 'EOF'
# AI Work Protection - Pre-commit Hooks Configuration
# These hooks run automatically before each commit

repos:
  # General file checks
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace        # Remove trailing whitespace
      - id: end-of-file-fixer          # Ensure files end with newline
      - id: check-yaml                 # Validate YAML syntax
      - id: check-added-large-files    # Prevent large files (>500KB)
        args: ['--maxkb=500']
      - id: check-merge-conflict       # Detect merge conflict markers
      - id: detect-private-key         # Prevent committing private keys
      - id: check-case-conflict        # Prevent case-sensitive filename conflicts

  # Python-specific checks (if Python project)
  - repo: https://github.com/psf/black
    rev: 23.12.1
    hooks:
      - id: black                      # Code formatter
        language_version: python3

  - repo: https://github.com/PyCQA/flake8
    rev: 7.0.0
    hooks:
      - id: flake8                     # Linting
        args: ['--max-line-length=100', '--extend-ignore=E203,W503']

  # Secret detection
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
      - id: detect-secrets             # Scan for secrets/API keys
        args: ['--baseline', '.secrets.baseline']

  # Markdown linting
  - repo: https://github.com/markdownlint/markdownlint
    rev: v0.12.0
    hooks:
      - id: markdownlint
        args: ['--style', 'relaxed']

  # Shell script checks
  - repo: https://github.com/shellcheck-py/shellcheck-py
    rev: v0.9.0.6
    hooks:
      - id: shellcheck                 # Shell script linting
EOF

echo -e "${GREEN}✓ Pre-commit config created${NC}"

# Step 4: Install pre-commit hooks
echo -e "${YELLOW}Installing Git hooks...${NC}"
pre-commit install
pre-commit install --hook-type commit-msg
echo -e "${GREEN}✓ Git hooks installed${NC}"

# Step 5: Create secrets baseline (for detect-secrets)
echo -e "${YELLOW}Creating secrets detection baseline...${NC}"
detect-secrets scan > .secrets.baseline 2>/dev/null || echo '{}' > .secrets.baseline
echo -e "${GREEN}✓ Secrets baseline created${NC}"

# Step 6: Create GitHub Actions workflow directory
echo -e "${YELLOW}Setting up CI/CD...${NC}"
mkdir -p .github/workflows

# Create test workflow
cat > .github/workflows/test.yml << 'EOF'
name: Automated Tests

on:
  push:
    branches: [ test, main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: macos-latest
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Set up Python
      uses: actions/setup-python@v5
      with:
        python-version: '3.10'
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
        pip install pytest pytest-cov flake8 black
    
    - name: Lint with flake8
      run: |
        flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
        flake8 . --count --exit-zero --max-complexity=10 --max-line-length=100 --statistics

    - name: Check code formatting
      run: black --check .
    
    - name: Run tests
      run: |
        if [ -d "tests" ]; then
          pytest tests/ --cov=. --cov-report=xml --cov-report=term
        else
          echo "No tests directory found, skipping tests"
        fi
    
    - name: Security scan
      run: |
        pip install safety bandit
        safety check || true
        bandit -r . -f json -o bandit-report.json || true
    
    - name: Upload coverage
      uses: codecov/codecov-action@v3
      with:
        file: ./coverage.xml
        fail_ci_if_error: false

  notify:
    needs: test
    runs-on: ubuntu-latest
    if: always()
    steps:
      - name: Check test status
        run: |
          if [ "${{ needs.test.result }}" == "success" ]; then
            echo "✅ All tests passed!"
          else
            echo "❌ Tests failed - check logs"
          fi
EOF

echo -e "${GREEN}✓ GitHub Actions workflow created${NC}"

# Step 7: Create  branch protection configuration note
cat > .github/BRANCH_PROTECTION.md << 'EOF'
# Branch Protection Settings

To enable on GitHub (Settings → Branches → Branch protection rules):

## Main Branch Protection
- ✅ Require pull request before merging
- ✅ Require status checks to pass
  - Required: "test" job from GitHub Actions
- ✅ Require branches to be up to date before merging
- ✅ Include administrators
- ✅ Restrict who can push to matching branches

## Test Branch Protection
- ✅ Require status checks to pass
  - Required: "test" job from GitHub Actions
- ⬜ Require pull request before merging (optional)
EOF

echo -e "${GREEN}✓ Branch protection guide created${NC}"

# Step 8: Create .gitignore
echo -e "${YELLOW}Creating .gitignore...${NC}"

cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
ENV/
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Testing
.pytest_cache/
.coverage
htmlcov/
*.cover
.hypothesis/
bandit-report.json

# IDEs
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Secrets
.env
*.key
*.pem
secrets.yml
.secrets.baseline

# Backups
*.bak
*.backup
.~*

# AI Tool artifacts
.cursor/
.copilot/

# Logs
*.log
logs/
EOF

echo -e "${GREEN}✓ .gitignore created${NC}"

# Step 9: Create commit message template
echo -e "${YELLOW}Setting up commit message template...${NC}"

cat > .gitmessage << 'EOF'
# <type>: <subject>
#
# <body>
#
# [AI-assisted] (if applicable)
# [Breaking change] (if applicable)
#
# Types: feat, fix, docs, style, refactor, test, chore
# Subject: One line summary (50 chars max)
# Body: Detailed description (wrap at 72 chars)
#
# Example:
# feat: Add user authentication
#
# Implemented JWT-based authentication with refresh tokens.
# Added login, logout, and token refresh endpoints.
#
# [AI-assisted]
EOF

git config commit.template .gitmessage
echo -e "${GREEN}✓ Commit template configured${NC}"

# Step 10: Create README for protection system
cat > PROTECTION_SYSTEM_README.md << 'EOF'
# 🛡️ AI Work Protection System

This repository is protected by a comprehensive 7-layer protection system.

## Quick Commands

### Daily Workflow
```bash
# Morning: Check test results and merge if passed
./scripts/daily-check.sh

# During work: Commit frequently
git add .
git commit  # Use template for good commit messages

# Evening: Push to test branch
./scripts/daily-sync.sh
```

### Emergency Rollback
```bash
# Rollback to yesterday
./scripts/quick-rollback.sh --date yesterday

# Rollback to specific commit
./scripts/quick-rollback.sh <commit-hash>
```

### Check Protection Status
```bash
./scripts/check-protection.sh
```

## Protection Layers

1. **Git dev branch** - Isolated AI work  
2. **Git test branch** - Daily integration with automated tests  
3. **Git main branch** - Protected, production-ready  
4. **Time Machine** - Hourly backups  
5. **Carbon Copy Cloner** - Daily bootable clone  
6. **Cloud Backup** - Continuous off-site  
7. **GitHub Actions** - Automated testing

## Documentation

- [Full Documentation](AI-Work-Protection-System.md)
- [Branch Protection](github/BRANCH_PROTECTION.md)
- [Daily Workflow](#daily-workflow)
EOF

echo -e "${GREEN}✓ Protection system README created${NC}"

# Step 11: Create initial commit on main
echo -e "${YELLOW}Creating initial commit...${NC}"

git checkout main
git add .
git commit -m "chore: Initialize AI Work Protection System

Set up comprehensive protection with:
- Three-branch workflow (main/test/dev)
- Pre-commit hooks for code quality
- GitHub Actions for automated testing
- Git templates and configurations" || echo "Already committed"

echo -e "${GREEN}✓ Initial commit created${NC}"

# Return to dev branch for work
git checkout dev

# Final success message
echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                      ║${NC}"
echo -e "${GREEN}║  ✅ AI Work Protection System Setup Complete!       ║${NC}"
echo -e "${GREEN}║                                                      ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Review: AI-Work-Protection-System.md"
echo "2. Configure: GitHub remote repository"
echo "3. Set up: Branch protection rules (see .github/BRANCH_PROTECTION.md)"
echo "4. Install: Carbon Copy Cloner and Backblaze (optional)"
echo "5. Run: ./scripts/daily-sync.sh tonight"
echo ""
echo -e "${GREEN}You're now protected! Work safely on the 'dev' branch.${NC}"
