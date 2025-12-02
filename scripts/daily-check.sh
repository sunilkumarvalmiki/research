#!/bin/bash
# Daily Check Script - Reviews test results and merges to main if passed

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== Daily Check: Test Results Review ===${NC}"
echo ""

# Ensure we're in a git repo
if [ ! -d ".git" ]; then
    echo "Error: Not a git repository"
    exit 1
fi

# Fetch latest from remote
echo -e "${YELLOW}Fetching latest changes...${NC}"
git fetch origin
echo -e "${GREEN}✓ Fetched${NC}"

# Check if test branch exists
if ! git show-ref --verify --quiet refs/heads/test; then
    echo -e "${RED}Test branch doesn't exist yet. Run ./scripts/daily-sync.sh first.${NC}"
    exit 1
fi

# Show recent test branch commits
echo -e "${YELLOW}Recent commits on test branch:${NC}"
git log test --oneline -5
echo ""

# Check GitHub Actions status (requires gh CLI)
if command -v gh &> /dev/null; then
    echo -e "${YELLOW}GitHub Actions Status:${NC}"
    gh run list --branch test --limit 1 || echo "Install 'gh' CLI for automatic status: brew install gh"
    echo ""
fi

# Ask user if tests passed
echo -e "${YELLOW}Did the tests pass on the test branch?${NC}"
echo "1) Yes - merge test → main"
echo "2) No - keep working on dev"
echo "3) Check manually - open GitHub"
read -p "Enter choice (1/2/3): " choice

case $choice in
    1)
        echo -e "${GREEN}Merging test → main...${NC}"
        git checkout main
        git merge test --no-edit -m "chore: Merge tested changes to main

All tests passed on test branch.
"
        git push origin main
        echo -e "${GREEN}✓ Successfully merged to main${NC}"
        echo ""
        echo -e "${GREEN}🎉 Changes are now in production (main branch)!${NC}"
        
        # Return to dev for continued work
        git checkout dev
        echo "🔄 Switched back to dev branch for new work."
        ;;
    2)
        echo -e "${YELLOW}Staying on dev branch to fix issues.${NC}"
        git checkout dev
        echo ""
        echo "Next steps:"
        echo "1. Review test failures in GitHub Actions"
        echo "2. Fix issues on dev branch"
        echo "3. Run ./scripts/daily-sync.sh again tonight"
        ;;
    3)
        echo -e "${YELLOW}Opening GitHub Actions in browser...${NC}"
        # Get repo URL
        REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//')
        REPO_URL=$(echo "$REPO_URL" | sed 's/git@github.com:/https:\/\/github.com\//')
        open "$REPO_URL/actions" || echo "Open manually: $REPO_URL/actions"
        ;;
    *)
        echo -e "${RED}Invalid choice${NC}"
        exit 1
        ;;
esac
