#!/bin/bash
# Protection Status Check - Verifies all protection layers are working

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== AI Work Protection System Status ===${NC}"
echo ""

# Check 1: Git Repository
echo -e "${YELLOW}1. Git Repository:${NC}"
if [ -d ".git" ]; then
    echo -e "   ${GREEN}✓ Initialized${NC}"
    echo "   Branches:"
    git branch -a | sed 's/^/     /'
else
    echo -e "   ${RED}✗ Not initialized${NC}"
fi
echo ""

# Check 2: Branch Structure
echo -e "${YELLOW}2. Branch Structure:${NC}"
BRANCHES=("main" "test" "dev")
for branch in "${BRANCHES[@]}"; do
    if git show-ref --verify --quiet "refs/heads/$branch"; then
        echo -e "   ${GREEN}✓ $branch branch exists${NC}"
    else
        echo -e "   ${RED}✗ $branch branch missing${NC}"
    fi
done
echo ""

# Check 3: Pre-commit Hooks
echo -e "${YELLOW}3. Pre-commit Hooks:${NC}"
if [ -f ".pre-commit-config.yaml" ]; then
    echo -e "   ${GREEN}✓ Configuration exists${NC}"
else
    echo -e "   ${RED} ✗ Configuration missing${NC}"
fi

if command -v pre-commit &> /dev/null; then
    echo -e "   ${GREEN}✓ pre-commit installed${NC}"
else
    echo -e "   ${RED}✗ pre-commit not installed${NC}"
fi
echo ""

# Check 4: GitHub Actions
echo -e "${YELLOW}4. GitHub Actions:${NC}"
if [ -f ".github/workflows/test.yml" ]; then
    echo -e "   ${GREEN}✓ Test workflow configured${NC}"
else
    echo -e "   ${RED}✗ Test workflow missing${NC}"
fi
echo ""

# Check 5: Remote Repository
echo -e "${YELLOW}5. Remote Repository:${NC}"
if git remote get-url origin &> /dev/null; then
    REMOTE_URL=$(git remote get-url origin)
    echo -e "   ${GREEN}✓ Connected: $REMOTE_URL${NC}"
else
    echo -e "   ${YELLOW}⚠ No remote repository configured${NC}"
    echo "   Set up with: git remote add origin <url>"
fi
echo ""

# Check 6: Time Machine
echo -e "${YELLOW}6. Time Machine Backup:${NC}"
if command -v tmutil &> /dev/null; then
    if tmutil destinationinfo &> /dev/null; then
        LAST_BACKUP=$(tmutil latestbackup 2>/dev/null)
        if [ -n "$LAST_BACKUP" ]; then
            echo -e "   ${GREEN}✓ Enabled${NC}"
            echo "   Last backup: $(basename "$LAST_BACKUP")"
        else
            echo -e "   ${YELLOW}⚠ Enabled but no backups found${NC}"
        fi
    else
        echo -e "   ${RED}✗ Not configured${NC}"
        echo "   Set up in System Settings > General > Time Machine"
    fi
else
    echo -e "   ${RED}✗ Time Machine not available${NC}"
fi
echo ""

# Check 7: Cloud Backup (Backblaze)
echo -e "${YELLOW}7. Cloud Backup:${NC}"
if [ -d "/Library/BackBlaze.bzpkg" ] || [ -d "$HOME/Library/Application Support/Backblaze" ]; then
    echo -e "   ${GREEN}✓ Backblaze installed${NC}"
elif command -v rclone &> /dev/null; then
    echo -e "   ${GREEN}✓ rclone installed${NC}"
else
    echo -e "   ${YELLOW}⚠ Not configured${NC}"
    echo "   Install: brew install --cask backblaze"
    echo "   Or: brew install rclone"
fi
echo ""

# Check 8: Automation Scripts
echo -e "${YELLOW}8. Automation Scripts:${NC}"
SCRIPTS=("setup-protection.sh" "daily-sync.sh" "daily-check.sh" "quick-rollback.sh")
for script in "${SCRIPTS[@]}"; do
    if [ -f "scripts/$script" ]; then
        if [ -x "scripts/$script" ]; then
            echo -e "   ${GREEN}✓ $script (executable)${NC}"
        else
            echo -e "   ${YELLOW}⚠ $script (not executable)${NC}"
            echo "     Run: chmod +x scripts/$script"
        fi
    else
        echo -e "   ${RED}✗ $script missing${NC}"
    fi
done
echo ""

# Overall Status
echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                        ║${NC}"
echo -e "${GREEN}║  Protection System Status: Check complete             ║${NC}"
echo -e "${GREEN}║                                                        ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Recommendations
echo -e "${YELLOW}Recommendations:${NC}"
echo "• Make scripts executable: chmod +x scripts/*.sh"
echo "• Set up remote repository if not done"
echo "• Configure Time Machine for hourly backups"
echo "• Install Backblaze or rclone for cloud backup"
echo "• Review: AI-Work-Protection-System.md"
