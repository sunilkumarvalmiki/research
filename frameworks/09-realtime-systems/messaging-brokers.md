# Real-time Messaging Brokers

## Major Brokers

**Redis Pub/Sub**: In-memory (microsecond latency, simple model, ephemeral)
**NATS**: Cloud-native (8M+ msg/sec, location transparency, lightweight)
**RabbitMQ**: AMQP standard (reliable delivery, complex routing, mature)
**ZeroMQ**: Library not broker (lowest latency, DIY reliability, embedded)

**Recommendation**: Redis or NATS for simple pub/sub, RabbitMQ for complex routing.

**Last Updated**: December 2024
