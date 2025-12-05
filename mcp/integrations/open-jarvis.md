# Open-Jarvis MCP Integration

## Overview

Open-Jarvis is a voice-controlled AI assistant with system control capabilities. This guide covers MCP integration for enhanced functionality.

## Architecture

```
Voice Input → Speech Recognition → Open-Jarvis Core → MCP Tools → Actions
                                         ↓
                                  Context Manager
```

## MCP Configuration

Add to Open-Jarvis config:

```json
{
  "mcp": {
    "servers": {
      "github": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-github"],
        "env": {
          "GITHUB_TOKEN": "${GITHUB_TOKEN}"
        }
      },
      "filesystem": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-filesystem", "~/projects"]
      }
    }
  }
}
```

## Voice Commands

### Repository Management

- "Jarvis, create a new issue about the login bug"
- "Jarvis, show me the latest commits in research repo"
- "Jarvis, create a PR for my current branch"

### File Operations

- "Jarvis, read the README file"
- "Jarvis, create a new Python file for the database module"

### System Control

- "Jarvis, open VS Code in the current project"
- "Jarvis, run the test suite"

## Integration Benefits

1. **Hands-Free Development**: Code while away from keyboard
2. **Quick Actions**: Common tasks via voice
3. **Context Awareness**: Jarvis remembers project context
4. **Multi-Modal**: Voice + text + GUI

## Implementation

See [Open-Jarvis repository](https://github.com/sunilkumarvalmiki/Open-Jarvis) for full implementation.

## Related Projects

- [ai-context-manager](./ai-context-manager.md): Shared context
- [polynote](./polynote.md): Notebook integration
