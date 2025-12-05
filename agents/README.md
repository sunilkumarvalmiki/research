# Atomic SDLC Agents

## Overview

This directory contains specifications for atomic, composable agents that handle specific phases of the Software Development Lifecycle (SDLC). Each agent is designed to be:

- **Atomic**: Focused on a single, well-defined responsibility
- **Composable**: Can be combined with other agents to create workflows
- **Observable**: Provides clear inputs, outputs, and state transitions
- **Testable**: Deterministic behavior with verifiable outcomes
- **MCP-Compatible**: Integrates with Model Context Protocol for tool access

## Agent Architecture

### Design Principles

1. **Single Responsibility**: Each agent handles one aspect of the SDLC
2. **Clear Contracts**: Well-defined inputs and outputs using structured formats
3. **Event-Driven**: Agents communicate through events and can be triggered automatically
4. **Tool Integration**: Leverage MCP servers for file operations, GitHub, databases, etc.
5. **Human-in-the-Loop**: Support manual review and approval at critical stages

### Agent Lifecycle

```
┌─────────────┐
│   Trigger   │ (Event, Schedule, Manual)
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Validate   │ (Check inputs, dependencies)
│   Inputs    │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Execute   │ (Perform agent logic)
│   Logic     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Generate   │ (Format outputs)
│   Outputs   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Notify    │ (Emit events, update state)
└─────────────┘
```

## Agent Domains

### Ideation
Agents that help define what to build:
- **Requirements Analyst**: Extracts and structures requirements
- **Market Researcher**: Analyzes market needs and competition
- **Feasibility Assessor**: Evaluates technical and business feasibility

### Planning
Agents that determine how to build it:
- **Architect**: Designs system architecture and selects patterns
- **Task Decomposer**: Breaks down work into manageable tasks
- **Estimator**: Provides time and resource estimates

### Development
Agents that build the solution:
- **Code Generator**: Creates code following best practices
- **Test Writer**: Generates comprehensive test suites
- **Code Reviewer**: Performs automated code review
- **Documentation Writer**: Creates technical documentation

### Deployment
Agents that release the solution:
- **CI/CD Agent**: Manages continuous integration and deployment
- **Infrastructure Agent**: Provisions and configures infrastructure
- **Release Manager**: Orchestrates release processes

### Operations
Agents that maintain the solution:
- **Monitoring Agent**: Tracks system health and performance
- **Incident Responder**: Handles alerts and incidents

### GitHub
Agents for repository management:
- **Repo Manager**: Manages repository lifecycle and health
- **PR Reviewer**: Automates pull request review
- **Cleanup Agent**: Maintains repository hygiene

## How to Use Agents

### 1. Direct Invocation

```bash
# Using an agent directly with inputs
agent-runner --agent requirements-analyst \
  --input conversation.txt \
  --output requirements.yaml
```

### 2. Workflow Integration

```yaml
# In workflows/feature-development.md
steps:
  - agent: requirements-analyst
    inputs:
      source: github-issue-123
    outputs:
      requirements: requirements.yaml
  
  - agent: architect
    inputs:
      requirements: requirements.yaml
    outputs:
      architecture: architecture.md
```

### 3. Event-Driven

```yaml
# Agent configuration
triggers:
  events:
    - "issue.opened"
    - "issue.commented"
  filters:
    labels: ["enhancement"]
```

## Agent Communication Patterns

### 1. Sequential Chaining
Output of one agent becomes input to the next:
```
Requirements → Architecture → Tasks → Implementation
```

### 2. Parallel Execution
Multiple agents work on different aspects simultaneously:
```
                ┌─→ Code Generator
Requirements ───┼─→ Test Writer
                └─→ Documentation Writer
```

### 3. Hierarchical Orchestration
Parent agent coordinates child agents:
```
Release Manager
  ├─→ Test Runner
  ├─→ Build Agent
  ├─→ Deploy Agent
  └─→ Notification Agent
```

### 4. Event-Based Collaboration
Agents subscribe to events and react:
```
PR Created → Code Reviewer → Test Runner → Merge Coordinator
```

## MCP Integration

Agents leverage MCP servers for tool access:

### Available MCP Tools

- **GitHub Server**: Repository operations, issues, PRs, files
- **Filesystem Server**: Local file operations
- **Database Server**: Persistent storage
- **Vector Database**: Semantic search and embeddings
- **Message Queue**: Event distribution

### Using MCP in Agents

```yaml
# In agent specification
dependencies:
  tools:
    - name: github
      operations:
        - create_issue
        - create_pull_request
        - get_file_contents
    
    - name: filesystem
      operations:
        - read_file
        - write_file
```

## Configuration and Customization

### Environment Variables

```bash
# Agent runtime configuration
AGENT_TIMEOUT=300s
AGENT_MAX_RETRIES=3
AGENT_LOG_LEVEL=info
MCP_SERVERS_PATH=/path/to/mcp/servers
```

### User Preferences

Agents respect user preferences defined in `../rules/user/preferences.yaml`:

```yaml
code_style:
  indentation: spaces
  spaces_per_indent: 2
  
communication:
  verbosity: detailed
  notify_on: ["error", "completion"]
```

## Best Practices

1. **Define Clear Boundaries**: Each agent should have a well-scoped responsibility
2. **Use Structured Data**: Prefer YAML/JSON over free text for agent communication
3. **Include Examples**: Every agent spec should have usage examples
4. **Version Agents**: Use semantic versioning for backward compatibility
5. **Handle Failures Gracefully**: Implement retries and fallback strategies
6. **Log Everything**: Comprehensive logging for debugging and auditing
7. **Test Agent Composition**: Verify that agents work correctly when chained

## Testing Agents

### Unit Testing
Test agent logic in isolation with mock inputs:

```yaml
test:
  name: "Requirements extraction from issue"
  agent: requirements-analyst
  mock_input:
    type: github_issue
    content: "We need a user login system"
  expected_output:
    user_stories:
      - "As a user, I want to log in..."
```

### Integration Testing
Test agent interactions in workflows:

```yaml
test:
  name: "Full feature development workflow"
  workflow: feature-development
  start_event: issue.opened
  expected_outcomes:
    - pull_request_created
    - tests_passing
```

## Extending the System

### Creating a New Agent

1. Copy `base-agent.yaml` as a template
2. Define purpose, capabilities, and contracts
3. Implement agent logic
4. Add tests and examples
5. Document integration points
6. Submit PR for review

### Adding MCP Tools

1. Create tool specification in `../mcp/servers/`
2. Add tool to agent dependencies
3. Update agent logic to use tool
4. Test with actual MCP server

## References

- [Base Agent Specification](./base-agent.yaml)
- [MCP Integration Guide](../mcp/README.md)
- [Development Workflows](../workflows/README.md)
- [Global Rules](../rules/README.md)
