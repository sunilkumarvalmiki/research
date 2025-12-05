# Feature Development Workflow

## Overview

Complete workflow for developing new features from ideation through deployment.

## Prerequisites

- [ ] Access to repository
- [ ] Development environment set up
- [ ] Understanding of project architecture
- [ ] Feature request or requirement documented

## Workflow Steps

### Phase 1: Preparation

#### 1.1 Sync with Main Branch

```bash
git checkout main
git pull origin main
```

**Checkpoint**: Local main branch is up to date

#### 1.2 Create Feature Branch

```bash
git checkout -b feature/GH-{issue-number}-{short-description}
```

Example: `feature/GH-123-oauth-login`

**Checkpoint**: New branch created and checked out

#### 1.3 Review Requirements

- Read the issue or feature request thoroughly
- Clarify ambiguities with stakeholders
- Break down into smaller tasks if needed

**Agent**: `requirements-analyst` can extract structured requirements

```bash
agent-runner requirements-analyst --source github:issue:123 --output requirements.yaml
```

**Checkpoint**: Requirements are clear and documented

### Phase 2: Design

#### 2.1 Architectural Planning

- Determine components affected
- Identify dependencies
- Design data models and APIs
- Consider scalability and performance

**Agent**: `architect` can generate architecture design

```bash
agent-runner architect --requirements requirements.yaml --output architecture.yaml
```

**Checkpoint**: Architecture documented and reviewed

#### 2.2 Create ADRs (if needed)

For significant architectural decisions:

```markdown
# ADR-{number}: {Decision Title}

## Status
Proposed / Accepted / Deprecated

## Context
{Explain the context and problem}

## Decision
{Describe the decision made}

## Consequences
{List positive and negative consequences}
```

**Checkpoint**: Major decisions documented

#### 2.3 Task Decomposition

Break feature into implementable tasks:

- [ ] Task 1: Setup OAuth provider configuration
- [ ] Task 2: Implement OAuth callback handler
- [ ] Task 3: User session management
- [ ] Task 4: UI integration
- [ ] Task 5: Tests
- [ ] Task 6: Documentation

**Agent**: `task-decomposer` can generate task list

**Checkpoint**: Tasks identified and prioritized

### Phase 3: Implementation (TDD Approach)

#### 3.1 Write Tests First

For each component:

```python
# tests/test_oauth.py
def test_oauth_callback_with_valid_code_creates_session():
    # Test implementation
    pass
```

**Checkpoint**: Tests written and failing (Red)

#### 3.2 Implement Minimum Code

Write just enough code to pass tests:

```python
# src/oauth.py
def handle_oauth_callback(code):
    # Minimal implementation
    pass
```

**Agent**: `code-generator` can generate initial implementation

**Checkpoint**: Tests passing (Green)

#### 3.3 Refactor

Improve code quality while keeping tests green:

- Extract common logic
- Improve naming
- Add documentation
- Optimize if needed

**Checkpoint**: Code is clean and tests still pass (Refactor)

#### 3.4 Incremental Commits

Commit after each meaningful unit of work:

```bash
git add .
git commit -m "feat(auth): implement OAuth callback handler"
```

Follow [conventional commits](../rules/global/git-workflow.yaml)

**Checkpoint**: Changes committed with clear message

### Phase 4: Quality Assurance

#### 4.1 Run Linter

```bash
# Python
ruff check .
ruff format --check .

# TypeScript
npm run lint

# Rust
cargo clippy

# Go
golangci-lint run
```

**Checkpoint**: No linting errors

#### 4.2 Run Type Checker

```bash
# Python
mypy src/

# TypeScript
tsc --noEmit
```

**Checkpoint**: No type errors

#### 4.3 Run Test Suite

```bash
# Run all tests
pytest  # Python
npm test  # JavaScript/TypeScript
cargo test  # Rust
go test ./...  # Go
```

**Checkpoint**: All tests passing

#### 4.4 Check Coverage

```bash
pytest --cov=src --cov-report=html
```

**Checkpoint**: Coverage meets threshold (80%+)

#### 4.5 Security Scan

```bash
# Python
bandit -r src/

# JavaScript
npm audit

# Rust
cargo audit
```

**Checkpoint**: No security vulnerabilities

### Phase 5: Documentation

