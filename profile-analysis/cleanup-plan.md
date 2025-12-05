# Repository Cleanup Plan

## Overview

Actionable plan to clean up GitHub profile by archiving, deleting, and consolidating repositories.

## Immediate Actions (This Week)

### 1. Archive Learning Repositories

**Repositories**:
- practice
- PRICEBOX-CARDS
- phone-book
- Random

**Steps**:
```bash
# For each repository
1. Go to repository Settings
2. Scroll to "Danger Zone"
3. Click "Archive this repository"
4. Confirm archival
```

**Rationale**: These are learning/experimental repos no longer under active development. Archiving preserves history while signaling they're not maintained.

**Impact**:
- Cleaner profile
- Clear focus on active projects
- Preserved git history

### 2. Delete Empty Repository

**Repository**: SRM_PMS

**Steps**:
```bash
1. Create local backup (if any commits exist)
   git clone https://github.com/sunilkumarvalmiki/SRM_PMS backup/
   
2. Go to repository Settings
3. Scroll to "Danger Zone"
4. Click "Delete this repository"
5. Type repository name to confirm
```

**Rationale**: Empty repository with no value

### 3. Merge Duplicate Repositories

**Issue**: Super-Brain vs SuperBrain

**Steps**:
```bash
# 1. Review both repositories
cd Super-Brain
git log --oneline

cd ../SuperBrain
git log --oneline

# 2. If Super-Brain has unique commits, cherry-pick them
cd SuperBrain
git remote add old-brain ../Super-Brain
git fetch old-brain
git cherry-pick <commit-hash>

# 3. Archive Super-Brain
# Add README note:
echo "# ARCHIVED\n\nThis repository has been merged into [SuperBrain](https://github.com/sunilkumarvalmiki/SuperBrain)" > README.md
git add README.md
git commit -m "Archive: merged into SuperBrain"
git push

# 4. Archive via GitHub UI
```

**Rationale**: Consolidate related functionality, reduce confusion

## Short-term Actions (This Month)

### 4. Rename for Clarity

**Repository**: Anonymous-Development-Resources

**New Name**: awesome-dev-resources

**Steps**:
```bash
1. Go to repository Settings
2. Change repository name to "awesome-dev-resources"
3. Update README to include awesome-list badge:
   [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
```

**Rationale**: Follow awesome-list conventions, clearer naming

### 5. Add Missing Licenses

**Repositories** (without LICENSE):
- Open-Jarvis
- ai-context-manager
- polynote
- SuperBrain

**Steps for each**:
```bash
cd repository-name

# Choose appropriate license (MIT recommended for these projects)
# Create LICENSE file
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2024 Sunil Kumar Valmiki

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

git add LICENSE
git commit -m "docs: add MIT license"
git push
```

**Rationale**: Legal clarity, enables others to use and contribute

## Medium-term Actions (Next Quarter)

### 6. Standardize Repository Structure

**Apply to all active repositories**:

**Required files**:
- README.md (comprehensive)
- LICENSE
- .gitignore
- CONTRIBUTING.md
- CODE_OF_CONDUCT.md (for collaborative projects)

**Template structure**:
```
repository/
├── .github/
│   ├── workflows/
│   │   └── ci.yml
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.yml
│   │   └── feature_request.yml
│   └── PULL_REQUEST_TEMPLATE.md
├── src/
├── tests/
├── docs/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
└── .gitignore
```

### 7. Implement Repository Health Checks

**Setup**:
```bash
# Add GitHub Action to check repository health weekly
# (See .github/workflows/repo-health.yml)
```

**Checks**:
- README exists and is comprehensive
- LICENSE exists
- CI is configured
- Issues have templates
- Dependencies are up to date

## Cleanup Checklist

### Week 1
- [ ] Archive: practice
- [ ] Archive: PRICEBOX-CARDS
- [ ] Archive: phone-book
- [ ] Archive: Random
- [ ] Delete: SRM_PMS (after backup)

### Week 2
- [ ] Review Super-Brain vs SuperBrain
- [ ] Merge unique commits
- [ ] Archive Super-Brain
- [ ] Add redirect in Super-Brain README

### Week 3
- [ ] Add LICENSE to Open-Jarvis
- [ ] Add LICENSE to ai-context-manager
- [ ] Add LICENSE to polynote
- [ ] Add LICENSE to SuperBrain

### Week 4
- [ ] Rename Anonymous-Development-Resources
- [ ] Restructure as awesome-list
- [ ] Add awesome badge

## Automation

**Use Repo Manager Agent**:

```bash
# Analyze all repositories
agent-runner github/repo-manager \
  --action cleanup_analysis \
  --owner sunilkumarvalmiki

# Apply recommendations
agent-runner github/repo-manager \
  --action apply_cleanup \
  --recommendations cleanup-recommendations.yaml
```

## Verification

After cleanup:

1. **Profile Check**: Review GitHub profile page
2. **Health Scores**: Re-run health analysis
3. **Documentation**: Ensure all active repos well-documented
4. **Automation**: CI/CD working for active repos

## Expected Outcomes

**Before**:
- 40 repositories
- Average health score: 45/100
- Unclear focus

**After**:
- ~25 active repositories
- Average health score: 70+/100
- Clear focus on AI/ML projects
- Professional appearance

## Maintenance Going Forward

**Monthly**:
- Review repository activity
- Update dependencies
- Archive inactive projects

**Quarterly**:
- Comprehensive health check
- Update documentation
- Review automation

## Related

- [Repository Inventory](./inventory.md)
- [Enhancement Plan](./enhancement-plan.md)
- [Repo Manager Agent](../agents/github/repo-manager.yaml)
