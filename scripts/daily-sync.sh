#!/bin/bash
# Daily Sync Script - Pushes dev to test and triggers CI/CD

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== Daily Sync: Dev → Test ===${NC}"
echo ""

# Ensure we're in a git repo
if [ ! -d ".git" ]; then
    echo "Error: Not a git repository"
    exit 1
fi

# Save current branch
CURRENT_BRANCH=$(git branch --show-current)

# Commit any uncommitted changes on dev
git checkout dev
echo -e "${YELLOW}Committing any pending changes on dev...${NC}"

if [[ -n $(git status -s) ]]; then
    git add .
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    git commit -m "chore: Daily sync - $TIMESTAMP

Automated commit of day's work before testing.
" || echo "Nothing to commit"
    echo -e "${GREEN}✓ Changes committed${NC}"
else
    echo -e "${GREEN}✓ No pending changes${NC}"
fi

# Push dev branch
echo -e "${YELLOW}Pushing dev branch...${NC}"
git push origin dev --set-upstream || git push origin dev
echo -e "${GREEN}✓ Dev pushed to remote${NC}"

# Merge dev into test
echo -e "${YELLOW}Merging dev → test...${NC}"
git checkout test
git merge dev --no-edit -m "chore: Daily merge from dev

Automated daily merge for testing.
"
echo -e "${GREEN}✓ Merged into test${NC}"

# Push test branch (triggers CI/CD)
echo -e "${YELLOW}Pushing test branch (will trigger CI/CD)...${NC}"
git push origin test --set-upstream || git push origin test
echo -e "${GREEN}✓ Test pushed - CI/CD will run automatically${NC}"

# Return to original branch (likely dev)
git checkout "$CURRENT_BRANCH"

# Success message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                        ║${NC}"
echo -e "${GREEN}║  ✅ Daily Sync Complete!              ║${NC}"
echo -e "${GREEN}║                                        ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo "📊 Check GitHub Actions for test results:"
echo "   GitHub → Actions tab → latest workflow run"
echo ""
echo "⏰ Tomorrow morning: Run ./scripts/daily-check.sh"
echo "   to review results and merge to main if tests pass."
