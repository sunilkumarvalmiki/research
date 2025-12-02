#!/bin/bash
# Quick Rollback Script - Emergency recovery to previous state

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --date <date>      Rollback to specific date (e.g., 'yesterday', '2024-12-01')"
    echo "  --commit <hash>    Rollback to specific commit hash"
    echo "  --to-main          Rollback dev to match main branch"
    echo "  --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --date yesterday"
    echo "  $0 --commit abc1234"
    echo "  $0 --to-main"
}

# Parse arguments
ROLLBACK_TYPE=""
ROLLBACK_TARGET=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --date)
            ROLLBACK_TYPE="date"
            ROLLBACK_TARGET=$2
            shift 2
            ;;
        --commit)
            ROLLBACK_TYPE="commit"
            ROLLBACK_TARGET=$2
            shift 2
            ;;
        --to-main)
            ROLLBACK_TYPE="main"
            shift
            ;;
        --help)
            show_usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# If no arguments, interactive mode
if [ -z "$ROLLBACK_TYPE" ]; then
    echo -e "${YELLOW}=== Quick Rollback ===${NC}"
    echo ""
    echo "Select rollback method:"
    echo "1) Rollback to yesterday"
    echo "2) Rollback to specific date"
    echo "3) Rollback to main branch state"
    echo "4) Rollback to specific commit"
    read -p "Enter choice (1-4): " choice
    
    case $choice in
        1)
            ROLLBACK_TYPE="date"
            ROLLBACK_TARGET="yesterday"
            ;;
        2)
            read -p "Enter date (YYYY-MM-DD): " ROLLBACK_TARGET
            ROLLBACK_TYPE="date"
            ;;
        3)
            ROLLBACK_TYPE="main"
            ;;
        4)
            read -p "Enter commit hash: " ROLLBACK_TARGET
            ROLLBACK_TYPE="commit"
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac
fi

# Ensure on dev branch
git checkout dev

# Confirm before proceeding
echo -e "${RED}⚠️  WARNING: This will reset your dev branch!${NC}"
echo "Current uncommitted changes will be saved to a temporary branch."
read -p "Continue? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Rollback cancelled."
    exit 0
fi

# Save current state to backup branch
BACKUP_BRANCH="backup-dev-$(date +%Y%m%d-%H%M%S)"
echo -e "${YELLOW}Creating backup branch: $BACKUP_BRANCH${NC}"
git branch "$BACKUP_BRANCH"
echo -e "${GREEN}✓ Backup created${NC}"

# Perform rollback based on type
case $ROLLBACK_TYPE in
    date)
        echo -e "${YELLOW}Finding commit from: $ROLLBACK_TARGET${NC}"
        COMMIT_HASH=$(git log --before="$ROLLBACK_TARGET 23:59:59" --format="%H" -n 1)
        
        if [ -z "$COMMIT_HASH" ]; then
            echo -e "${RED}No commit found for that date${NC}"
            exit 1
        fi
        
        echo "Found commit: $COMMIT_HASH"
        git log -1 --oneline "$COMMIT_HASH"
        
        echo -e "${YELLOW}Resetting to this commit...${NC}"
        git reset --hard "$COMMIT_HASH"
        echo -e "${GREEN}✓ Rolled back to $ROLLBACK_TARGET${NC}"
        ;;
        
    commit)
        echo -e "${YELLOW}Rolling back to commit: $ROLLBACK_TARGET${NC}"
        git reset --hard "$ROLLBACK_TARGET"
        echo -e "${GREEN}✓ Rolled back to commit $ROLLBACK_TARGET${NC}"
        ;;
        
    main)
        echo -e "${YELLOW}Rolling back dev to match main branch...${NC}"
        git fetch origin
        git reset --hard origin/main
        echo -e "${GREEN}✓ Dev now matches main branch${NC}"
        ;;
esac

# Summary
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                        ║${NC}"
echo -e "${GREEN}║  ✅ Rollback Complete!                ║${NC}"
echo -e "${GREEN}║                                        ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo "📋 Summary:"
echo "  - Dev branch has been reset"
echo "  - Previous state saved to: $BACKUP_BRANCH"
echo ""
echo "To restore the backup if needed:"
echo "  git merge $BACKUP_BRANCH"
echo ""
echo "To delete the backup (if rollback was successful):"
echo "  git branch -D $BACKUP_BRANCH"
