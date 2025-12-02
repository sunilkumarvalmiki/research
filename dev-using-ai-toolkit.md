# Development Using AI Toolkit for Visual Studio Code

## Comprehensive Guide to Cost-Efficient AI Development with Open-Source and Paid Models

**Version:** 2.0  
**Last Updated:** December 2024  
**Author:** AI Development Guide  
**Target Audience:** Developers using M1 Pro MacBook with 16GB RAM

---

## Table of Contents

1. [Introduction to AI Toolkit](#introduction)
2. [Installation & Setup](#installation--setup)
3 [Open-Source Model Development (Free & Cost-Efficient)](#open-source-development)
4. [Paid Model Development (Cost-Optimized)](#paid-model-development)
5. [Core Features](#core-features)
6. [Use Cases & Practical Examples](#use-cases--practical-examples)
7. [Cost Optimization Strategies](#cost-optimization-strategies)
8. [Integration with Existing Workflows](#integration-workflows)
9 [Best Practices](#best-practices)
10. [Troubleshooting](#troubleshooting)

---

## Introduction

### What is AI Toolkit for Visual Studio Code?

**AI Toolkit for Visual Studio Code** (formerly Windows AI Studio) is Microsoft's comprehensive extension announced at Build 2024 that streamlines the entire generative AI application development lifecycle within VS Code. It provides an integrated environment for discovering, testing, fine-tuning, deploying, and monitoring AI models—both locally and in the cloud.

### Key Capabilities

**Development Lifecycle:**
- 🔍 **Model Catalog** - Discover 200+ models from various sources
- 🎮 **Playground** - Interactive testing environment
- 🤖 **Agent Builder** - Streamlined agent development with MCP integration
- 🧪 **Model Evaluation** - Comprehensive testing with metrics
- 📦 **Fine-Tuning** - Customize models locally or in cloud
- 🚀 **Deployment** - Deploy to Azure or run locally

**Platform Support:**
- ✅ **macOS** - M1/M2/M3 (Apple Silicon optimized)
- ✅ **Windows 11** - DirectML acceleration, CPU, NPU
- ✅ **Linux** - NVIDIA GPUs, CPU

**Model Sources:**
- Hugging Face
- Azure AI Studio
- GitHub Models
- OpenAI
- Anthropic
- Google (Gemini)
- Ollama (Local)
- ONNX Runtime

###Why Choose AI Toolkit?

**For Cost Efficiency:**
1. **Local Inference** - No per-token charges
2. **Open-Source Models** - Free, commercially viable
3. **Efficient Quantization** - Run larger models on limited hardware
4. **Side-by-Side Comparison** - Choose optimal model for cost/performance

**For Development Speed:**
1. **Integrated Environment** - Everything in VS Code
2. **Quick Experimentation** - Playground for rapid testing
3. **Code Generation** - Agent and evaluation code scaffolding
4. **Built-in Monitoring** - Tracing and debugging tools

---

## Installation & Setup

### Prerequisites

**System Requirements:**
- Visual Studio Code 1.80 or later
- For M1 Pro Mac (your hardware):
  - 16GB RAM (✅ You have this)
  - macOS 12.0 or later
  - ~10GB free disk space for models

**Recommended Before Starting:**
- [x] Ollama installed (✅ You have 7 models)
- [x] Python 3.9+ (✅ You have 3.14)
- [ ] Docker (optional, for containerized deployment)

### Installation Steps

**Method 1: Via VS Code Extensions Marketplace (Easiest)**

1. Open VS Code
2. Press `Cmd + Shift + X` (Extensions)
3. Search for "AI Toolkit"
4. Click **Install** on "AI Toolkit for Visual Studio Code"
5. **Status:** ✅ Already installed on your system!

**Method 2: Via Command Line**

```bash
code --install-extension ms-windows-ai-studio.windows-ai-studio
```

**Verify Installation:**

```bash
code --list-extensions | grep windows-ai-studio
# Should output: ms-windows-ai-studio.windows-ai-studio
```

### Initial Configuration

**Open AI Toolkit:**
1. Look for the AI Toolkit icon in the VS Code Activity Bar (left sidebar)
2. Click to open the AI Toolkit panel

**Sections You'll See:**
- **My Resources** - Your models and projects
- **Model Tools** - Catalog, Playground, Evaluation
- **Agent and Workflow Tools** - Agent Builder, Bulk Run
- **MCP Workflow** - Model Context Protocol integration
- **Help and Feedback** - Documentation and support

---

## Open-Source Development (Free & Cost-Efficient)

### Why Open-Source Models?

**Cost Benefits:**
- **$0 per request** - No API charges
- **Predictable costs** - Only electricity and hardware
- **Unlimited usage** - No rate limits or quotas
- **Data privacy** - Everything stays local

**Recommended for:**
- High-volume applications
- Sensitive data processing
- Prototyping and experimentation
- Learning and education
- Budget-constrained projects

### Best Open-Source Models for M1 Pro 16GB (2024)

**Coding Models:**

| Model | Size (GB) | Parameters | Speed | Use Case |
|-------|-----------|------------|-------|----------|
| **DeepSeek-Coder-V2** | 8.9 | 16B (lite) | 15-25 t/s | Complex coding, debugging |
| **Qwen2.5-Coder** | 4.7 | 7B | 30-50 t/s | Fast completions, snippets |
| **StarCoder2** | 4.0 | 7B | 35-45 t/s | Code completion, boilerplate |
| **CodeLlama** | 13 | 13B | 15-20 t/s | Python, general coding |

**General/Research Models:**

| Model | Size (GB) | Parameters | Speed | Use Case |
|-------|-----------|------------|-------|----------|
| **Llama 3** | 4.7 | 8B | 40-50 t/s | General queries, fastest |
| **Mistral** | 4.2 | 7B | 35-45 t/s | Strong reasoning |
| **Qwen 3** | 5.2 | 8B | 30-40 t/s | Research, multilingual |
| **Gemma 2** | 5.4 | 9B | 25-35 t/s | Efficient, balanced |

**✅ You Already Have:** deepseek-coder-v2, qwen2.5-coder, starcoder2, llama3, mistral, qwen3

### Using Open-Source Models in AI Toolkit

#### Step 1: Connect Ollama to AI Toolkit

**Configure Ollama in AI Toolkit:**

1. Open AI Toolkit panel
2. Go to **Model Catalog**
3. Filter by **"Local"** or **"Ollama"**
4. You'll see your installed Ollama models listed

**Alternative: Manual Connection**

Create a configuration file `.vscode/ai-toolkit-settings.json`:

```json
{
  "aiToolkit.models": {
    "ollama": {
      "endpoint": "http://localhost:11434",
      "models": [
        "deepseek-coder-v2:latest",
        "llama3:8b",
        "qwen2.5-coder:7b",
        "mistral:7b"
      ]
    }
  }
}
```

#### Step 2: Test Models in Playground

**Access Playground:**
1. AI Toolkit panel → **Model Tools** → **Playground**
2. Select model from dropdown (e.g., "deepseek-coder-v2")
3. Type your prompt in the chat interface

**Example Prompts:**

```
Coding Task:
"Write a Python function to calculate Fibonacci numbers using memoization"

Research Task:
"Explain the differences between REST and GraphQL APIs"

Code Review:
"Review this code and suggest improvements:
[paste code here]"
```

**Test Parameters:**
- **Temperature:** 0.1-0.3 (precise), 0.7-0.9 (creative)
- **Max Tokens:** 500-2000 (depends on response length)
- **Top P:** 0.9 (recommended default)

#### Step 3: Build AI Agents with Open-Source Models

**Agent Builder Workflow:**

1. AI Toolkit → **Agent and Workflow Tools** → **Agent Builder**
2. Click **Create New Agent**
3. Select: **Local Model** → Choose "deepseek-coder-v2"
4. Define agent purpose:

```yaml
Agent Name: Code Assistant
Model: deepseek-coder-v2
System Prompt: |
  You are an expert Python developer assistant.
  Provide clean, well-documented code following PEP 8.
  Always include error handling and type hints.
  
Tools: [Code Execution, File Operations]
```

5. AI Toolkit generates agent code using **Agent Code Gen**

**Generated Code Example:**

```python
from agents import Agent, Tool

# Auto-generated by AI Toolkit
code_assistant = Agent(
    model="ollama:deepseek-coder-v2",
    system_prompt="You are an expert Python developer...",
    tools=[
        Tool("execute_code", execute_python_code),
        Tool("read_file", read_file_content)
    ],
    temperature=0.2
)

# Use the agent
response = code_assistant.run("Create a data validation function")
print(response)
```

#### Step 4: Fine-Tune Open-Source Models (Advanced)

**When to Fine-Tune:**
- Domain-specific terminology
- Consistent response format needed
- Improve accuracy on specific tasks

**Fine-Tuning with AI Toolkit:**

1. AI Toolkit → **Model Tools** → select model → **Fine-Tune**
2. Prepare training data (JSONL format):

```jsonl
{"prompt": "Calculate tax for $1000 at 8%", "completion": "The tax on $1000 at 8% is $80. Total: $1080"}
{"prompt": "Calculate tax for $500 at 10%", "completion": "The tax on $500 at 10% is $50. Total: $550"}
```

3. Configure fine-tuning:
   - **Base Model:** llama3:8b
   - **Training Data:** Select your JSONL file
   - **Epochs:** 3-5
   - **Learning Rate:** 2e-5
   - **Batch Size:** 4 (for 16GB RAM)

4. Run fine-tuning (can take 30min-2hrs depending on data size)

**Cost for Local Fine-Tuning:** $0 (uses your hardware)

### Complete Example: Building a Code Review Agent

**Scenario:** Create an AI agent that reviews Python code for best practices

**Step-by-Step:**

```python
# 1. Create agent configuration
from ai_toolkit import Agent, OllamaModel

# 2. Initialize model
model = OllamaModel(
    name="deepseek-coder-v2",
    temperature=0.3,  # Focused responses
    max_tokens=1500
)

# 3. Define system prompt
system_prompt = """
You are a senior Python code reviewer. Analyze code for:
1. Code quality and PEP 8 compliance
2. Potential bugs and edge cases
3. Performance optimizations
4. Security vulnerabilities
5. Best practices

Provide specific, actionable feedback with examples.
"""

# 4. Create agent
code_reviewer = Agent(
    model=model,
    system_prompt=system_prompt,
    name="Python Code Reviewer"
)

# 5. Review code
code_to_review = """
def process_data(data):
    result = []
    for item in data:
        if item > 0:
            result.append(item * 2)
    return result
"""

review = code_reviewer.run(f"Review this code:\\n{code_to_review}")
print(review)
```

**Expected Output:**

```
Code Review:

1. **List Comprehension**: Use list comprehension for better readability
   
   # Improved version:
   def process_data(data):
       return [item * 2 for item in data if item > 0]

2. **Type Hints**: Add type annotations
   
   from typing import List
   def process_data(data: List[int]) -> List[int]:
       return [item * 2 for item in data if item > 0]

3. **Input Validation**: Add validation for edge cases
   
   def process_data(data: List[int]) -> List[int]:
       if not data:
           return []
       return [item * 2 for item in data if item > 0]

4. **Documentation**: Add docstring
   
   def process_data(data: List[int]) -> List[int]:
       """Process positive numbers by doubling them.
       
       Args:
           data: List of integers to process
           
       Returns:
           List of doubled positive integers
       """
       if not data:
           return []
       return [item * 2 for item in data if item > 0]

Performance: Current implementation is O(n), which is optimal.
Security: No security concerns for this function.
```

**Cost:** $0 (fully local)

---

## Paid Model Development (Cost-Optimized)

### When to Use Paid Models

**Best Use Cases:**
1. **Complex reasoning tasks** - GPT-4 level intelligence needed
2. **Multimodal inputs** - Images, audio, video processing
3. **Production applications** - Require guaranteed uptime and support
4. **Latest capabilities** - Access cutting-edge features
5. **Extremely low latency** - Cloud GPU acceleration

**Cost Comparison (approximate, December 2024):**

| Model | Provider | Input ($/1M tokens) | Output ($/1M tokens) | Best For |
|-------|----------|---------------------|----------------------|----------|
| **GPT-4o** | OpenAI | $2.50 | $10.00 | Complex reasoning |
| **GPT-4o-mini** | OpenAI | $0.15 | $0.60 | Cost-efficient GPT-4 quality |
| **Claude 3.5 Sonnet** | Anthropic | $3.00 | $15.00 | Long context, coding |
| **Claude 3 Haiku** | Anthropic | $0.25 | $1.25 | Fast, cheap, decent quality |
| **Gemini 1.5 Pro** | Google | $1.25 | $5.00 | Multimodal, 2M context |
| **Gemini 1.5 Flash** | Google | $0.075 | $0.30 | Ultra cost-efficient |

**For Cost-Efficiency:** Use Gemini 1.5 Flash or Claude Haiku for production

### Connecting Paid Models to AI Toolkit

#### Option 1: GitHub Models (Free Tier Available!)

**Free Tier Benefits:**
- 15,000 requests/month FREE
- Access to GPT-4o-mini, Phi-3, Llama 3
- No credit card required!

**Setup:**

1. Get GitHub Models API key:
   - Visit https://github.com/marketplace/models
   - Sign in with GitHub
   - Click "Get started for free"
   - Copy API key

2. Configure in AI Toolkit:
   - Open AI Toolkit → **Model Catalog**
   - Click "Add Model" → **GitHub Models**
   - Paste API key
   - Select models to use

**Free Models Available:**
- GPT-4o-mini (15K requests/month)
- Llama 3.1 (unlimited inference)
- Phi-3 (unlimited inference)

#### Option 2: Azure AI Studio

**Benefits:**
- Enterprise-grade reliability
- Pay-as-you-go pricing
- Region selection for compliance
- Integration with Azure services

**Setup:**

```bash
# Install Azure CLI
brew install azure-cli

# Login
az login

# Create AI Studio resource (in Azure portal or CLI)
az ml workspace create --name my-ai-workspace
```

**Configure in AI Toolkit:**
1. AI Toolkit → **Model Catalog** → **Azure AI Studio**
2. Sign in with Azure account
3. Select subscription and workspace
4deploy models (e.g., GPT-4o-mini)

#### Option 3: Direct API Keys (OpenAI, Anthropic, Google)

**OpenAI Setup:**

```json
// .vscode/ai-toolkit-settings.json
{
  "aiToolkit.openai": {
    "apiKey": "${env:OPENAI_API_KEY}",
    "models": ["gpt-4o-mini", "gpt-4o"]
  }
}
```

**Environment Variables:**

```bash
# Add to ~/.zshrc
export OPENAI_API_KEY="sk-..."
export ANTHROPIC_API_KEY="sk-ant-..."
export GOOGLE_API_KEY="AIza..."

# Reload
source ~/.zshrc
```

### Cost Optimization Strategies for Paid Models

#### Strategy 1: Model Cascading

**Concept:** Use cheap models first, fall back to expensive ones only if needed

```python
from ai_toolkit import Agent, Chain

# Define model hierarchy (cheap → expensive)
cheap_model = "gemini-1.5-flash"  # $0.075/1M input tokens
mid_model = "gpt-4o-mini"         # $0.15/1M input tokens
expensive_model = "gpt-4o"        # $2.50/1M input tokens

# Cascading chain
cascade = Chain([
    Agent(model=cheap_model, confidence_threshold=0.8),
    Agent(model=mid_model, confidence_threshold=0.9),
    Agent(model=expensive_model)
])

# Try cheap model first
response = cascade.run("Explain quantum computing")

# Cost: 90% of requests handled by cheapest model
```

**Savings:** 60-80% cost reduction

#### Strategy 2: Prompt Caching

**Concept:** Reuse system prompts and context to avoid reprocessing

```python
# With prompt caching (Anthropic Claude)
agent = Agent(
    model="claude-3-haiku",
    system_prompt=long_system_prompt,  # Cached automatically
    cache_ttl=3600  # 1 hour cache
)

# First request: Full cost
response1 = agent.run("Question 1")

# Subsequent requests: 90% discount on cached portion
response2 = agent.run("Question 2")  # Reuses cached system prompt
```

**Savings:** Up to 90% on repeated context

#### Strategy 3: Smart Batching

**Concept:** Batch multiple requests into single API call

```python
from ai_toolkit import BulkRun

# Instead of 100 individual API calls
questions = [f"Question {i}" for i in range(100)]

# Single batched request
results = BulkRun(
    model="gpt-4o-mini",
    prompts=questions,
    batch_size=50  # Process 50 at a time
).execute()

# Cost: 1 API call instead of 100
```

**Savings:** Reduces overhead, 20-30% cost reduction

#### Strategy 4: Output Limiting

**Concept:** Request only what you need

```python
# Expensive (1000 tokens output)
response = agent.run(
    "Explain AI",
    max_tokens=1000  # Output costs 10x more than input!
)

# Cost-efficient (200 tokens output)
response = agent.run(
    "Explain AI in 2-3 sentences",  # Guide for brevity
    max_tokens=200
)
```

**Savings:** 80% on output tokens

### Complete Example: Cost-Optimized Production App

**Scenario:** Customer support chatbot with 10,000 queries/month

**Architecture:**

```python
from ai_toolkit import Agent, ModelRouter

# 1. Define models by cost tier
tier_free = Agent(model="github:phi-3")  # Free (GitHub)
tier_cheap = Agent(model="gemini-1.5-flash")  # $0.075/1M
tier_mid = Agent(model="gpt-4o-mini")  # $0.15/1M
tier_premium = Agent(model="claude-3.5-sonnet")  # $3/1M

# 2. Create intelligent router
router = ModelRouter(
    rules=[
        # Simple FAQs → Free model
        {"patterns": ["what is", "how do i", "where"], "model": tier_free},
        
        # General questions → Cheap model
        {"complexity": "low", "model": tier_cheap},
        
        # Technical support → Mid-tier
        {"complexity": "medium", "model": tier_mid},
        
        # Escalations/complex → Premium
        {"complexity": "high", "model": tier_premium}
    ]
)

# 3. Handle request
def handle_support_query(query):
    return router.route(query)

# Usage
q1 = "What are your business hours?"  # → tier_free ($0)
q2 = "How do I reset my password?"    # → tier_cheap ($0.01)
q3 = "Database connection error"       # → tier_mid ($0.02)
q4 = "Complex integration issue"       # → tier_premium ($0.10)
```

**Cost Breakdown (10,000 queries/month):**

| Tier | Queries | Cost/Query | Total |
|------|---------|------------|-------|
| Free | 3,000 (30%) | $0 | $0 |
| Cheap | 5,000 (50%) | $0.01 | $50 |
| Mid | 1,500 (15%) | $0.02 | $30 |
| Premium | 500 (5%) | $0.10 | $50 |
| **Total** | **10,000** | | **$130/month** |

**Without Optimization:** All queries to GPT-4o = $250/month  
**Savings:** 48% ($120/month)

---

## Core Features

### 1. Model Catalog

**Purpose:** Discover and compare 200+ AI models

**How to Use:**

1. Open AI Toolkit → **Model Catalog**
2. **Filter by:**
   - **Source:** Ollama, GitHub, Azure, Hugging Face
   - **Task:** Code, Chat, Embedding, Vision
   - **Size:** Small (<5B), Medium (5-20B), Large (>20B)
   - **Hardware:** CPU, GPU, NPU

3. **Compare Side-by-Side:**
   - Select 2-4 models
   - Click "Compare"
   - View benchmarks, costs, speed

**Example Comparison:**

```
Model A: GPT-4o-mini
- Cost: $0.15/1M input
- Speed: 50ms latency
- Quality: 8.5/10
- Context: 128K tokens

Model B: Gemini 1.5 Flash
- Cost: $0.075/1M input
- Speed: 30ms latency
- Quality: 8.0/10
- Context: 1M tokens

Recommendation: Use Gemini Flash for cost, GPT-4o-mini for quality
```

### 2. Playground

**Purpose:** Interactive testing without writing code

**Features:**
- Multi-turn conversations
- Image/file uploads
- Parameter tuning (Temperature, Top P, Max Tokens)
- Response streaming
- Export conversations to code

**Advanced Usage:**

```python
# Export playground session to code
# After testing in Playground, click "Export" → "Python Code"

# Generated code:
from openai import OpenAI

client = OpenAI(api_key="...")
response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are a helpful assistant"},
        {"role": "user", "content": "Explain recursion"}
    ],
    temperature=0.7,
    max_tokens=500
)
```

### 3. Agent Builder

**Purpose:** Create production-ready AI agents with MCP tools

**MCP (Model Context Protocol) Integration:**

MCP allows agents to access:
- File systems
- Databases
- APIs
- Browser automation
- Git repositories

**Example: Research Agent with MCP:**

```python
from ai_toolkit import Agent, MCPTool

# Define MCP tools
filesystem = MCPTool("filesystem", {
    "read_permission": "~/Documents",
    "write_permission": "~/Documents/output"
})

web_search = MCPTool("browser", {
    "allowed_domains": ["arxiv.org", "scholar.google.com"]
})

# Create agent with tools
research_agent = Agent(
    model="gpt-4o-mini",
    name="Research Assistant",
    tools=[filesystem, web_search],
    system_prompt="You help gather and synthesize research papers"
)

# Use agent
result = research_agent.run(
    "Find recent papers on quantum computing and summarize"
)
```

### 4. Model Evaluation

**Purpose:** Measure model performance with datasets

**Built-in Metrics:**
- Accuracy
- Coherence
- Groundedness
- Relevance
- Safety

**Create Custom Evaluation:**

```python
from ai_toolkit import Evaluator

# Define test dataset
test_data = [
    {"input": "What is 2+2?", "expected": "4"},
    {"input": "Capital of France?", "expected": "Paris"},
    # ... 100+ examples
]

# Run evaluation
evaluator = Evaluator(
    model="llama3:8b",
    test_data=test_data,
    metrics=["accuracy", "latency", "cost"]
)

results = evaluator.run()

# Results:
# Accuracy: 95%
# Avg Latency: 120ms
# Cost/1000 queries: $0 (local model)
```

### 5. Bulk Run

**Purpose:** Test prompts across multiple models simultaneously

**Use Case:** Find best model for your specific task

```python
from ai_toolkit import BulkRun

# Test same prompt across all models
prompt = "Write a Python function to merge two sorted lists"

results = BulkRun(
    prompt=prompt,
    models=[
        "deepseek-coder-v2",
        "gpt-4o-mini",
        "claude-3-haiku",
        "gemini-1.5-flash"  
    ]
).execute()

# Compare outputs
for model, output in results.items():
    print(f"{model}:")
    print(f"  Quality: {output.quality_score}/10")
    print(f"  Time: {output.latency}ms")
    print(f"  Cost: ${output.cost}")

# Best choice: deepseek-coder-v2 (free, fast, high quality)
```

---

## Use Cases & Practical Examples

### Use Case 1: Code Documentation Generator

**Goal:** Automatically document Python codebase

```python
from ai_toolkit import Agent, Tool
import ast

# Tool to extract function signatures
def extract_functions(filepath):
    with open(filepath) as f:
        tree = ast.parse(f.read())
    return [node.name for node in ast.walk(tree) if isinstance(node, ast.FunctionDef)]

# Create documentation agent
doc_agent = Agent(
    model="qwen2.5-coder:7b",  # Fast, free
    system_prompt="Generate clear docstrings in Google style",
    tools=[Tool("extract_functions", extract_functions)]
)

# Generate docs
code = """
def calculate_average(numbers):
    total = sum(numbers)
    return total / len(numbers)
"""

docstring = doc_agent.run(f"Create docstring for:\\n{code}")

# Output:
"""
def calculate_average(numbers):
    Calculate the arithmetic mean of a list of numbers.
    
    Args:
        numbers (list[float]): A list of numeric values to average.
            Must contain at least one element.
    
    Returns:
        float: The arithmetic mean of the input numbers.
    
    Raises:
        ZeroDivisionError: If the input list is empty.
    
    Example:
        >>> calculate_average([1, 2, 3, 4, 5])
        3.0
    
    total = sum(numbers)
    return total / len(numbers)
"""
```

**Cost:** $0 (local Ollama model)

### Use Case 2: Multi-Agent Code Review System

**Goal:** Comprehensive code review from multiple perspectives

```python
from ai_toolkit import Agent, AgentTeam

# Define specialized agents
security_agent = Agent(
    model="deepseek-coder-v2",
    system_prompt="Focus on security vulnerabilities",
    name="Security Reviewer"
)

performance_agent = Agent(
    model="deepseek-coder-v2",
    system_prompt="Analyze performance and optimization opportunities",
    name="Performance Reviewer"
)

style_agent = Agent(
    model="qwen2.5-coder:7b",  # Faster for style checks
    system_prompt="Check code style, readability, and best practices",
    name="Style Reviewer"
)

# Create team
review_team = AgentTeam([
    security_agent,
    performance_agent,
    style_agent
])

# Review code
code_to_review = """
def login(username, password):
    query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
    result = db.execute(query)
    return result
"""

# Run parallel reviews
reviews = review_team.run(code_to_review)

# Combine results
for agent_name, review in reviews.items():
    print(f"\\n{agent_name}:")
    print(review)
```

**Output:**

```
Security Reviewer:
🚨 CRITICAL: SQL Injection vulnerability!
- Never concatenate user input into SQL queries
- Use parameterized queries instead

Fixed version:
query = "SELECT * FROM users WHERE username=? AND password=?"
result = db.execute(query, (username, password))

Performance Reviewer:
⚠️  Storing plaintext passwords
- Hash passwords with bcrypt before storage
- Use salting for additional security

Style Reviewer:
✅ Function name clear
❌ Missing docstring
❌ No type hints
❌ No input validation
```

**Cost:** $0 (all local models, run in parallel)

###Use Case 3: AI-Powered Test Generator

**Goal:** Generate comprehensive unit tests automatically

```python
from ai_toolkit import Agent

# Create test generation agent
test_agent = Agent(
    model="deepseek-coder-v2",
    system_prompt="""
    Generate comprehensive pytest unit tests.
    Include:
    - Happy path tests
    - Edge cases
    - Error handling
    - Parametrized tests
    Use clear test names and assertions.
    """
)

# Code to test
source_code = """
def divide(a: float, b: float) -> float:
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b
"""

# Generate tests
tests = test_agent.run(f"Generate pytest tests for:\\n{source_code}")

print(tests)
```

**Generated Tests:**

```python
import pytest
from mymodule import divide

class TestDivide:
    """Tests for the divide function."""
    
    # Happy path tests
    def test_divide_positive_numbers(self):
        """Test division of two positive numbers."""
        assert divide(10, 2) == 5.0
        assert divide(7, 2) == 3.5
    
    def test_divide_negative_numbers(self):
        """Test division with negative numbers."""
        assert divide(-10, 2) == -5.0
        assert divide(10, -2) == -5.0
        assert divide(-10, -2) == 5.0
    
    # Edge cases
    def test_divide_by_one(self):
        """Test division by one returns the number."""
        assert divide(42, 1) == 42.0
    
    def test_divide_zero_by_number(self):
        """Test zero divided by any number is zero."""
        assert divide(0, 5) == 0.0
    
    def test_divide_floats(self):
        """Test division with floating point numbers."""
        assert divide(5.5, 2.0) == 2.75
    
    # Parametrized tests
    @pytest.mark.parametrize("a,b,expected", [
        (10, 2, 5.0),
        (9, 3, 3.0),
        (7, 2, 3.5),
        (-6, 2, -3.0),
    ])
    def test_divide_parametrized(self, a, b, expected):
        """Test division with various inputs."""
        assert divide(a, b) == expected
    
    # Error handling
    def test_divide_by_zero_raises_error(self):
        """Test that dividing by zero raises ValueError."""
        with pytest.raises(ValueError, match="Cannot divide by zero"):
            divide(10, 0)
    
    def test_divide_by_zero_with_zero_dividend(self):
        """Test that even 0/0 raises ValueError."""
        with pytest.raises(ValueError, match="Cannot divide by zero"):
            divide(0, 0)
```

**Cost:** $0 (local model)  
**Time Saved:** ~15 minutes per function

---

## Cost Optimization Strategies

### Summary Table

| Strategy | Savings | Complexity | Best For |
|----------|---------|------------|----------|
| Use free GitHub Models tier | 100% (up to 15K/month) | Low | Prototyping |
| Local Ollama models | 100% | Low | High-volume, privacy |
| Model cascading | 60-80% | Medium | Production apps |
| Prompt caching | 90% on cached content | Low | Repeated contexts |
| Batch processing | 20-30% | Medium | Bulk operations |
| Output limiting | 50-80% | Low | All use cases |
| Gemini Flash instead of GPT-4 | 70% | Low | Most tasks |

### Monthly Budget Examples

**Scenario A: Solo Developer (Side Project)**
- **Budget:** $0-10/month
- **Strategy:**
  - Local Ollama for 90% of requests
  - GitHub Models free tier for complex queries
  - Total cost: $0-5/month

**Scenario B: Startup (MVP Development)**
- **Budget:** $50-100/month
- **Strategy:**
  - Local Ollama for development/testing
  - Gemini Flash for production (10K requests)
  - GPT-4o-mini for 1critical features (1K requests)
  - Total cost: $75/month

**Scenario C: Production App (10K users)**
- **Budget:** $200-500/month
- **Strategy:**
  - Model cascading (Free → Cheap → Premium)
  - Claude Haiku for 70% of requests
  - GPT-4o for 5% complex requests
  - Prompt caching enabled
  - Total cost: $350/month

---

## Integration with Existing Workflows

### Integration with GitHub Copilot

**AI Toolkit + Copilot = Supercharged Development**

```json
// .vscode/settings.json
{
  "github.copilot.enable": {
    "*": true
  },
  "aiToolkit.integration.copilot": {
    "enabled": true,
    "useLocalModelsFirst": true  // Try Ollama before cloud
  }
}
```

**Copilot uses AI Toolkit for:**
- Model recommendations
- Agent code scaffolding
- Evaluation generation

### Integration with Continue AI

**Combined Setup:**

```json
// .vscode/settings.json
{
  "continue.ollamaModel": "deepseek-coder-v2",
  "aiToolkit.defaultModel": "deepseek-coder-v2",
  "continue.useAIToolkit": true  // Share model connections
}
```

**Benefits:**
- Single model configuration
- Shared API keys
- Unified playground

### Integration with Git Workflow

**Automated Code Review on Commits:**

```yaml
# .github/workflows/ai-review.yml
name: AI Code Review

on: [pull_request]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Run AI Review
        run: |
          # Use AI Toolkit CLI for automated review
          ai-toolkit review --model gpt-4o-mini --pr ${{ github.event.pull_request.number }}
```

---

## Best Practices

### Security

1. **Never hardcode API keys**
   ```python
   # ❌ Bad
   api_key = "sk-abc123"
   
   # ✅ Good
   api_key = os.getenv("OPENAI_API_KEY")
   ```

2. **Use .env files**
   ```bash
   # .env (add to .gitignore!)
   OPENAI_API_KEY=sk-...
   ANTHROPIC_API_KEY=sk-ant-...
   ```

3. **Sanitize user inputs**
   ```python
   # Prevent prompt injection
   def sanitize_input(user_input):
       # Remove system instructions
       forbidden = ["ignore previous", "system:", "assistant:"]
       for phrase in forbidden:
           if phrase in user_input.lower():
               raise ValueError("Invalid input")
       return user_input
   ```

### Performance

1. **Use streaming for long responses**
   ```python
   response = agent.run(prompt, stream=True)
   for chunk in response:
       print(chunk, end="", flush=True)
   ```

2. **Implement caching**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_ai_response(prompt):
       return agent.run(prompt)
   ```

3. **Parallel processing for bulk**
   ```python
   import concurrent.futures
   
   with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
       results = executor.map(agent.run, prompts)
   ```

### Monitoring

1. **Track costs in real-time**
   ```python
   from ai_toolkit import CostTracker
   
   tracker = CostTracker()
   
   @tracker.monitor
   def my_ai_function():
       return agent.run("query")
   
   print(f"Cost: ${tracker.total_cost:.4f}")
   ```

2. **Log all requests**
   ```python
   import logging
   
   logging.basicConfig(
       filename='ai_requests.log',
       level=logging.INFO,
       format='%(asctime)s - Model: %(model)s - Cost: $%(cost).4f'
   )
   ```

---

## Troubleshooting

### Common Issues

**1. "Model not found" error**

```bash
# Check Ollama is running
ollama list

# Start Ollama if needed
ollama serve

# Verify AI Toolkit can see it
code --open-url "vscode://ms-windows-ai-studio.windows-ai-studio/catalog"
```

**2. "Out of memory" error**

```python
# Reduce model size
# Instead of: llama3:70b (40GB)
# Use: llama3:8b (4.7GB)

# Or reduce batch size
agent.run(prompt, batch_size=1)
```

**3. API key not working**

```bash
# Verify environment variable
echo $OPENAI_API_KEY

# Reload VS Code after setting
# Cmd+Shift+P → "Reload Window"
```

**4. Slow inference on M1 Pro**

```python
# Use quantized models (Q4, Q6 instead of FP16)
ollama pull llama3:8b-q4  # Faster than llama3:8b

# Reduce max tokens
agent.run(prompt, max_tokens=500)  # Instead of 2000
```

---

## Quick Reference Commands

```bash
# Install AI Toolkit
code --install-extension ms-windows-ai-studio.windows-ai-studio

# List installed models (Ollama)
ollama list

# Open AI Toolkit
code --command "aiToolkit.showCatalog"

# Run evaluation
ai-toolkit eval --model llama3:8b --dataset tests/data.jsonl

# Export playground session
ai-toolkit export --session playground-1 --format python
```

---

## Additional Resources

**Official Documentation:**
- AI Toolkit: https://aka.ms/ai-toolkit
- GitHub: https://github.com/microsoft/vscode-ai-toolkit

**Model Sources:**
- Ollama Library: https://ollama.ai/library
- Hugging Face: https://huggingface.co/models
- GitHub Models: https://github.com/marketplace/models

**Community:**
- Discord: https://discord.gg/vscode
- Reddit: r/vscode
- Stack Overflow: [vscode-ai-toolkit]

---

**Document Version:** 2.0  
**Last Updated:** December 2024  
**Created For:** M1 Pro MacBook Pro (16GB RAM)  
**Total Cost of Examples:** $0 (all use free/local models where possible)

---

🎉 **You're now ready to build cost-efficient AI applications with AI Toolkit for VS Code!**
