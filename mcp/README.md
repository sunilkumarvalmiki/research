# Model Context Protocol (MCP) Integration

## Overview

This directory contains configurations and guides for integrating Model Context Protocol (MCP) servers with the research hub and related projects.

## What is MCP?

Model Context Protocol is a standard for AI assistants to securely access tools and data sources. It enables:

- **Tool Access**: File operations, API calls, database queries
- **Context Sharing**: Share information between AI sessions
- **Security**: Controlled access to resources
- **Extensibility**: Easy to add new capabilities

## Directory Structure

- **servers/**: MCP server configurations
- **integrations/**: Integration guides for specific projects

## Available MCP Servers

### GitHub Server

Access GitHub repositories, issues, and pull requests.

**Configuration**: [servers/github.yaml](./servers/github.yaml)

**Capabilities**:
- Create and update files
- Manage issues and PRs
- Search code
- Access repository metadata

### Filesystem Server

Access local filesystem for reading and writing files.

**Configuration**: [servers/filesystem.yaml](./servers/filesystem.yaml)

**Capabilities**:
- Read files and directories
- Write and modify files
- Create directory structures
- Search file contents

## Integrations

### Open-Jarvis

Voice-controlled AI assistant with system integration.

**Guide**: [integrations/open-jarvis.md](./integrations/open-jarvis.md)

### AI Context Manager

Shared context across AI tools and sessions.

**Guide**: [integrations/ai-context-manager.md](./integrations/ai-context-manager.md)

### Polynote

Collaborative notebook environment with AI assistance.

**Guide**: [integrations/polynote.md](./integrations/polynote.md)

## Using MCP Servers

### 1. Configuration

Add MCP server to your AI assistant configuration:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

### 2. Usage

Once configured, the AI assistant can use MCP tools:

```
"Create a new file in the repository called README.md"
"Search for TODO comments in the codebase"
"Create an issue for the bug we just found"
```

## Security Considerations

1. **Token Management**: Store tokens securely in environment variables
2. **Permissions**: Grant minimum necessary permissions
3. **Audit**: Log MCP tool usage
4. **Validation**: Validate all inputs to MCP tools

## Creating Custom MCP Servers

See [MCP Documentation](https://modelcontextprotocol.io/) for creating custom servers.

## Related

- [Agents](../agents/README.md)
- [Cross-Project Architecture](../cross-project/README.md)
