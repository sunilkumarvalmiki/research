# AI Context Manager MCP Integration

## Overview

AI Context Manager provides shared context across AI tools and sessions using vector storage and Redis.

## Architecture

```
AI Tools → MCP Interface → Context Service
                              ↓
                   Qdrant (Vectors) + Redis (KV)
```

## Features

- **Semantic Search**: Find relevant context
- **Session Management**: Track conversation history
- **Knowledge Base**: Store and retrieve information
- **Cross-Tool**: Share context between different AI assistants

## MCP Integration

```json
{
  "mcp": {
    "servers": {
      "context": {
        "command": "ai-context-server",
        "env": {
          "QDRANT_URL": "http://localhost:6333",
          "REDIS_URL": "redis://localhost:6379"
        }
      }
    }
  }
}
```

## Usage

```python
# Store context
context_manager.store("project_info", {
    "name": "research",
    "tech_stack": ["python", "typescript"],
    "description": "Research hub for SDLC"
})

# Query context
results = context_manager.search("What tech stack are we using?")
```

## Implementation

See [ai-context-manager repository](https://github.com/sunilkumarvalmiki/ai-context-manager).

## Related

- [Cross-Project Architecture](../../cross-project/architecture.md)
