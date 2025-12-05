# Embedded & Edge Computing Frameworks

## Overview

Analysis of frameworks for resource-constrained environments including RTOS, edge ML deployment, and embedded systems development.

## 📚 Contents

1. **[RTOS Frameworks](./rtos-frameworks.md)**
   - FreeRTOS, Zephyr, NuttX, RT-Thread
   - Real-time guarantees and scheduling

2. **[Edge ML](./edge-ml.md)**
   - TensorFlow Lite, ONNX Runtime
   - Edge Impulse, TinyML

3. **[Decision Matrix](./decision-matrix.md)**
   - Memory footprint comparison
   - Real-time capabilities
   - Hardware support

## 🎯 Key Constraints

### Resource Limitations
- **Memory**: 64KB - 2MB RAM typical
- **Storage**: 256KB - 16MB flash typical
- **CPU**: 100 MHz - 1 GHz
- **Power**: Battery-operated, energy efficiency critical

### Real-time Requirements
- **Determinism**: Predictable task execution
- **Latency**: Microsecond to millisecond response
- **Scheduling**: Priority-based, preemptive
- **Interrupts**: Low-latency handling

## 📊 RTOS Comparison

| RTOS | Memory (KB) | Architectures | License | Best For |
|------|-------------|---------------|---------|----------|
| **FreeRTOS** | 10 | 40+ | MIT | AWS IoT, general use |
| **Zephyr** | 8-50 | 400+ boards | Apache 2.0 | Modern embedded |
| **NuttX** | 20-100 | 20+ | Apache 2.0 | POSIX compliance |
| **RT-Thread** | 3 | 30+ | Apache 2.0 | Chinese IoT |

## 🚀 Recommendations

**AWS IoT integration**: FreeRTOS  
**Modern embedded**: Zephyr  
**POSIX compatibility**: NuttX  
**Edge ML**: TensorFlow Lite + Edge Impulse  
**Ultra-low power**: Custom RTOS or bare metal

---

**Last Updated**: December 2024
