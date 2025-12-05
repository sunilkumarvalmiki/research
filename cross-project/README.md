# Cross-Project Communication Architecture

## Overview

Unified AI ecosystem architecture connecting Open-Jarvis, AI Context Manager, Polynote, and future projects.

## System Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                     Unified AI Ecosystem                     │
└─────────────────────────────────────────────────────────────┘

┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│ Open-Jarvis  │     │   Polynote   │     │  Future Apps │
│   (Voice)    │     │  (Notebooks) │     │              │
└───────┬──────┘     └──────┬───────┘     └──────┬───────┘
        │                   │                     │
        └───────────────────┼─────────────────────┘
                            │
                   ┌────────▼────────┐
                   │  MCP Interface  │
                   │   (Protocol)    │
                   └────────┬────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
  ┌─────▼─────┐     ┌──────▼──────┐    ┌──────▼──────┐
  │  Context  │     │   GitHub    │    │     gRPC    │
  │  Service  │     │   Service   │    │   Services  │
  └─────┬─────┘     └─────────────┘    └─────────────┘
        │
  ┌─────▼─────┐
  │  Storage  │
  ├───────────┤
  │   Redis   │  Key-Value Store
  │  Qdrant   │  Vector Database
  │   NATS    │  Message Queue
  └───────────┘
```

## Components

### 1. Client Applications

- **Open-Jarvis**: Voice-controlled system assistant
- **Polynote**: Collaborative notebooks
- **Future**: Mobile apps, CLI tools, web dashboards

### 2. MCP Layer

- Standardized protocol for AI tool access
- Secure, controlled access to resources
- Extensible for new capabilities

### 3. Context Service

**Purpose**: Shared knowledge and state across applications

**Features**:
- Semantic search (via Qdrant vector DB)
- Session management (via Redis)
- Event streaming (via NATS)
- gRPC API for high performance

**API**:
```protobuf
service ContextService {
  rpc StoreContext(ContextRequest) returns (ContextResponse);
  rpc QueryContext(QueryRequest) returns (QueryResponse);
  rpc StreamUpdates(StreamRequest) returns (stream Update);
}
```

### 4. Storage Layer

- **Redis**: Fast key-value store for sessions, cache
- **Qdrant**: Vector database for semantic search
- **NATS**: Message queue for event streaming

## Communication Patterns

### 1. Synchronous (gRPC)

For immediate requests:

```python
# Store context
response = context_service.StoreContext({
    "key": "current_project",
    "value": "research",
    "metadata": {"type": "project"}
})

# Query context
results = context_service.QueryContext({
    "query": "What's the current project?",
    "limit": 5
})
```

### 2. Asynchronous (NATS)

For events and notifications:

```python
# Publish event
nats.publish("ai.code.generated", {
    "file": "main.py",
    "language": "python"
})

# Subscribe to events
nats.subscribe("ai.*.generated", handler)
```

### 3. MCP (Tool Access)

For AI assistant capabilities:

```json
{
  "tool": "create_file",
  "parameters": {
    "path": "README.md",
    "content": "# Project"
  }
}
```

## Deployment Options

### Option 1: Local Development

```bash
docker-compose up
```

All services run locally for development.

### Option 2: Distributed

- Context Service: Cloud-hosted
- Storage: Managed services (Redis Cloud, Qdrant Cloud)
- Clients: Local or deployed

### Option 3: Hybrid

- Storage: Cloud
- Context Service: Local or cloud
- Clients: Mix of local and cloud

## Data Flow Examples

### Example 1: Code Generation

```
1. User asks Jarvis to generate code
2. Jarvis queries Context Service for project info
3. Context Service returns relevant context
4. Jarvis generates code using context
5. Code saved via GitHub MCP
6. Event published to NATS
7. Other tools notified of new code
```

### Example 2: Notebook Execution

```
1. User runs notebook cell
2. Polynote queries Context Service for data
3. Results cached in Redis
4. Visualizations generated
5. Results stored back to Context Service
6. Available to other tools
```

## Security

- **Authentication**: Token-based auth for all services
- **Authorization**: Role-based access control
- **Encryption**: TLS for all communication
- **Isolation**: Namespace separation per user/project

## Scalability

- **Horizontal Scaling**: Add more Context Service instances
- **Caching**: Redis for frequently accessed data
- **Partitioning**: Shard Qdrant by user/project
- **Load Balancing**: Distribute requests across services

## Monitoring

- **Metrics**: Prometheus for service metrics
- **Logs**: Centralized logging (ELK stack)
- **Tracing**: Distributed tracing (Jaeger)
- **Alerts**: Alert on errors and performance issues

## Future Enhancements

1. **Mobile Clients**: iOS/Android apps
2. **Web Dashboard**: Central control panel
3. **Plugin System**: Third-party integrations
4. **Federation**: Connect multiple ecosystems
5. **AI Model Hosting**: Serve custom models

## Implementation

See implementation files:
- [docker-compose.yaml](./docker-compose.yaml): Local deployment
- [context-service.proto](./context-service.proto): gRPC definitions

## Related

- [MCP Integration](../mcp/README.md)
- [Open-Jarvis](https://github.com/sunilkumarvalmiki/Open-Jarvis)
- [AI Context Manager](https://github.com/sunilkumarvalmiki/ai-context-manager)
- [Polynote](https://github.com/sunilkumarvalmiki/polynote)
