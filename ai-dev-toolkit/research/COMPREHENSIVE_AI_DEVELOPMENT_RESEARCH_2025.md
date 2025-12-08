# Comprehensive AI Development Research & Best Practices 2025

> **Last Updated**: December 3, 2025  
> **Status**: Production-Grade Research Document  
> **Scope**: Complete guide for AI agent development using paid and open-source models

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [AI Models Landscape 2025](#ai-models-landscape-2025)
3. [Development Tools & Frameworks](#development-tools--frameworks)
4. [Production-Grade Workflows](#production-grade-workflows)
5. [Prompt Engineering Best Practices](#prompt-engineering-best-practices)
6. [Evaluation & Testing Framework](#evaluation--testing-framework)
7. [Cost Optimization Strategies](#cost-optimization-strategies)
8. [MCP Integration Patterns](#mcp-integration-patterns)
9. [Security & Compliance](#security--compliance)
10. [Implementation Roadmap](#implementation-roadmap)

---

## Executive Summary

### Key Findings

Based on comprehensive research using AI Toolkit best practices and latest 2025 standards:

**1. Model Strategy**
- **GitHub Models**: Best for getting started (free tier, single API endpoint)
- **Microsoft Foundry (Azure AI)**: Production deployments with enterprise features
- **Ollama/MLX**: Privacy-focused local development (100% offline capable)

**2. Framework Choice**
- **Microsoft Agent Framework**: Recommended for production agent development
  - Multi-agent orchestration (group chat, sequential, concurrent, handoff)
  - Plugin ecosystem (OpenAPI, MCP, native functions)
  - Cross-platform (.NET and Python)
  - Currently in preview (`--pre` flag required)

**3. Cost Efficiency**
- **Free Tier**: GitHub Models + Ollama (95% of use cases)
- **Hybrid**: Local development + cloud deployment
- **Premium**: Only for complex reasoning (o1, o3, gpt-5 series)

**4. Quality Assurance**
- Azure AI Evaluation SDK for comprehensive testing
- Built-in evaluators for common metrics
- Custom evaluators for business-specific requirements
- OpenTelemetry tracing for observability

---

## AI Models Landscape 2025

### GitHub Models (Recommended for Getting Started)

**Why GitHub Models?**
- ✅ **Free to start**: No charge until hitting rate limit
- ✅ **Single endpoint**: `https://models.github.ai/inference/`
- ✅ **One API key**: GitHub Personal Access Token works for all models
- ✅ **Easy switching**: Change model without changing infrastructure

**Top Models Available (December 2025)**

| Model | Best For | Context | Cost/1M Tokens | Key Features |
|-------|----------|---------|----------------|--------------|
| **gpt-4.1** | General coding, production apps | 1M / 33K | $3.50 | Best value for production |
| **gpt-4.1-mini** | Fast iterations, development | 1M / 33K | $0.70 | 80% cheaper than gpt-4.1 |
| **o1** | Complex reasoning, architecture | 200K / 100K | $26.25 | Advanced problem solving |
| **o1-mini** | Code generation, quick tasks | 128K / 66K | $1.93 | 80% cheaper than o1 |
| **deepseek-r1-0528** | Reasoning, reduced hallucination | 128K / 4K | $2.36 | Improved function calling |
| **phi-4-reasoning** | Small reasoning tasks | 33K / 4K | $0.22 | State-of-the-art open-weight |
| **llama-3.3-70b** | Open-source, cost-effective | 128K / 4K | $0.71 | Meta's latest |
| **codestral-2501** | Code generation (80+ languages) | 256K / 4K | N/A | Optimized for code completion |

**Quick Start**
```python
# Install Agent Framework with --pre flag (required for preview)
pip install agent-framework-azure-ai --pre

# Use GitHub Models
from agent_framework.openai import OpenAIChatClient
import os

client = OpenAIChatClient(
    model="openai/gpt-4.1-mini",  # GitHub model format
    api_key=os.environ["GITHUB_TOKEN"],  # GitHub PAT
    base_url="https://models.github.ai/inference/"
)
```

### Microsoft Foundry Models (Production Deployments)

**When to Use Microsoft Foundry?**
- ✅ Enterprise-grade deployments
- ✅ Multi-agent orchestration
- ✅ Complex workflow automation
- ✅ Compliance requirements (HIPAA, SOC2, etc.)
- ✅ Custom model fine-tuning

**Setup Requirements**
1. Microsoft Foundry (formerly Azure AI Foundry) project
2. Model deployment in the project
3. Azure OpenAI endpoint (NOT Foundry project endpoint)

**Latest Models (2025)**

| Model | Publisher | Best Use Case | Input/Output | Cost/1M |
|-------|-----------|---------------|--------------|---------|
| **gpt-5.1** | OpenAI | Logic-heavy multi-step tasks | 200K/100K | N/A |
| **gpt-5.1-codex** | OpenAI | Advanced coding with multimodal | 272K/128K | N/A |
| **gpt-5-chat** | OpenAI | Enterprise conversations | 200K/100K | $3.69 |
| **grok-4** | xAI | Advanced reasoning + tools | 256K/8K | $6.00 |
| **gpt-5-pro** | OpenAI | Deep reasoning tasks | 400K/2.72M | $41.25 |
| **o3** | OpenAI | Improved quality & safety | 200K/100K | $3.50 |
| **deepseek-v3.1** | DeepSeek | Hybrid thinking modes | 128K/4K | $0.84 |

### Open-Source Local Models (Ollama + MLX)

**Why Local Models?**
- ✅ **100% private**: No data leaves your machine
- ✅ **Zero cost**: No API fees
- ✅ **Offline capable**: Works without internet
- ✅ **Fast iteration**: No network latency

**Recommended Setup for M1 Pro 16GB**

```bash
# Current optimized models (38GB total)
deepseek-coder-v2:latest    # 8.9GB - Best for complex coding
qwen2.5-coder:7b           # 4.7GB - Fast completions
starcoder2:7b              # 4.0GB - Code completion
llama3:8b                  # 4.7GB - General purpose
mistral:7b                 # 4.2GB - Reasoning
qwen3:8b                   # 5.2GB - Research
deepseek-r1:8b             # 5.2GB - Advanced reasoning
```

**Performance Benchmarks (M1 Pro)**

| Model | Tokens/sec | RAM Usage | Best For |
|-------|------------|-----------|----------|
| qwen2.5-coder:7b | 30-50 | 6GB | Autocomplete |
| deepseek-coder-v2 | 15-25 | 10GB | Complex coding |
| llama3:8b | 40-50 | 6GB | Chat |
| deepseek-r1:8b | 20-30 | 8GB | Reasoning |

**MLX Framework (Apple Silicon Optimized)**

```bash
# Install MLX
pip install mlx-lm

# Run optimized models
mlx_lm.generate \
    --model mlx-community/DeepSeek-Coder-V2-Lite-Instruct-4bit \
    --prompt "Your coding question"
```

**Benefits of MLX**
- Native Apple Silicon optimization
- Lower memory usage (4-bit quantization)
- Faster inference than Ollama for some models
- Direct PyTorch integration

---

## Development Tools & Frameworks

### Microsoft Agent Framework ⭐ (RECOMMENDED)

**Why Agent Framework?**
- Official Microsoft framework for production agents
- Multi-agent orchestration patterns built-in
- MCP (Model Context Protocol) native support
- Cross-platform (Python + .NET)
- Active development and enterprise support

**Installation**

```bash
# Python (REQUIRED: --pre flag for preview)
pip install agent-framework-azure-ai --pre

# .NET (REQUIRED: --prerelease flag)
dotnet add package Microsoft.Agents.AI.AzureAI --prerelease
dotnet add package Microsoft.Agents.AI.OpenAI --prerelease
dotnet add package Microsoft.Agents.AI.Workflows --prerelease

# Or use wildcard for latest
dotnet add package Microsoft.Agents.AI.AzureAI --version *-*
```

**Key Capabilities**

```python
from agent_framework.openai import OpenAIChatClient
from agent_framework import Agent

# 1. Single Agent
agent = Agent(
    model=OpenAIChatClient(model="gpt-4.1-mini"),
    instructions="You are a coding assistant",
    tools=[search_tool, file_tool]
)

# 2. Multi-Agent Orchestration
from agent_framework.workflows import GroupChat

group_chat = GroupChat(
    agents=[researcher, writer, reviewer],
    orchestration="sequential"  # or "concurrent", "handoff"
)

# 3. MCP Integration (Native)
from agent_framework.mcp import MCPTool

mcp_tool = MCPTool(
    server_path="./custom_server.py",
    transport="stdio"
)
agent.add_tool(mcp_tool)
```

### Alternative Frameworks

**LangChain** (Established, Large Ecosystem)
```python
pip install langchain langchain-openai

from langchain.agents import create_openai_functions_agent
from langchain_openai import ChatOpenAI
```

**CrewAI** (Multi-Agent Focused)
```python
pip install crewai crewai-tools

from crewai import Agent, Task, Crew
```

**AutoGen** (Microsoft Research)
```python
pip install pyautogen

from autogen import AssistantAgent, UserProxyAgent
```

### IDE & Development Environment

**VSCode Extensions (Essential)**

```json
{
  "recommendations": [
    "ms-python.python",                    // Python support
    "ms-toolsai.jupyter",                  // Jupyter notebooks
    "github.copilot",                      // GitHub Copilot
    "github.copilot-chat",                 // Copilot Chat
    "continue.continue",                   // Continue.dev
    "ms-vscode.remote-containers",         // Docker containers
    "mcp.vscode-mcp",                      // MCP support
    "ms-ai-toolkit.microsoft-ai-toolkit",  // AI Toolkit
    "dbaeumer.vscode-eslint",              // Linting
    "esbenp.prettier-vscode",              // Formatting
    "eamodio.gitlens"                      // Git integration
  ]
}
```

**Continue.dev Configuration (Free + Paid Hybrid)**

```yaml
# ~/.continue/config.yaml
models:
  # FREE: Local models (95% of usage)
  - title: DeepSeek Coder (Local)
    provider: ollama
    model: deepseek-coder-v2
    
  # FREE: Cloud fallback (4% of usage)
  - title: GitHub GPT-4.1-mini
    provider: openai
    model: gpt-4.1-mini
    apiKey: ${GITHUB_TOKEN}
    baseUrl: https://models.github.ai/inference/
    
  # PAID: Premium only when needed (1% of usage)
  - title: OpenAI o1 (Premium)
    provider: openai
    model: o1
    apiKey: ${OPENAI_API_KEY}

defaultModel: DeepSeek Coder (Local)

tabAutocompleteModel:
  provider: ollama
  model: qwen2.5-coder:7b  # Fast autocomplete
```

---

## Production-Grade Workflows

### Complete Development Lifecycle

```
┌─────────────────────────────────────────────────────────┐
│              PHASE 1: PLANNING & DESIGN                  │
├─────────────────────────────────────────────────────────┤
│ • Requirements Gathering (PRD Generation)               │
│ • Architecture Design (System Design Prompts)          │
│ • Risk Assessment (Security & Compliance)              │
│ • Resource Planning (Cost Estimation)                  │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│              PHASE 2: DEVELOPMENT                       │
├─────────────────────────────────────────────────────────┤
│ Local Development:                                      │
│ • Ollama models for rapid iteration                    │
│ • Continue.dev for AI-assisted coding                  │
│ • Git workflow (dev → test → main)                     │
│                                                         │
│ Cloud Development:                                      │
│ • GitHub Models for testing                            │
│ • Agent Framework for orchestration                    │
│ • MCP for tool integration                             │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│         PHASE 3: TESTING & EVALUATION                   │
├─────────────────────────────────────────────────────────┤
│ • Azure AI Evaluation SDK                              │
│ • Built-in evaluators (task adherence, tool accuracy)  │
│ • Custom evaluators (business metrics)                 │
│ • OpenTelemetry tracing                                │
│ • Performance benchmarking                             │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│            PHASE 4: DEPLOYMENT                          │
├─────────────────────────────────────────────────────────┤
│ Staging:                                               │
│ • Microsoft Foundry deployment                         │
│ • Integration testing                                  │
│ • Load testing                                         │
│                                                         │
│ Production:                                            │
│ • Blue/green deployment                                │
│ • Monitoring & alerting                                │
│ • Continuous evaluation                                │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│         PHASE 5: MONITORING & ITERATION                 │
├─────────────────────────────────────────────────────────┤
│ • User feedback collection                             │
│ • Performance metrics                                  │
│ • Cost analysis                                        │
│ • Model drift detection                                │
│ • Continuous improvement                               │
└─────────────────────────────────────────────────────────┘
```

### Git Protection Strategy

**Three-Branch System** (Already implemented in your project)

```
main (production)
  ↑
  merge after testing
  |
test (daily integration)
  ↑
  daily push
  |
dev (AI-assisted development)
```

**Automated Scripts**
- `daily-sync.sh`: Push dev → test daily
- `daily-check.sh`: Run tests and validations
- `quick-rollback.sh`: Emergency rollback
- `check-protection.sh`: Verify protection status

---

## Prompt Engineering Best Practices

### PRD (Product Requirements Document) Generation

**Updated 2025 Template with AI-Specific Requirements**

```markdown
# Role & Objective
You are an expert product team consisting of:
- Product Manager (strategy, requirements)
- Tech Lead (architecture, feasibility)
- AI/ML Engineer (model selection, evaluation)
- QA Engineer (testing, quality assurance)
- DevOps Engineer (deployment, monitoring)
- Security Engineer (compliance, safety)

Generate a production-grade PRD for an AI-powered product.

**Project Context**:
{{PROJECT_CONTEXT}}

---

## PRD Structure (AI-Enhanced)

### 1. Executive Summary
- Product vision and value proposition
- Target users and use cases
- Success criteria and KPIs

### 2. AI-Specific Requirements

#### 2.1 Model Selection
- **Task Type**: Classification / Generation / Reasoning / Multimodal
- **Model Candidates**: [List with justification]
  - Option 1: {{model_name}} - {{rationale}}
  - Option 2: {{model_name}} - {{rationale}}
- **Hosting Strategy**: GitHub Models / Foundry / Local / Hybrid
- **Cost Constraints**: Budget per request / monthly cap
- **Latency Requirements**: p50 / p95 / p99 targets

#### 2.2 Prompt Engineering
- **System Prompt**: {{template}}
- **Few-Shot Examples**: {{examples}}
- **Temperature/Top-p**: {{values}} (with rationale)
- **Max Tokens**: {{value}}
- **Safety Guardrails**: {{constraints}}

#### 2.3 Evaluation Metrics
- **Accuracy Metrics**: 
  - Task Adherence (target: X%)
  - Intent Resolution (target: Y%)
  - Tool Call Accuracy (target: Z%)
- **Quality Metrics**:
  - Coherence (target: X/5)
  - Fluency (target: Y/5)
  - Relevance (target: Z/5)
- **Safety Metrics**:
  - Hallucination rate (max: X%)
  - Harmful content (max: Y%)
  - PII leakage (max: 0%)
- **Performance Metrics**:
  - Latency p95 (< X ms)
  - Throughput (> Y req/sec)
  - Cost per request (< $X)

#### 2.4 Dataset Requirements
- **Training Data**: {{size}}, {{format}}, {{source}}
- **Evaluation Data**: {{size}}, split ratios
- **Test Scenarios**: Edge cases, adversarial inputs
- **Data Privacy**: PII handling, retention policies

#### 2.5 Agent Architecture (if applicable)
- **Agent Type**: Single / Multi-agent / Workflow
- **Tools/Functions**: [List with descriptions]
- **Orchestration**: Sequential / Concurrent / Handoff
- **Human-in-Loop**: Where and why

### 3. Traditional Requirements
[All standard PRD sections from your existing template]
- Functional requirements
- Non-functional requirements (performance, security, etc.)
- API specifications
- Data model
- UX/UI requirements
- Release plan
- Risk mitigation

### 4. AI Safety & Compliance
- **Content Filtering**: Categories and thresholds
- **Bias Mitigation**: Strategies and monitoring
- **Explainability**: How decisions are explained
- **Audit Trail**: What is logged and retained
- **Compliance**: GDPR, CCPA, HIPAA (if applicable)
- **Incident Response**: How to handle AI failures

### 5. Monitoring & Observability
- **Tracing**: OpenTelemetry configuration
- **Metrics**: Custom business metrics
- **Dashboards**: Key visualizations
- **Alerts**: Thresholds and actions
- **A/B Testing**: Experimentation framework

### 6. Cost Management
- **Budget**: Monthly/annual AI costs
- **Optimization**: Caching, batching, model selection
- **Scaling**: Cost projections at scale
- **Fallbacks**: Cheaper alternatives for simple queries

---

## Validation Checklist
- [ ] All AI-specific requirements clearly defined
- [ ] Evaluation metrics measurable and actionable
- [ ] Safety guardrails comprehensive
- [ ] Cost projections realistic
- [ ] Compliance requirements addressed
- [ ] Monitoring strategy complete
```

### Agent Creation Prompts (2025 Updates)

**Advanced Code Quality Agent**

```markdown
# Role: AI-Powered Code Quality & Security Guardian

**Objective**: Perform comprehensive code analysis using both static analysis and AI reasoning.

**Responsibilities**:
1. **Static Analysis**:
   - Security vulnerabilities (OWASP Top 10)
   - Performance bottlenecks (O(n²) complexity, memory leaks)
   - Code smells and anti-patterns
   - Dependencies with known CVEs

2. **AI-Assisted Analysis**:
   - Business logic validation
   - Edge case identification
   - API design review
   - Documentation completeness

3. **AI-Specific Code Review**:
   - Prompt injection vulnerabilities
   - Proper error handling for AI failures
   - Token usage optimization
   - Caching strategy validation

**Tools Available**:
- MCP filesystem for code access
- MCP git for history analysis
- Static analyzers (pylint, eslint, etc.)
- Security scanners (bandit, snyk)

**Output Format**:
```json
{
  "severity": "critical|major|minor",
  "category": "security|performance|quality|ai-safety",
  "issue": "Description",
  "location": "file:line",
  "recommendation": "Specific fix",
  "code_snippet": "Fixed code"
}
```

**Workflow**:
1. Read codebase via MCP filesystem
2. Run static analyzers
3. Perform AI-powered reasoning
4. Generate prioritized report
5. Provide actionable fixes
```

**Evaluation Specialist Agent**

```markdown
# Role: AI Evaluation Engineer

**Objective**: Design and implement comprehensive evaluation strategies for AI applications.

**Responsibilities**:
1. **Evaluation Planning**:
   - Identify appropriate metrics for the use case
   - Design test datasets (positive, negative, edge cases)
   - Select evaluators (built-in vs custom)
   - Define success criteria

2. **Implementation**:
   - Configure Azure AI Evaluation SDK
   - Create custom evaluators as needed
   - Set up continuous evaluation pipeline
   - Implement A/B testing framework

3. **Analysis**:
   - Interpret evaluation results
   - Identify failure patterns
   - Recommend improvements
   - Track metrics over time

**Tools**:
- Azure AI Evaluation SDK
- OpenTelemetry for tracing
- Custom metrics dashboard
- Dataset versioning

**Output**:
- Evaluation plan document
- Code for evaluators
- Test datasets (JSONL format)
- Results analysis report
```

---

## Evaluation & Testing Framework

### Azure AI Evaluation SDK (Production Standard)

**Why Azure AI Evaluation?**
- ✅ Comprehensive built-in evaluators
- ✅ Support for custom evaluators (code-based and prompt-based)
- ✅ Unified `evaluate()` API
- ✅ Automatic metric aggregation
- ✅ Integration with Agent Framework

**Installation**

```bash
pip install azure-ai-evaluation
```

### Built-in Evaluators (2025)

**Agent Evaluators**

| Evaluator | Type | Purpose | Required Columns |
|-----------|------|---------|------------------|
| TaskAdherenceEvaluator | Prompt-based | Assess task following | query, response |
| IntentResolutionEvaluator | Prompt-based | Verify intent resolution | query, response |
| ToolCallAccuracyEvaluator | Prompt-based | Validate tool usage | query, tool_definitions |

**General Purpose Evaluators**

| Evaluator | Type | Purpose | Required Columns |
|-----------|------|---------|------------------|
| CoherenceEvaluator | Prompt-based | Text naturalness | query, response |
| FluencyEvaluator | Prompt-based | Grammar & syntax | response |

**Similarity Evaluators**

| Evaluator | Type | Purpose | Required Columns |
|-----------|------|---------|------------------|
| SimilarityEvaluator | Code-based | Semantic similarity | query, response, ground_truth |
| F1ScoreEvaluator | Code-based | Token overlap | response, ground_truth |
| RougeScoreEvaluator | Code-based | N-gram overlap | response, ground_truth |

**RAG Evaluators**

| Evaluator | Type | Purpose | Required Columns |
|-----------|------|---------|------------------|
| RetrievalEvaluator | Prompt-based | Retrieval quality | query, context |
| GroundednessEvaluator | Prompt-based | Factual grounding | response, context |
| RelevanceEvaluator | Prompt-based | Response relevance | query, response |

### Complete Evaluation Example

```python
from azure.ai.evaluation import (
    evaluate,
    TaskAdherenceEvaluator,
    ToolCallAccuracyEvaluator,
    AzureOpenAIModelConfiguration
)
import os

# 1. Configure model for prompt-based evaluators
model_config = AzureOpenAIModelConfiguration(
    azure_deployment="gpt-4",
    azure_endpoint=os.environ["AZURE_OPENAI_ENDPOINT"],
    api_key=os.environ["AZURE_OPENAI_API_KEY"],
    api_version="2025-04-01-preview"
)

# 2. Create custom code-based evaluator
class ResponseLengthEvaluator:
    """Measure response length in tokens (custom business metric)"""
    def __init__(self):
        pass
    
    def __call__(self, *, response: str, **kwargs):
        # Simple token estimation
        token_count = len(response.split())
        return {
            "response_length": token_count,
            "within_limit": token_count <= 500  # business constraint
        }

# 3. Create custom prompt-based evaluator
from promptflow.client import load_flow
import json

class BrandConsistencyEvaluator:
    """Evaluate brand voice consistency (custom subjective metric)"""
    def __init__(self, model_config):
        # Load prompty file with evaluation logic
        self._flow = load_flow(
            source="brand_consistency.prompty",
            model={"configuration": model_config}
        )
    
    def __call__(self, *, response: str, **kwargs):
        result = self._flow(response=response)
        try:
            return json.loads(result)
        except:
            return result

# 4. Initialize evaluators
task_adherence = TaskAdherenceEvaluator(model_config=model_config)
tool_accuracy = ToolCallAccuracyEvaluator(model_config=model_config)
response_length = ResponseLengthEvaluator()
brand_consistency = BrandConsistencyEvaluator(model_config)

# 5. Run unified evaluation
result = evaluate(
    data="test_data.jsonl",  # MUST be JSONL format
    evaluators={
        "task_adherence": task_adherence,
        "tool_accuracy": tool_accuracy,
        "response_length": response_length,
        "brand_consistency": brand_consistency
    },
    evaluator_config={
        "task_adherence": {
            "column_mapping": {
                "query": "${data.query}",
                "response": "${data.response}"
            }
        },
        "tool_accuracy": {
            "column_mapping": {
                "query": "${data.query}",
                "tool_definitions": "${data.tools}",
                "tool_calls": "${data.tool_calls}"
            }
        },
        "response_length": {
            "column_mapping": {
                "response": "${data.response}"
            }
        },
        "brand_consistency": {
            "column_mapping": {
                "response": "${data.response}"
            }
        }
    },
    output_path="./evaluation_results"  # Save results
)

# 6. Analyze results
print("Aggregate Metrics:")
print(result["metrics"])  # Automatically aggregated by evaluate()

print("\nRow-level Results:")
print(result["rows"])  # Individual evaluations
```

**Test Data Format (JSONL)**

```jsonl
{"query": "What's the weather?", "response": "The weather is sunny.", "tools": [{"name": "get_weather", "description": "Get weather info"}], "tool_calls": [{"type": "tool_call", "name": "get_weather"}]}
{"query": "Book a flight", "response": "Flight booked to NYC.", "tools": [{"name": "book_flight", "description": "Book flights"}], "tool_calls": [{"type": "tool_call", "name": "book_flight"}]}
```

**⚠️ Critical Notes**:
- Data MUST be in JSONL format (not JSON array)
- Do NOT include timestamps (causes SDK errors)
- Use `evaluate()` API (don't manually iterate)
- Automatic aggregation (no custom logic needed)
- For Azure OpenAI: use Azure OpenAI endpoint, NOT Foundry project endpoint

### OpenTelemetry Tracing

**Agent Framework Integration**

```python
from agent_framework.observability import setup_observability

# Set up at app startup (BEFORE creating agents)
setup_observability(
    otlp_endpoint="http://localhost:4317",  # AI Toolkit gRPC endpoint
    enable_sensitive_data=True  # Capture prompts/completions
)

# Now create and use agents normally
# Tracing is automatic!
```

**Benefits**:
- Automatic span creation for all operations
- Visualization in AI Toolkit
- Performance bottleneck identification
- Multi-agent workflow visualization
- Error tracking and debugging

---

## Cost Optimization Strategies

### Hybrid Model Strategy (Recommended)

```yaml
Usage Distribution:
  Local (Ollama): 70% of requests
    - Development & testing
    - Simple queries
    - Autocomplete
    Cost: $0/month
  
  GitHub Models (Free Tier): 25% of requests
    - Production API testing
    - Complex queries
    - Fallback for local
    Cost: $0/month (within limits)
  
  Premium (OpenAI o1/o3): 5% of requests
    - Complex reasoning only
    - Critical decisions
    - Architecture design
    Cost: ~$50-100/month

Total Monthly Cost: $50-100 (95% savings vs all-premium)
```

### Model Selection Decision Tree

```
Is the task complex reasoning or novel problem?
├─ YES → Use premium (o1, o3, gpt-5-pro)
└─ NO → Continue
        │
        Is low latency critical?
        ├─ YES → Use local (Ollama)
        └─ NO → Continue
                │
                Is this production traffic?
                ├─ YES → Use GitHub Models (free tier) or Foundry
                └─ NO → Use local (Ollama)
```

### Caching Strategy

```python
from functools import lru_cache
import hashlib

class CachedAgent:
    def __init__(self, model):
        self.model = model
        self.cache = {}
    
    def query(self, prompt, temperature=0.3):
        # Only cache deterministic queries (low temperature)
        if temperature < 0.5:
            cache_key = hashlib.md5(prompt.encode()).hexdigest()
            if cache_key in self.cache:
                return self.cache[cache_key]
        
        result = self.model.complete(prompt)
        
        if temperature < 0.5:
            self.cache[cache_key] = result
        
        return result

# Savings: 30-50% on repeated queries
```

### Batch Processing

```python
# Instead of real-time for all requests
queries = [...]  # Collect queries

# Batch process during off-peak hours
results = batch_process(
    queries,
    model="gpt-4.1-mini",  # Cheaper model for batch
    max_concurrency=5
)

# Savings: 50% using cheaper model for non-urgent queries
```

---

## MCP Integration Patterns

### Native MCP in Agent Framework

```python
from agent_framework.mcp import MCPTool
from agent_framework import Agent

# 1. Filesystem MCP
filesystem_tool = MCPTool(
    name="filesystem",
    server_path="mcp-server-filesystem",
    transport="stdio",
    env={"ROOT_PATH": "/Users/sunilkumar/workspace/research"}
)

# 2. Git MCP
git_tool = MCPTool(
    name="git",
    server_path="mcp-server-git",
    transport="stdio",
    env={"REPO_PATH": "/Users/sunilkumar/workspace/research"}
)

# 3. Custom MCP (Python)
custom_tool = MCPTool(
    name="custom",
    server_path="./my_mcp_server.py",
    transport="stdio"
)

# Add to agent
agent = Agent(
    model=client,
    tools=[filesystem_tool, git_tool, custom_tool]
)
```

### Building Custom MCP Servers

**Simple Python MCP Server**

```python
#!/usr/bin/env python3
"""
Custom MCP Server Example
Provides tools for code analysis
"""

from mcp.server import Server, StdioServerTransport
from mcp.types import Tool, TextContent
import ast
import json

server = Server("code-analyzer")

@server.tool()
async def analyze_complexity(code: str) -> str:
    """Analyze code complexity"""
    try:
        tree = ast.parse(code)
        complexity = sum(1 for _ in ast.walk(tree) if isinstance(_, ast.FunctionDef))
        return json.dumps({
            "functions": complexity,
            "lines": len(code.split("\n")),
            "complexity_score": complexity / max(len(code.split("\n")), 1)
        })
    except Exception as e:
        return json.dumps({"error": str(e)})

@server.tool()
async def find_security_issues(code: str) -> str:
    """Find potential security issues"""
    issues = []
    
    # Simple pattern matching (extend with real security scanner)
    if "eval(" in code:
        issues.append("Dangerous eval() usage detected")
    if "exec(" in code:
        issues.append("Dangerous exec() usage detected")
    if "os.system(" in code:
        issues.append("Potentially unsafe system command")
    
    return json.dumps({"issues": issues, "count": len(issues)})

if __name__ == "__main__":
    import asyncio
    asyncio.run(server.run(StdioServerTransport()))
```

### MCP Best Practices

1. **Security**
   - Validate all inputs
   - Sandbox file access
   - Require approval for destructive operations
   - Log all tool usage

2. **Performance**
   - Cache expensive operations
   - Limit output size to context window
   - Use async operations where possible
   - Timeout long-running operations

3. **Reliability**
   - Handle errors gracefully
   - Provide clear error messages
   - Implement retries for transient failures
   - Monitor tool usage and failures

---

## Security & Compliance

### AI-Specific Security Considerations

**1. Prompt Injection Prevention**

```python
class SecurePromptHandler:
    def __init__(self):
        self.blocked_patterns = [
            r"ignore previous instructions",
            r"disregard.*rules",
            r"you are now",
            r"new instructions:",
        ]
    
    def validate_input(self, user_input: str) -> bool:
        """Check for prompt injection attempts"""
        import re
        for pattern in self.blocked_patterns:
            if re.search(pattern, user_input, re.IGNORECASE):
                return False
        return True
    
    def sanitize(self, user_input: str) -> str:
        """Sanitize user input before sending to LLM"""
        # Remove/escape special tokens
        sanitized = user_input.replace("<|", "").replace("|>", "")
        return sanitized
```

**2. PII Detection & Redaction**

```python
from presidio_analyzer import AnalyzerEngine
from presidio_anonymizer import AnonymizerEngine

class PIIProtection:
    def __init__(self):
        self.analyzer = AnalyzerEngine()
        self.anonymizer = AnonymizerEngine()
    
    def redact_pii(self, text: str) -> tuple[str, list]:
        """Redact PII from text"""
        results = self.analyzer.analyze(
            text=text,
            language="en",
            entities=["PERSON", "EMAIL", "PHONE_NUMBER", "CREDIT_CARD"]
        )
        
        anonymized = self.anonymizer.anonymize(
            text=text,
            analyzer_results=results
        )
        
        return anonymized.text, results
```

**3. Content Safety Filters**

```python
from azure.ai.contentsafety import ContentSafetyClient

class ContentSafety:
    def __init__(self):
        self.client = ContentSafetyClient(
            endpoint=os.environ["CONTENT_SAFETY_ENDPOINT"],
            credential=os.environ["CONTENT_SAFETY_KEY"]
        )
    
    def check_content(self, text: str) -> dict:
        """Check for harmful content"""
        result = self.client.analyze_text(text)
        return {
            "hate": result.hate_result.severity,
            "violence": result.violence_result.severity,
            "self_harm": result.self_harm_result.severity,
            "sexual": result.sexual_result.severity
        }
```

### Compliance Framework

**GDPR Compliance Checklist**

- [ ] Data minimization: Only collect necessary data
- [ ] User consent: Explicit opt-in for AI processing
- [ ] Right to deletion: Ability to delete user data
- [ ] Data portability: Export user data
- [ ] Processing records: Log all AI operations
- [ ] Privacy by design: Default to privacy-preserving
- [ ] Data retention: Auto-delete after retention period
- [ ] International transfers: Comply with data locality

**HIPAA Compliance (if applicable)**

- [ ] Use Microsoft Foundry with BAA
- [ ] Encrypt data at rest and in transit
- [ ] Access controls and audit logs
- [ ] No PHI in prompts without redaction
- [ ] Secure model endpoints
- [ ] Regular security assessments

---

## Implementation Roadmap

### Phase 1: Foundation (Week 1-2)

**Objectives**:
- ✅ Set up development environment
- ✅ Configure model access (GitHub Models + Ollama)
- ✅ Install Agent Framework and tools
- ✅ Set up Git protection system

**Tasks**:
```bash
# 1. Install Agent Framework
pip install agent-framework-azure-ai --pre

# 2. Set up GitHub Models access
export GITHUB_TOKEN="your_github_pat"

# 3. Verify Ollama models
ollama list

# 4. Configure Continue.dev
# Edit ~/.continue/config.yaml (hybrid setup)

# 5. Test AI Toolkit
code --install-extension ms-ai-toolkit.microsoft-ai-toolkit
```

**Deliverables**:
- Working development environment
- Access to all model providers
- Git protection active
- Documentation of setup

### Phase 2: Agent Development (Week 3-4)

**Objectives**:
- Create first production agent
- Implement MCP tool integration
- Set up tracing and monitoring

**Tasks**:
```python
# 1. Create simple agent
from agent_framework.openai import OpenAIChatClient
from agent_framework import Agent

client = OpenAIChatClient(
    model="openai/gpt-4.1-mini",
    api_key=os.environ["GITHUB_TOKEN"],
    base_url="https://models.github.ai/inference/"
)

agent = Agent(
    model=client,
    instructions="You are a helpful coding assistant"
)

# 2. Add tracing
from agent_framework.observability import setup_observability
setup_observability(otlp_endpoint="http://localhost:4317")

# 3. Test agent
response = agent.run("Help me write a Python function")
```

**Deliverables**:
- Working agent with basic functionality
- MCP tools integrated
- Tracing visualization working

### Phase 3: Evaluation Framework (Week 5-6)

**Objectives**:
- Set up Azure AI Evaluation SDK
- Create test datasets
- Implement custom evaluators
- Run baseline evaluation

**Tasks**:
```python
# 1. Install evaluation SDK
pip install azure-ai-evaluation

# 2. Create test dataset (JSONL)
test_data = [
    {"query": "...", "response": "...", "ground_truth": "..."},
    # ... more test cases
]

# 3. Run evaluation
from azure.ai.evaluation import evaluate, TaskAdherenceEvaluator

result = evaluate(
    data="test_data.jsonl",
    evaluators={"task_adherence": TaskAdherenceEvaluator(model_config)},
    output_path="./eval_results"
)
```

**Deliverables**:
- Comprehensive test dataset
- Evaluation pipeline
- Baseline metrics documented

### Phase 4: Production Deployment (Week 7-8)

**Objectives**:
- Deploy to Microsoft Foundry
- Set up monitoring and alerts
- Implement cost tracking
- Launch to limited users

**Tasks**:
1. Deploy model to Microsoft Foundry
2. Configure production endpoints
3. Set up Application Insights
4. Implement rate limiting
5. Create incident response plan

**Deliverables**:
- Production deployment
- Monitoring dashboards
- Runbook documentation
- Post-launch review

### Phase 5: Optimization & Scale (Week 9-12)

**Objectives**:
- Optimize costs (caching, model selection)
- Improve performance (latency, throughput)
- Scale to more users
- Iterate based on feedback

**Tasks**:
1. Implement caching strategy
2. A/B test model variants
3. Optimize prompts based on evaluations
4. Scale infrastructure
5. Regular evaluation runs

**Deliverables**:
- Cost reduction (target: 50%)
- Performance improvements documented
- User feedback incorporated
- Iteration plan for Q1 2026

---

## Appendix

### Quick Reference Commands

```bash
# Ollama
ollama list                          # List installed models
ollama run deepseek-coder-v2        # Run model
ollama pull llama3:8b               # Download model

# Python Environment
pip install agent-framework-azure-ai --pre  # Agent Framework
pip install azure-ai-evaluation             # Evaluation SDK
pip install langchain chromadb              # Optional frameworks

# Git Protection
./scripts/daily-sync.sh             # Sync dev → test
./scripts/daily-check.sh            # Run tests
./scripts/quick-rollback.sh         # Emergency rollback

# Docker
docker-compose up -d chromadb       # Start vector DB
docker-compose up -d weaviate       # Alternative vector DB
docker-compose logs -f              # View logs

# VSCode
code --install-extension <ext-id>   # Install extension
code --list-extensions              # List installed
```

### Resource Links

**Official Documentation**
- [Microsoft Agent Framework](https://github.com/microsoft/agent-framework)
- [Azure AI Evaluation SDK](https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/ai/azure-ai-evaluation)
- [GitHub Models](https://github.com/marketplace/models)
- [Microsoft Foundry](https://ai.azure.com)
- [Model Context Protocol](https://modelcontextprotocol.io)

**Community Resources**
- [Ollama Models](https://ollama.ai/library)
- [Hugging Face](https://huggingface.co/models)
- [LangChain Docs](https://python.langchain.com)
- [OpenTelemetry](https://opentelemetry.io)

**Your Project**
- Repository: https://github.com/sunilkumarvalmiki/research
- Branches: main (prod) → test → dev

---

**Document Version**: 1.0  
**Last Updated**: December 3, 2025  
**Author**: AI Development Research Team  
**Status**: Production-Ready ✅
