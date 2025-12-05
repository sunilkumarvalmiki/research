# Cross-Project Architecture Documentation
# See README.md for detailed architecture overview

architecture:
  name: "Unified AI Ecosystem"
  version: "1.0.0"
  
  components:
    clients:
      - open-jarvis
      - polynote
      - future-applications
    
    protocol:
      - mcp-interface
    
    services:
      - context-service
      - github-service
    
    storage:
      - redis
      - qdrant
      - nats
  
  communication:
    - grpc
    - mcp
    - events
