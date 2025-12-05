# GitHub Copilot Instructions for Research Repository

## Repository Context

This is a comprehensive research repository covering:
- Software development lifecycle (SDLC) agents
- Development rules and best practices
- Workflow templates
- MCP (Model Context Protocol) integrations
- Cross-project architecture
- Funding and monetization strategies
- Profile analysis and recommendations

## Code Style Guidelines

### General
- Follow language-specific style guides in `rules/languages/`
- Apply global rules from `rules/global/`
- Use conventional commits format
- Keep changes minimal and focused

### Documentation
- Use Markdown for all documentation
- Follow consistent heading structure
- Include code examples where relevant
- Cross-reference related documents
- Use YAML for configuration files

### YAML Files
- Use 2-space indentation
- Quote strings when necessary
- Include comments for complex configurations
- Validate YAML syntax before committing

## File Organization

### Agents (`agents/`)
- Each agent in its own YAML file
- Follow `base-agent.yaml` template
- Include examples and documentation
- Group by domain (ideation, planning, development, etc.)

### Rules (`rules/`)
- Global rules apply across all projects
- Language-specific rules for Python, TypeScript, Rust, Go
- User preferences override defaults
- Extensive documentation and examples

### Workflows (`workflows/`)
- Step-by-step process documentation
- Include checkpoints and verification steps
- Link to relevant agents and rules
- Provide rollback procedures

## Coding Patterns

### When Creating New Agents
```yaml
agent:
  id: "{domain}-{name}-v{version}"
  name: "Human Readable Name"
  domain: "ideation|planning|development|deployment|operations|github"
  version: "1.0.0"
# ... follow base-agent.yaml structure
```

### When Adding Rules
```yaml
rule_category:
  version: "1.0.0"
  
  specific_rule:
    description: "Clear description"
    rationale: "Why this rule exists"
    examples:
      good: "Good example"
      bad: "Bad example"
```

### When Writing Workflows
```markdown
# Workflow Name

## Overview
Brief description

## Prerequisites
- [ ] Requirement 1
- [ ] Requirement 2

## Steps
### Phase 1: Name
#### 1.1 Step
Description and commands
**Checkpoint**: What should be verified
```

## Best Practices for Suggestions

### DO:
- Suggest improvements aligned with existing structure
- Reference relevant rules and agents
- Provide complete examples
- Include error handling
- Add documentation comments
- Cross-reference related files
- Follow conventional commits

### DON'T:
- Suggest breaking changes without discussion
- Introduce new dependencies without justification
- Create duplicate or redundant content
- Skip error handling
- Omit documentation
- Ignore existing patterns

## Common Tasks

### Adding a New Agent
1. Choose appropriate domain directory
2. Copy `base-agent.yaml` as template
3. Fill in all required sections
4. Add specific capabilities and examples
5. Update domain README if needed

### Adding a New Rule
1. Determine if global or language-specific
2. Follow existing rule structure
3. Include description, rationale, examples
4. Add both good and bad examples
5. Document exceptions if applicable

### Adding a New Workflow
1. Create in `workflows/` directory
2. Follow step-by-step format
3. Include prerequisites and checkpoints
4. Link to relevant agents and rules
5. Provide rollback procedures

## Review Checklist

Before suggesting changes, verify:
- [ ] Follows existing patterns and structure
- [ ] Includes documentation
- [ ] Has examples where appropriate
- [ ] YAML is valid (if applicable)
- [ ] Markdown is properly formatted
- [ ] Cross-references are correct
- [ ] No duplicate content
- [ ] Aligns with project goals

## Project-Specific Knowledge

### This Repository's Purpose
- Central knowledge base for SDLC best practices
- Agent specifications for automation
- Reusable rules and workflows
- Integration guides for AI tools
- Funding and growth strategies

### Key Components
- **Agents**: Atomic, composable SDLC automation
- **Rules**: Enforceable best practices
- **Workflows**: Step-by-step processes
- **MCP**: Tool integration protocol
- **Cross-Project**: Unified architecture
- **Funding**: Sustainability strategies

### Related Projects
- Open-Jarvis: Voice AI assistant
- ai-context-manager: Shared context service
- polynote: Collaborative notebooks
- SuperBrain: Knowledge management

## Helpful Commands

### Validate YAML
```bash
yamllint file.yaml
```

### Validate Markdown
```bash
markdownlint file.md
```

### Check Links
```bash
markdown-link-check file.md
```

## Questions to Ask

When unclear about a change:
1. What is the goal of this change?
2. Does it align with existing patterns?
3. Is there a similar example to follow?
4. Should this be documented?
5. Are there related files to update?

## Getting Started

For context on any topic, refer to:
- `agents/README.md` - Agent system overview
- `rules/README.md` - Rules system overview
- `workflows/README.md` - Workflow guidance
- `mcp/README.md` - MCP integration
- `funding/README.md` - Funding strategies
- `profile-analysis/README.md` - Profile improvements

---

Remember: This is a research and documentation repository. Quality, clarity, and completeness are paramount. Suggest changes that maintain these standards.
