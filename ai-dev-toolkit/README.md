# AI Development Toolkit

## Overview
The **AI Development Toolkit** is a comprehensive collection of reusable prompts, rules, workflows, and best practices designed to standardize and elevate the quality of AI-assisted software development. It supports multiple tools including **VSCode**, **Continue.dev**, **Antigravity**, **GitHub Copilot**, and **AI Toolkit for VSCode**.

## Directory Structure

```
ai-dev-toolkit/
├── prompts/              # Reusable prompt templates
│   ├── ui-ux/            # UI/UX research and design prompts
│   ├── development/      # Development frameworks (Language selection, etc.)
│   ├── testing/          # Test scenario generation prompts
│   ├── agents/           # Specialized agent personas
│   └── templates/        # General purpose templates (Iterative loop, PRD)
├── rules/                # Tool-specific configurations
│   ├── continue-dev/     # Custom instructions for Continue.dev
│   ├── vscode/           # VSCode settings and snippets
│   ├── antigravity/      # Antigravity specific rules
│   └── copilot/          # GitHub Copilot instructions
├── workflows/            # Antigravity workflows (mirrored in .agent/workflows)
├── best-practices/       # Documentation of standards
│   ├── coding-standards.md
│   ├── testing-methodologies.md
│   ├── ui-ux-guidelines.md
│   └── mcp-integration.md
├── templates/            # Document templates (PRD, Plans)
└── mcp-configs/          # MCP server configurations
```

## Quick Start

### 1. For Antigravity Users
- Workflows are available in `.agent/workflows/`.
- Run a workflow: `/workflow-name` (e.g., `/ui-ux-research`).
- Use the **Iterative Validation Loop** in your prompts for better results.

### 2. For Continue.dev Users
- Copy `rules/continue-dev/custom-instructions.md` content to your system prompt.
- Use the `config.json` snippet to configure model settings.

### 3. For VSCode / Copilot Users
- Copy `rules/vscode/settings.json` to your `.vscode/settings.json`.
- Read `rules/copilot/instructions.md` for best practices on prompting Copilot.

## Key Features

### 🔍 UI/UX Research
Comprehensive prompts to generate design systems, responsive layouts, and accessibility audits.
- [UI/UX Research Prompt](prompts/ui-ux/ui-ux-research-prompt.md)

### 📝 PRD Generation
Generate production-grade Product Requirements Documents with a single prompt.
- [PRD Generation Prompt](prompts/templates/prd-generation-prompt.md)

### 🧪 Testing Strategy
Generate test scenarios, automation scripts, and test plans.
- [Test Scenario Generation](prompts/testing/test-scenario-generation.md)

### 💻 Language Selection
Avoid defaulting to Python. Systematically choose the right tool for the job.
- [Language Selection Framework](prompts/development/language-selection-framework.md)

### 🤖 Specialized Agents
Spin up specialized personas like "Code Quality Guardian" or "Task Master".
- [Agent Prompts](prompts/agents/agent-creation-prompts.md)

## Best Practices
- **Iterate**: Use the [Iterative Validation Loop](prompts/templates/iterative-validation-loop.md) to refine outputs.
- **Validate**: Always review AI-generated code and designs.
- **Context**: Provide as much context as possible (files, requirements) to the AI.

## Contributing
1. Create a new branch.
2. Add your prompt, rule, or workflow.
3. Update the README.
4. Submit a Pull Request.

## License
MIT License
