# Release Process Workflow

## Overview

Standardized process for creating and publishing software releases.

## Prerequisites

- [ ] All features for release are merged
- [ ] All tests passing on main branch
- [ ] Changelog updated
- [ ] Documentation current
- [ ] Security scans passing

## Release Steps

### 1. Prepare Release

#### 1.1 Determine Version

Follow [Semantic Versioning](https://semver.org/):

- **Major** (X.0.0): Breaking changes
- **Minor** (0.X.0): New features (backwards compatible)
- **Patch** (0.0.X): Bug fixes

**Agent**: `release-manager` can suggest next version

#### 1.2 Create Release Branch

```bash
git checkout main
git pull origin main
git checkout -b release/v{version}
```

### 2. Update Version

#### 2.1 Update Version Files

```python
# Python: pyproject.toml
[project]
version = "1.2.0"

# JavaScript: package.json
{
  "version": "1.2.0"
}

# Rust: Cargo.toml
[package]
version = "1.2.0"
```

#### 2.2 Update Changelog

```markdown
## [1.2.0] - 2024-12-05

### Added
- New OAuth2 authentication (#123)
- User dashboard (#124)

### Fixed
- Memory leak in cache (#125)

### Changed
- Improved error messages (#126)
```

### 3. Build and Test

#### 3.1 Full Test Suite

```bash
pytest --cov  # Python
npm test  # JavaScript
cargo test  # Rust
go test ./...  # Go
```

#### 3.2 Build Artifacts

```bash
# Python
python -m build

# JavaScript
npm run build

# Rust
cargo build --release

# Go
go build -o bin/app
```

#### 3.3 Integration Tests

Run full integration and E2E tests on staging environment.

### 4. Create Release

#### 4.1 Commit and Tag

```bash
git add .
git commit -m "chore: bump version to v1.2.0"
git tag -a v1.2.0 -m "Release version 1.2.0"
```

#### 4.2 Push Release

```bash
git push origin release/v1.2.0
git push origin v1.2.0
```

#### 4.3 Create GitHub Release

- Go to GitHub Releases
- Create new release from tag
- Add release notes from changelog
- Attach build artifacts (if applicable)

### 5. Deploy

#### 5.1 Deploy to Production

**Agent**: `ci-cd-agent` handles deployment

```bash
# Automated via CI/CD on tag push
```

#### 5.2 Verify Deployment

- Check application is running
- Run smoke tests
- Monitor error logs
- Verify metrics dashboard

### 6. Post-Release

#### 6.1 Merge to Main

```bash
git checkout main
git merge release/v1.2.0
git push origin main
```

#### 6.2 Cleanup

```bash
git branch -d release/v1.2.0
```

#### 6.3 Announce Release

- Post to team chat
- Update project website
- Notify users (if public project)
- Social media (if applicable)

## Rollback Procedure

If critical issues discovered:

### 1. Immediate Rollback

```bash
# Revert to previous version in deployment
kubectl rollout undo deployment/app  # Kubernetes
# or
git revert v1.2.0
git tag v1.2.1
# Deploy v1.2.1
```

### 2. Create Hotfix

Follow [hotfix workflow](../rules/global/git-workflow.yaml#hotfix)

### 3. Communicate

- Notify users of rollback
- Explain the issue
- Provide timeline for fix

## Release Types

### Stable Release

Full production release following all steps above.

### Pre-Release (Alpha/Beta)

```bash
git tag -a v1.2.0-beta.1 -m "Beta release"
```

Mark as pre-release on GitHub.

### Hotfix Release

Emergency fix for production issue:

1. Branch from main (not develop)
2. Fix issue
3. Test thoroughly
4. Release as patch version
5. Merge back to main AND develop

## Automation

Configure CI/CD to automate:

- Version bumping
- Changelog generation
- Build creation
- Deployment
- Release notes

## Checklist

Before tagging release:

- [ ] All tests passing
- [ ] Documentation updated
- [ ] Changelog complete
- [ ] Version bumped
- [ ] Security scan clean
- [ ] Performance acceptable
- [ ] Breaking changes documented
- [ ] Migration guide (if needed)
- [ ] Stakeholders notified

## Related

- [Feature Development](./feature-development.md)
- [Git Workflow](../rules/global/git-workflow.yaml)
- [CI/CD Agent](../agents/deployment/ci-cd-agent.yaml)
