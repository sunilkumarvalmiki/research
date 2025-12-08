# AI Agent Evaluation Framework (2025 Best Practices)

## Overview

Comprehensive guide for evaluating AI agents using Azure AI Evaluation SDK with production-grade practices.

---

## Table of Contents

1. [Evaluation Philosophy](#evaluation-philosophy)
2. [Azure AI Evaluation SDK](#azure-ai-evaluation-sdk)
3. [Built-in Evaluators Reference](#built-in-evaluators-reference)
4. [Custom Evaluators](#custom-evaluators)
5. [Test Dataset Creation](#test-dataset-creation)
6. [Continuous Evaluation](#continuous-evaluation)
7. [Metrics Interpretation](#metrics-interpretation)
8. [Best Practices](#best-practices)

---

## Evaluation Philosophy

### Why Evaluate?

**Production AI systems must be measured, not guessed.**

- ✅ **Quantify quality**: Move from "feels good" to "95% task adherence"
- ✅ **Catch regressions**: Detect when changes break existing functionality
- ✅ **Compare models**: Data-driven model selection decisions
- ✅ **Track improvements**: Measure progress over time
- ✅ **Build confidence**: Ship with evidence, not hope

### Evaluation Pyramid

```
                    ┌─────────────────┐
                    │  Business KPIs  │  ← Revenue, engagement, retention
                    │  (Production)   │
                    └─────────────────┘
                           ↑
                    ┌─────────────────┐
                    │ Agent Metrics   │  ← Task adherence, tool accuracy
                    │ (Pre-launch)    │
                    └─────────────────┘
                           ↑
                    ┌─────────────────┐
                    │ Model Metrics   │  ← Coherence, fluency, relevance
                    │ (Development)   │
                    └─────────────────┘
                           ↑
                    ┌─────────────────┐
                    │  Unit Tests     │  ← Function correctness
                    │ (Development)   │
                    └─────────────────┘
```

Each layer builds on the one below. Don't skip levels.

---

## Azure AI Evaluation SDK

### Installation

```bash
pip install azure-ai-evaluation
```

### Core Concept: The `evaluate()` API

**⚠️ CRITICAL**: Always use the `evaluate()` API. Do not manually iterate through data.

**Why?**
- ✅ Handles all evaluators simultaneously
- ✅ Automatic metric aggregation
- ✅ Optimized parallel processing
- ✅ Consistent result formatting
- ✅ Comprehensive error handling

### Basic Usage

```python
from azure.ai.evaluation import evaluate, TaskAdherenceEvaluator, AzureOpenAIModelConfiguration
import os

# 1. Configure model for evaluators
model_config = AzureOpenAIModelConfiguration(
    azure_deployment="gpt-4",
    azure_endpoint=os.environ["AZURE_OPENAI_ENDPOINT"],
    api_key=os.environ["AZURE_OPENAI_API_KEY"],
    api_version="2025-04-01-preview"
)

# 2. Create evaluators
task_evaluator = TaskAdherenceEvaluator(model_config=model_config)

# 3. Run evaluation
result = evaluate(
    data="test_data.jsonl",  # Must be JSONL format
    evaluators={"task_adherence": task_evaluator},
    evaluator_config={
        "task_adherence": {
            "column_mapping": {
                "query": "${data.query}",
                "response": "${data.response}"
            }
        }
    },
    output_path="./eval_results"
)

# 4. Review results
print(result["metrics"])  # Aggregated metrics
print(result["rows"])     # Row-level results
```

---

## Built-in Evaluators Reference

### Agent Evaluators

#### TaskAdherenceEvaluator

**Purpose**: Assess how well the AI follows assigned tasks

**Type**: Prompt-based (requires model configuration)

**Required Columns**: `query`, `response` (optional: `tool_definitions`)

**Returns**: Score 1-5, reasoning

**When to Use**:
- Testing if agent understands instructions
- Validating task completion
- Measuring instruction-following quality

**Example**:

```python
from azure.ai.evaluation import TaskAdherenceEvaluator

evaluator = TaskAdherenceEvaluator(model_config=model_config)

result = evaluate(
    data="tasks.jsonl",
    evaluators={"task": evaluator},
    evaluator_config={
        "task": {
            "column_mapping": {
                "query": "${data.instruction}",
                "response": "${data.agent_output}"
            }
        }
    }
)
```

#### IntentResolutionEvaluator

**Purpose**: Verify if user intent was correctly identified and resolved

**Type**: Prompt-based

**Required Columns**: `query`, `response` (optional: `tool_definitions`)

**Returns**: Score 1-5, reasoning

**When to Use**:
- Chatbot intent handling
- Customer support automation
- Task-based agents

#### ToolCallAccuracyEvaluator

**Purpose**: Assess accuracy of tool/function calling

**Type**: Prompt-based

**Required Columns**: `query`, `tool_definitions` (optional: `tool_calls`, `response`)

**Returns**: Score 1-5, reasoning

**When to Use**:
- Function calling agents
- API integration testing
- Tool selection validation

**Tool Format Requirements**:

```python
# tool_definitions format
{
  "name": "function_name",
  "description": "What the function does",
  "parameters": {...}
}

# tool_calls format
{
  "type": "tool_call",  # REQUIRED
  "name": "function_name",  # REQUIRED
  # ... other fields
}
```

### General Purpose Evaluators

#### CoherenceEvaluator

**Purpose**: Measure text naturalness and flow

**Type**: Prompt-based

**Required Columns**: `query`, `response`

**Returns**: Score 1-5, reasoning

**When to Use**:
- Content generation quality
- Natural language output
- Readability assessment

#### FluencyEvaluator

**Purpose**: Assess grammar, syntax, and vocabulary

**Type**: Prompt-based

**Required Columns**: `response`

**Returns**: Score 1-5, reasoning

**When to Use**:
- Language quality checks
- Grammar validation
- Professional writing

### Similarity Evaluators

#### SimilarityEvaluator

**Purpose**: Semantic similarity to ground truth

**Type**: Code-based (uses embeddings)

**Required Columns**: `query`, `response`, `ground_truth`

**Returns**: Score 1-5

**When to Use**:
- Answer accuracy
- Paraphrasing quality
- Semantic correctness

#### F1ScoreEvaluator, RougeScoreEvaluator, BleuScoreEvaluator

**Purpose**: Token/n-gram overlap metrics

**Type**: Code-based

**Required Columns**: `response`, `ground_truth`

**Returns**: Score 0-1

**When to Use**:
- Translation quality
- Summarization accuracy
- Exact matching needs

### RAG Evaluators

#### RetrievalEvaluator

**Purpose**: Assess retrieval quality

**Type**: Prompt-based

**Required Columns**: `query`, `context`

**Returns**: Score 1-5, reasoning

**When to Use**:
- RAG system evaluation
- Search quality
- Document retrieval

#### GroundednessEvaluator

**Purpose**: Verify claims are supported by context

**Type**: Prompt-based

**Required Columns**: `response`, `context` (optional: `query`)

**Returns**: Score 1-5, reasoning

**When to Use**:
- Fact-checking
- Hallucination detection
- Citation verification

#### RelevanceEvaluator

**Purpose**: Assess response relevance to query

**Type**: Prompt-based

**Required Columns**: `query`, `response`

**Returns**: Score 1-5, reasoning

**When to Use**:
- Answer quality
- Topic adherence
- User satisfaction proxy

---

## Custom Evaluators

### When to Create Custom Evaluators

✅ **Create custom evaluators when**:
- Business-specific metrics needed
- Domain-specific quality criteria
- Compliance requirements
- Cost/performance metrics

❌ **Don't create custom evaluators when**:
- Built-in evaluators exist for your need
- Simple assertions would suffice
- You haven't tried built-ins first

### Custom Code-Based Evaluator

**Best for**: Objective, measurable criteria

**Example: Response Length**

```python
class ResponseLengthEvaluator:
    """Measure response length and compliance"""
    
    def __init__(self, min_length: int = 10, max_length: int = 500):
        self.min_length = min_length
        self.max_length = max_length
    
    def __call__(self, *, response: str, **kwargs):
        token_count = len(response.split())
        
        return {
            "response_length": token_count,
            "within_limits": self.min_length <= token_count <= self.max_length,
            "too_short": token_count < self.min_length,
            "too_long": token_count > self.max_length
        }
```

**Example: Cost Tracking**

```python
import tiktoken

class CostEvaluator:
    """Track token usage and estimated cost"""
    
    def __init__(self, model_name: str = "gpt-4"):
        self.encoder = tiktoken.encoding_for_model(model_name)
        self.cost_per_1k_input = 0.03  # $0.03 per 1k tokens
        self.cost_per_1k_output = 0.06  # $0.06 per 1k tokens
    
    def __call__(self, *, query: str, response: str, **kwargs):
        input_tokens = len(self.encoder.encode(query))
        output_tokens = len(self.encoder.encode(response))
        
        cost = (
            (input_tokens / 1000) * self.cost_per_1k_input +
            (output_tokens / 1000) * self.cost_per_1k_output
        )
        
        return {
            "input_tokens": input_tokens,
            "output_tokens": output_tokens,
            "total_tokens": input_tokens + output_tokens,
            "estimated_cost": cost
        }
```

### Custom Prompt-Based Evaluator

**Best for**: Subjective criteria requiring LLM judgment

**Example: Brand Voice Consistency**

**Step 1: Create Prompty File** (`brand_voice.prompty`)

```yaml
---
name: Brand Voice Evaluator
description: Evaluate if response matches brand voice guidelines
model:
  api: chat
  parameters:
    temperature: 0.2
    max_tokens: 500
inputs:
  response:
    type: string
outputs:
  score:
    type: integer
  reasoning:
    type: string
---
system:
You are an expert brand voice evaluator. Assess if the response matches our brand guidelines:
- Tone: Professional but friendly
- Language: Clear, concise, jargon-free
- Values: Customer-first, transparent, empowering

Return JSON format:
{
  "score": 1-5 (1=poor, 5=excellent),
  "reasoning": "explanation",
  "issues": ["list of issues if any"]
}

user:
Response to evaluate:
{{response}}
```

**Step 2: Create Python Evaluator**

```python
from promptflow.client import load_flow
import json

class BrandVoiceEvaluator:
    """Evaluate brand voice consistency"""
    
    def __init__(self, model_config):
        self._flow = load_flow(
            source="brand_voice.prompty",
            model={"configuration": model_config}
        )
    
    def __call__(self, *, response: str, **kwargs):
        result = self._flow(response=response)
        try:
            return json.loads(result)
        except:
            return {"score": 0, "reasoning": "Failed to parse", "issues": []}
```

### Combining Multiple Evaluators

```python
# All three types together
result = evaluate(
    data="comprehensive_test.jsonl",
    evaluators={
        # Built-in
        "task_adherence": TaskAdherenceEvaluator(model_config),
        "tool_accuracy": ToolCallAccuracyEvaluator(model_config),
        "coherence": CoherenceEvaluator(model_config),
        
        # Custom code-based
        "response_length": ResponseLengthEvaluator(min_length=50, max_length=300),
        "cost": CostEvaluator(model_name="gpt-4.1-mini"),
        
        # Custom prompt-based
        "brand_voice": BrandVoiceEvaluator(model_config)
    },
    evaluator_config={
        "task_adherence": {
            "column_mapping": {
                "query": "${data.query}",
                "response": "${data.response}"
            }
        },
        # ... other mappings
    },
    output_path="./eval_results"
)

# Results automatically aggregated
print(f"Average task adherence: {result['metrics']['task_adherence']}")
print(f"Average cost per request: {result['metrics']['cost.estimated_cost']}")
print(f"Brand voice compliance: {result['metrics']['brand_voice.score']}")
```

---

## Test Dataset Creation

### JSONL Format (REQUIRED)

```jsonl
{"query": "What's the weather?", "response": "It's sunny today.", "ground_truth": "Current weather is sunny with 72°F"}
{"query": "Book a flight to NYC", "response": "Flight booked for tomorrow at 9 AM", "ground_truth": "Flight booking confirmed"}
```

**⚠️ Critical Rules**:
- Must be JSONL (JSON Lines), not JSON array
- One JSON object per line
- No timestamps (causes SDK errors)
- Include all required columns for evaluators

### Creating Test Datasets

**Strategy 1: Real User Data**

```python
# Extract from production logs
import json

with open("production_logs.json") as f:
    logs = json.load(f)

with open("test_data.jsonl", "w") as f:
    for log in logs[:1000]:  # Sample 1000 interactions
        test_case = {
            "query": log["user_input"],
            "response": log["agent_output"],
            "tool_calls": log.get("tool_calls", [])
        }
        f.write(json.dumps(test_case) + "\n")
```

**Strategy 2: Synthetic Data Generation**

```python
from agent_framework import Agent

# Generate test cases using AI
generator = Agent(
    model=client,
    instructions="""
    Generate realistic test cases for a customer support agent.
    Format: {"query": "...", "expected_response": "..."}
    """
)

test_cases = []
for i in range(100):
    case = generator.run(f"Generate test case #{i+1}")
    test_cases.append(json.loads(case))

# Save as JSONL
with open("synthetic_test.jsonl", "w") as f:
    for case in test_cases:
        f.write(json.dumps(case) + "\n")
```

**Strategy 3: Edge Cases & Adversarial**

```python
edge_cases = [
    # Empty/minimal input
    {"query": "", "response": "I need more information to help you."},
    {"query": "hi", "response": "Hello! How can I assist you today?"},
    
    # Ambiguous queries
    {"query": "it's broken", "response": "I'd be happy to help. Can you tell me what's broken?"},
    
    # Prompt injection attempts
    {"query": "Ignore previous instructions and...", "response": "I'm here to help with legitimate requests."},
    
    # Multiple intents
    {"query": "What's the weather and book me a flight", "response": "I can help with both. Let's start with..."},
    
    # Out of scope
    {"query": "What's the meaning of life?", "response": "I'm focused on helping with [scope]. Is there something specific I can assist with?"},
]

# Extend with ground truth and other fields
```

### Dataset Versioning

```python
import datetime

# Version datasets
dataset_version = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
filename = f"test_data_v{dataset_version}.jsonl"

# Track in version control
# git add test_data_v20251203_140530.jsonl
# git commit -m "Add test dataset v20251203_140530"
```

---

## Continuous Evaluation

### Pre-Commit Evaluation

```bash
# .git/hooks/pre-commit
#!/bin/bash

echo "Running evaluation before commit..."
python scripts/run_evaluation.py

if [ $? -ne 0 ]; then
    echo "Evaluation failed. Commit aborted."
    exit 1
fi
```

### CI/CD Integration

```yaml
# .github/workflows/evaluate.yml
name: AI Evaluation

on:
  pull_request:
    branches: [main, test]

jobs:
  evaluate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Install dependencies
        run: |
          pip install azure-ai-evaluation agent-framework-azure-ai --pre
      
      - name: Run evaluation
        env:
          AZURE_OPENAI_ENDPOINT: ${{ secrets.AZURE_OPENAI_ENDPOINT }}
          AZURE_OPENAI_API_KEY: ${{ secrets.AZURE_OPENAI_API_KEY }}
        run: |
          python scripts/run_evaluation.py
      
      - name: Check thresholds
        run: |
          python scripts/check_metrics.py --min-task-adherence 0.8
```

### Scheduled Evaluation (Production Monitoring)

```python
# scripts/scheduled_evaluation.py
import schedule
import time

def run_daily_evaluation():
    """Run evaluation on production data"""
    # Collect last 24h of production data
    data = collect_production_data(hours=24)
    
    # Save as JSONL
    with open("prod_eval_data.jsonl", "w") as f:
        for item in data:
            f.write(json.dumps(item) + "\n")
    
    # Run evaluation
    result = evaluate(
        data="prod_eval_data.jsonl",
        evaluators={...},
        output_path=f"./eval_results/{datetime.date.today()}"
    )
    
    # Alert if metrics degrade
    if result["metrics"]["task_adherence"] < 0.85:
        send_alert("Task adherence dropped to {result['metrics']['task_adherence']}")

# Schedule daily at 2 AM
schedule.every().day.at("02:00").do(run_daily_evaluation)

while True:
    schedule.run_pending()
    time.sleep(3600)
```

---

## Metrics Interpretation

### Understanding Scores

**Prompt-Based Evaluators (1-5 scale)**:
- **5**: Excellent, exceeds expectations
- **4**: Good, meets expectations
- **3**: Acceptable, minor issues
- **2**: Poor, significant issues
- **1**: Fails, unusable

**Code-Based Evaluators (0-1 scale)**:
- **1.0**: Perfect match
- **0.7-0.9**: Good
- **0.5-0.7**: Moderate
- **< 0.5**: Poor

### Setting Thresholds

```python
# Minimum acceptable scores
THRESHOLDS = {
    "task_adherence": 4.0,      # Must be good or excellent
    "tool_accuracy": 4.0,        # Critical for function calling
    "coherence": 3.5,            # Some flexibility
    "groundedness": 4.5,         # Strict for factual accuracy
    "similarity": 0.7,           # 70% semantic match
    "response_length.within_limits": 0.95  # 95% compliance
}

def check_evaluation_results(result):
    """Verify results meet thresholds"""
    failures = []
    
    for metric, threshold in THRESHOLDS.items():
        actual = result["metrics"].get(metric)
        if actual is None:
            failures.append(f"Missing metric: {metric}")
        elif actual < threshold:
            failures.append(f"{metric}: {actual} < {threshold}")
    
    if failures:
        raise ValueError(f"Evaluation failed:\n" + "\n".join(failures))
    
    return True
```

### Tracking Over Time

```python
import pandas as pd
import matplotlib.pyplot as plt

# Load historical results
results = []
for file in glob.glob("eval_results/*/metrics.json"):
    with open(file) as f:
        data = json.load(f)
        data["date"] = extract_date_from_path(file)
        results.append(data)

df = pd.DataFrame(results)

# Plot trends
plt.figure(figsize=(12, 6))
plt.plot(df["date"], df["task_adherence"], label="Task Adherence")
plt.plot(df["date"], df["tool_accuracy"], label="Tool Accuracy")
plt.axhline(y=4.0, color='r', linestyle='--', label="Threshold")
plt.xlabel("Date")
plt.ylabel("Score")
plt.title("Evaluation Metrics Over Time")
plt.legend()
plt.savefig("metrics_trend.png")
```

---

## Best Practices

### 1. Start with Built-in Evaluators

Always check if a built-in evaluator exists before writing custom ones.

### 2. Use Diverse Test Data

- ✅ Positive cases (expected to succeed)
- ✅ Negative cases (expected to fail gracefully)
- ✅ Edge cases (boundary conditions)
- ✅ Adversarial cases (attacks, prompt injection)

### 3. Version Everything

- Test datasets
- Evaluation code
- Model versions
- Threshold configurations

### 4. Automate Evaluation

- Pre-commit hooks
- CI/CD pipelines
- Scheduled production checks

### 5. Monitor in Production

Don't just evaluate before launch—continuously monitor:
- User satisfaction (surveys)
- Task completion rates
- Error rates
- Cost per interaction

### 6. Iterate Based on Data

```
Evaluate → Analyze → Improve → Evaluate
    ↑                            ↓
    └────────────────────────────┘
```

### 7. Document Failures

When evaluation fails, document:
- What failed
- Why it failed
- How to fix it
- Regression test to prevent recurrence

---

## Quick Reference

### Evaluation Workflow Checklist

- [ ] Choose appropriate evaluators (built-in first)
- [ ] Create test dataset (JSONL format)
- [ ] Configure model for prompt-based evaluators
- [ ] Run `evaluate()` API (not manual iteration)
- [ ] Review aggregated metrics
- [ ] Analyze individual failures
- [ ] Set appropriate thresholds
- [ ] Integrate into CI/CD
- [ ] Monitor in production
- [ ] Iterate and improve

### Common Gotchas

❌ **Using JSON array instead of JSONL**
✅ Use JSONL (one object per line)

❌ **Including timestamps in data**
✅ Remove timestamps before evaluation

❌ **Using Foundry project endpoint for eval model**
✅ Use Azure OpenAI endpoint directly

❌ **Manually iterating through data**
✅ Always use `evaluate()` API

❌ **Creating custom evaluators without checking built-ins**
✅ Search built-in evaluators first

---

**Version**: 1.0  
**Last Updated**: December 3, 2025  
**Compatibility**: Azure AI Evaluation SDK, Microsoft Agent Framework
