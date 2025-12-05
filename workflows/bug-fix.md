# Bug Fix Workflow

## Overview

Efficient process for fixing bugs and deploying fixes.

## Prerequisites

- [ ] Bug reported with reproduction steps
- [ ] Bug confirmed and prioritized
- [ ] Root cause identified

## Workflow Steps

### 1. Triage

#### 1.1 Assess Severity

- **Critical**: Production broken, immediate hotfix needed
- **High**: Major functionality broken, fix within 24h
- **Medium**: Important but not blocking, fix in next sprint
- **Low**: Minor issue, fix when convenient

#### 1.2 Reproduce Bug

```bash
# Create minimal reproduction case
# Document steps in issue
```

### 2. Investigation

#### 2.1 Identify Root Cause

- Review error logs
- Check recent changes
- Add debug logging if needed
- Use debugger

#### 2.2 Determine Fix Scope

- Which files need changes
- Impact on other features
- Risk of regression

### 3. Fix Implementation

#### 3.1 Create Branch

```bash
git checkout main
git pull origin main
git checkout -b fix/GH-{issue}-{description}
```

Example: `fix/GH-456-login-redirect`

#### 3.2 Write Test

First, write test that fails due to bug:

```python
def test_login_redirects_to_dashboard():
    # This currently fails due to bug
    response = login_user("user@example.com", "password")
    assert response.redirect_url == "/dashboard"
```

#### 3.3 Implement Fix

Make minimal changes to fix the bug:

```python
def login_user(email, password):
    # Fix: Add missing redirect
    if authenticate(email, password):
        return redirect("/dashboard")  # This line was missing
```

#### 3.4 Verify Fix

```bash
# Run specific test
pytest tests/test_login.py::test_login_redirects_to_dashboard

# Run related tests
pytest tests/test_auth.py

# Run full suite
pytest
```

### 4. Quality Checks

Same as feature development:

- [ ] Linting passes
- [ ] Type checking passes
- [ ] All tests pass
- [ ] Coverage maintained
- [ ] No security issues

### 5. Deploy

#### For Critical Bugs (Hotfix)

```bash
# Fast-track review
git push origin fix/GH-456-login-redirect
# Create PR with "hotfix" label
# Get expedited review
# Merge and deploy immediately
```

#### For Non-Critical Bugs

Follow normal feature development workflow.

## Bug Documentation

### In Commit Message

```
fix(auth): correct login redirect URL

Users were being redirected to "/" instead of "/dashboard"
after successful login. This fix ensures proper redirect
to the dashboard.

Fixes #456
```

### In Code

```python
def login_user(email, password):
    """Authenticate user and redirect to dashboard.
    
    Note: Ensure redirect goes to /dashboard, not /
    See issue #456 for context.
    """
```

## Regression Prevention

### Add Regression Test

```python
@pytest.mark.regression
def test_login_redirect_regression():
    """Regression test for issue #456."""
    # Test to prevent this bug from recurring
```

### Root Cause Analysis

Document in issue:

- What was the bug?
- Why did it happen?
- How was it fixed?
- How do we prevent similar bugs?

## Critical Bug Procedure

For production-breaking bugs:

### 1. Immediate Response

- Alert team
- Stop deployments
- Assess impact

### 2. Quick Fix

- Create hotfix branch from main
- Fix with minimal changes
- Test thoroughly but quickly
- Fast-track review (15-minute approval)

### 3. Emergency Deploy

```bash
git tag -a v1.2.1 -m "Hotfix: fix critical login issue"
git push origin v1.2.1
# CI/CD deploys automatically
```

### 4. Monitor

- Watch error rates
- Check user reports
- Verify fix effectiveness

### 5. Post-Mortem

Document incident:

- Timeline
- Root cause
- Fix applied
- Prevention measures

## Common Bug Patterns

### Off-by-One Errors

```python
# Bad
for i in range(len(items) - 1):  # Misses last item

# Good
for i in range(len(items)):
```

### Null/None Handling

```python
# Bad
user.name.upper()  # Crashes if user.name is None

# Good
user.name.upper() if user.name else ""
```

### Race Conditions

```python
# Bad
if not exists(file):
    create(file)  # Another process might create it first

# Good
try:
    create(file)
except FileExistsError:
    pass
```

## Related

- [Feature Development](./feature-development.md)
- [Testing Rules](../rules/global/testing.yaml)
- [Incident Responder Agent](../agents/operations/incident-responder.yaml)
