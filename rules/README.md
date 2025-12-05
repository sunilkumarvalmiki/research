# Reusable Development Rules

## Overview

This directory contains reusable rules that enforce best practices, coding standards, and workflows across projects. Rules are organized into three categories:

- **Global Rules**: Universal rules applicable to all projects (code quality, security, git workflow, testing)
- **User Preferences**: Personalized settings and preferences
- **Language-Specific Rules**: Rules tailored for specific programming languages

## Rule Categories

### Global Rules (`global/`)

Universal rules that apply across all projects and languages:

- **code-quality.yaml**: Code complexity, duplication, naming conventions, documentation requirements
- **security.yaml**: Secret management, input validation, dependency scanning
- **git-workflow.yaml**: Branch naming, commit formats, PR requirements
- **testing.yaml**: Coverage requirements, test organization, CI integration

### User Preferences (`user/`)

Personalized configuration that overrides defaults:

- **preferences.yaml**: Individual developer preferences (code style, verbosity, notification settings)

### Language-Specific Rules (`languages/`)

Rules tailored for specific programming languages:

- **python.yaml**: Python tooling, structure, testing, type checking
- **typescript.yaml**: TypeScript configuration, linting, build settings
- **rust.yaml**: Rust tooling, clippy rules, cargo configuration
- **go.yaml**: Go formatting, linting, module structure

## How Rules Work

### 1. Rule Hierarchy

Rules are applied in order of specificity:

```
Language Rules > User Preferences > Global Rules
```

More specific rules override general ones.

### 2. Rule Enforcement

Rules can be enforced at different levels:

- **Required**: Must be followed, violations block PR merge
- **Recommended**: Should be followed, violations generate warnings
- **Optional**: Nice to have, informational only

### 3. Rule Application

Rules are applied through:

- **Linters and Formatters**: Automated tools (ESLint, Pylint, Clippy)
- **CI/CD Pipelines**: Automated checks in GitHub Actions
- **Git Hooks**: Pre-commit and pre-push validation
- **Code Review**: Manual review against rule checklist

## Using Rules

### In Your Project

```yaml
# .rulerc.yaml
extends:
  - "@research/rules/global/code-quality"
  - "@research/rules/global/security"
  - "@research/rules/languages/python"

overrides:
  complexity:
    cyclomatic_max: 15  # Override default of 10
```

### With CI/CD

```yaml
# .github/workflows/ci.yml
- name: Validate Code Quality
  run: |
    rule-checker --config .rulerc.yaml
```

### With Git Hooks

```bash
# .git/hooks/pre-commit
#!/bin/bash
rule-checker --rules global/code-quality --staged
```

## Rule Configuration

### Global Configuration

Create `.rulerc.yaml` in your project root:

```yaml
# Which rule sets to apply
extends:
  - global/code-quality
  - global/security
  - languages/python

# Override specific rules
overrides:
  code_quality:
    complexity:
      cyclomatic_max: 15

# Disable specific rules
disabled:
  - security.secrets.detection  # If using different tool
```

### Per-File Overrides

Use inline comments to override rules:

```python
# rule: disable cyclomatic-complexity
def complex_function():
    # Complex but necessary logic
    pass
```

## Creating Custom Rules

### 1. Define Rule Schema

```yaml
rule:
  id: "custom-rule-id"
  name: "Custom Rule Name"
  category: "quality|security|style"
  severity: "error|warning|info"
  
  description: |
    Clear description of what the rule enforces
  
  rationale: |
    Why this rule exists
  
  examples:
    good:
      - code: "# Good example"
    bad:
      - code: "# Bad example"
```

### 2. Implement Rule Logic

Rules can be implemented as:
- Linter plugins
- Custom scripts
- CI checks
- Review checklists

### 3. Test Rules

```yaml
tests:
  - name: "Rule detects violation"
    input: "# Code with violation"
    expected: "violation detected"
  
  - name: "Rule passes valid code"
    input: "# Valid code"
    expected: "no violations"
```

## Rule Maintenance

### Versioning

Rules follow semantic versioning:

- **Major**: Breaking changes to rule definitions
- **Minor**: New rules or non-breaking changes
- **Patch**: Bug fixes and clarifications

### Updates

Rules are reviewed and updated:

- **Quarterly**: Review for relevance and effectiveness
- **Ad-hoc**: When new best practices emerge
- **Community**: Accept proposals from team members

### Deprecation

When deprecating a rule:

1. Mark as deprecated with migration guide
2. Keep for at least one major version
3. Provide alternative or successor rule
4. Update documentation

## Best Practices

1. **Start Minimal**: Begin with essential rules, add more as needed
2. **Measure Impact**: Track rule violations and their fixes
3. **Be Pragmatic**: Rules should help, not hinder productivity
4. **Document Exceptions**: When breaking a rule, document why
5. **Review Regularly**: Rules should evolve with the codebase
6. **Automate Enforcement**: Use tools rather than manual checks
7. **Provide Context**: Explain why rules exist, not just what they are

## Integration with Agents

Agents use these rules to:

- **Code Generator**: Generate code following style rules
- **Code Reviewer**: Check code against quality and security rules
- **Test Writer**: Follow testing conventions
- **PR Reviewer**: Validate PR compliance with git workflow rules

## Tools and Integrations

### Supported Tools

- **Python**: Ruff, MyPy, Bandit, pytest
- **TypeScript**: ESLint, Prettier, TypeScript compiler
- **Rust**: Clippy, Rustfmt, cargo
- **Go**: gofmt, golangci-lint, go vet

### IDE Integration

Most rules can be enforced in IDEs:

- **VS Code**: ESLint, Pylint extensions
- **JetBrains**: Built-in inspections
- **Vim/Neovim**: ALE, CoC plugins

## Examples

### Example 1: Enforce Test Coverage

```yaml
# In your project
extends:
  - global/testing

overrides:
  testing:
    coverage_min: 90  # Higher than default 80%
```

### Example 2: Language-Specific Style

```yaml
# For Python project
extends:
  - global/code-quality
  - languages/python

overrides:
  python:
    tooling:
      formatter: "black"  # Instead of default "ruff format"
```

### Example 3: Custom Security Rule

```yaml
# custom-rules.yaml
rules:
  - id: "no-hardcoded-secrets"
    category: "security"
    severity: "error"
    pattern: "(password|api_key|secret)\\s*=\\s*['\"]"
    message: "Hardcoded secrets detected"
```

## References

- [Global Rules Documentation](./global/README.md)
- [Language-Specific Rules](./languages/README.md)
- [Rule Configuration Guide](../docs/rule-configuration.md)
- [Agent Integration](../agents/README.md)
