# Development Workflows

## Overview

This directory contains standardized workflows for common development activities. These workflows provide consistent, repeatable processes for teams and can be automated using the agents defined in `../agents/`.

## Available Workflows

- **[Feature Development](./feature-development.md)**: Complete process for developing new features
- **[Release Process](./release.md)**: Steps for creating and publishing releases
- **[Bug Fix Workflow](./bug-fix.md)**: Process for fixing bugs efficiently
- **[Research Workflow](./research.md)**: Guidelines for conducting technical research

## Using Workflows

### 1. Manual Execution

Follow the workflow steps manually for hands-on learning or when automation isn't available.

### 2. Agent-Automated

Use agents to automate workflow steps:

```bash
workflow-runner --workflow feature-development --issue GH-123
```

### 3. CI/CD Integration

Workflows can trigger automatically via GitHub Actions or other CI/CD systems.

## Workflow Structure

Each workflow follows this structure:

1. **Prerequisites**: What must be in place before starting
2. **Steps**: Detailed, sequential actions to take
3. **Checkpoints**: Verification points to ensure quality
4. **Outputs**: What should exist when complete
5. **Rollback**: How to undo if needed

## Customization

Workflows can be customized per project by:

- Forking and modifying workflow files
- Using workflow templates with variables
- Creating project-specific workflows that extend these base workflows

## Integration with Agents

Workflows reference agents for automation:

- **Feature Development** uses: Requirements Analyst, Architect, Code Generator, Test Writer, Code Reviewer
- **Release** uses: Release Manager, CI/CD Agent, Documentation Writer
- **Bug Fix** uses: Incident Responder, Code Generator, Test Writer

## Best Practices

1. **Follow Sequentially**: Don't skip steps unless documented as optional
2. **Document Deviations**: If you deviate from the workflow, document why
3. **Improve Continuously**: Suggest improvements based on experience
4. **Automate When Possible**: Use agents to reduce manual work
5. **Review Outcomes**: Ensure each step produces expected results

## References

- [Agents Directory](../agents/README.md)
- [Global Rules](../rules/README.md)
- [MCP Integration](../mcp/README.md)