#### 5.1 Code Documentation

- Add docstrings/JSDoc to public APIs
- Update inline comments as needed
- Document complex algorithms

**Agent**: `documentation-writer` can generate docs

**Checkpoint**: Public APIs documented

#### 5.2 Update README

If feature affects usage:

- Update installation instructions
- Add usage examples
- Update API reference

**Checkpoint**: README reflects new feature

#### 5.3 Update Changelog

```markdown
## [Unreleased]

### Added
- OAuth2 login with Google and GitHub providers (#123)
```

**Checkpoint**: Changelog updated

### Phase 6: Code Review

#### 6.1 Self-Review

Review your own code:

- Check for obvious issues
- Verify all files are included
- Ensure no debug code or console.logs
- Verify tests cover edge cases

**Checkpoint**: Self-review complete

#### 6.2 Create Pull Request

```bash
git push origin feature/GH-123-oauth-login
```

Then create PR on GitHub with:

- **Title**: `feat(auth): add OAuth2 login`
- **Description**: Detailed explanation using PR template
- **Labels**: `feature`, `needs-review`
- **Reviewers**: Assign appropriate reviewers

**Checkpoint**: PR created

#### 6.3 Automated Checks

Wait for CI to complete:

- [ ] Tests pass
- [ ] Linting passes
- [ ] Build succeeds
- [ ] Coverage acceptable
- [ ] Security scan passes

**Agent**: `code-reviewer` runs automatically

**Checkpoint**: All CI checks green

#### 6.4 Address Review Comments

- Respond to all comments
- Make requested changes
- Push updates to the same branch
- Request re-review if needed

**Checkpoint**: All review comments addressed

### Phase 7: Merge

#### 7.1 Final Verification

Before merging:

- [ ] All checks passing
- [ ] Required approvals received
- [ ] No merge conflicts
- [ ] Branch up to date with main

**Checkpoint**: Ready to merge

#### 7.2 Merge PR

Use squash merge (preferred):

```
feat(auth): add OAuth2 login (#123)

Implements OAuth2 authentication with Google and GitHub providers.

- Add OAuth provider configuration
- Implement callback handler
- Integrate with user session management
- Add comprehensive tests
- Update documentation

Closes #123
```

**Checkpoint**: PR merged

#### 7.3 Cleanup

```bash
git checkout main
git pull origin main
git branch -d feature/GH-123-oauth-login
```

**Checkpoint**: Local branch cleaned up

#### 7.4 Verify Deployment

Monitor CI/CD pipeline:

- Build completes successfully
- Tests pass in deployment environment
- Feature deployed to staging/production

**Checkpoint**: Feature deployed successfully

## Rollback Procedure

If issues are discovered after merge:

### Option 1: Hot Fix

For minor issues:

1. Create `hotfix/fix-oauth-{issue}` branch
2. Fix the issue
3. Fast-track review
4. Merge and deploy

### Option 2: Revert

For major issues:

```bash
git revert {merge-commit-hash}
git push origin main
```

This creates a new commit that undoes the feature.

## Post-Deployment

### Monitor

- Check error logs
- Monitor performance metrics
- Gather user feedback

### Iterate

- Address feedback in follow-up PRs
- Document lessons learned
- Update workflow if needed

## Tips for Success

1. **Keep PRs Small**: Aim for < 400 lines changed
2. **Commit Often**: Small, focused commits are easier to review
3. **Test Thoroughly**: Cover edge cases and error conditions
4. **Communicate**: Keep team updated on progress
5. **Ask for Help**: Don't hesitate to ask questions
6. **Document Decisions**: Explain "why" not just "what"

## Common Issues

### Merge Conflicts

```bash
git fetch origin main
git rebase origin/main
# Resolve conflicts
git rebase --continue
git push --force-with-lease
```

### CI Failures

- Check logs carefully
- Reproduce locally
- Fix and push updates
- Don't merge with failing CI

### Review Taking Too Long

- Ping reviewers politely
- Ensure PR is ready and well-documented
- Break into smaller PRs if too large

## Related

- [Bug Fix Workflow](./bug-fix.md)
- [Release Process](./release.md)
- [Git Workflow Rules](../rules/global/git-workflow.yaml)
- [Code Quality Rules](../rules/global/code-quality.yaml)
