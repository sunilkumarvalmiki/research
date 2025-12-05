# Real-time Systems Frameworks

## Overview

Analysis of frameworks for building real-time, low-latency systems including messaging brokers, WebSocket frameworks, and high-frequency systems.

## 📚 Contents

1. **[Messaging Brokers](./messaging-brokers.md)**
   - Redis Pub/Sub, RabbitMQ, NATS, ZeroMQ
   - Latency and throughput characteristics

2. **[WebSocket Frameworks](./websocket-frameworks.md)**
   - Socket.io, ws, Soketi, Ably
   - Connection scaling and reliability

3. **[Decision Matrix](./decision-matrix.md)**
   - Latency comparison
   - Scalability analysis
   - Use case recommendations

## 🎯 Performance Metrics

### Latency Requirements
- **Ultra-low (<1ms)**: Trading, gaming
- **Low (<10ms)**: Collaboration, chat
- **Moderate (<100ms)**: Notifications, updates

### Throughput Requirements
- **High (1M+ msg/sec)**: Event streaming
- **Medium (100K msg/sec)**: Real-time apps
- **Low (<10K msg/sec)**: Simple pub/sub

## 📊 Quick Comparison

### Messaging Brokers

| Broker | Latency | Throughput | Complexity | Best For |
|--------|---------|------------|------------|----------|
| **Redis** | <1ms | 1M+ msg/sec | ⭐⭐⭐⭐⭐ | Simple pub/sub |
| **NATS** | <1ms | 8M+ msg/sec | ⭐⭐⭐⭐ | Cloud-native |
| **RabbitMQ** | 1-5ms | 100K msg/sec | ⭐⭐⭐ | Complex routing |
| **ZeroMQ** | <1ms | 10M+ msg/sec | ⭐⭐ | Custom protocols |

### WebSocket Frameworks

| Framework | Connections/Instance | Latency | Features | Maturity |
|-----------|---------------------|---------|----------|----------|
| **ws** | 100K+ | <5ms | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Socket.io** | 10K+ | <10ms | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Soketi** | 50K+ | <8ms | ⭐⭐⭐⭐ | ⭐⭐⭐ |

## 🚀 Recommendations

**Simple pub/sub**: Redis, NATS  
**Complex routing**: RabbitMQ  
**Ultra-low latency**: ZeroMQ  
**WebSocket with features**: Socket.io  
**WebSocket performance**: ws  
**Gaming/high-frequency**: Custom UDP + state sync

---

**Last Updated**: December 2024
