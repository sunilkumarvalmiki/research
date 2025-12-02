# Development Using Continue.dev

## The Complete Guide to Cost-Efficient AI Coding with Open-Source and Paid Models

**Version:** 2.0  
**Last Updated:** December 2024  
**Platform:** macOS (M1 Pro optimized)  
**Author:** Comprehensive Development Guide  

---

## Table of Contents

1. [Introduction to Continue.dev](#introduction)
2. [Installation & Configuration](#installation--configuration)
3. [Open-Source Development (100% Free)](#open-source-development)
4. [Paid Model Integration (Cost-Optimized)](#paid-model-integration)
5. [Core Features Deep Dive](#core-features)
6. [Practical Use Cases & Examples](#practical-use-cases)
7. [Advanced Configuration](#advanced-configuration)
8. [Cost Optimization Strategies](#cost-optimization)
9. [Integration & Workflows](#integration--workflows)
10. [Best Practices](#best-practices)
11. [Troubleshooting](#troubleshooting)

---

## Introduction

### What is Continue.dev?

**Continue.dev** is a leading open-source AI code assistant that brings the power of large language models directly into your IDE (VS Code and JetBrains). Unlike proprietary alternatives like GitHub Copilot, Continue.dev offers complete **model freedom**, allowing you to choose between local open-source models (100% free) or cloud-based paid models for maximum flexibility.

### Why Continue.dev?

**For Cost Efficiency:**
- ✅ **100% Free Option** - Use local Ollama models with zero API costs
- ✅ **No Subscriptions** - Unlike Copilot ($10/month) or Cursor ($20/month)
- ✅ **Model Freedom** - Switch between 50+ AI models instantly
- ✅ **Privacy First** - Local models keep your code completely private

**For Development Speed:**
- ⚡ **Tab Autocomplete** - Context-aware inline completions
- 💬 **AI Chat** - Conversational coding assistant
- ✏️ **Inline Editing** - `cmd+I` to edit code with natural language
- 🔧 **Codebase Understanding** - Automatically indexes your project

**Key Differentiators:**
1. **Open Source** - Free forever, community-driven, auditable code
2. **Local-First** - Run entirely on your machine (no internet required)
3. **Highly Customizable** - `config.yaml` for unlimited customization
4. **Model Agnostic** - Works with OpenAI, Anthropic, Ollama, Azure, and more

### Feature Comparison

| Feature | Continue.dev (Free) | GitHub Copilot | Cursor |
|---------|---------------------|----------------|--------|
| **Cost** | $0 (local models) | $10/month | $20/month |
| **Privacy** | 100% local option | Cloud only | Cloud only |
| **Models** | 50+ options | GPT only | Limited |
| **Autocomplete** | ✅ | ✅ | ✅ |
| **Chat** | ✅ | ✅ (separate) | ✅ |
| **Inline Editing** | ✅ | ❌ | ✅ |
| **Codebase Index** | ✅ | ❌ | ✅ |
| **Offline** | ✅ | ❌ | ❌ |
| **Open Source** | ✅ | ❌ | ❌ |

---

## Installation & Configuration

### Step 1: Install Continue.dev Extension

**✅ Status:** Already installed on your system!

**For New Users:**

```bash
# VS Code
code --install-extension Continue.continue

# Verify installation
code --list-extensions | grep continue
# Output: continue.continue
```

**Alternative Method:**
1. Open VS Code
2. Press `Cmd + Shift + X` (Extensions)
3. Search "Continue AI"
4. Click Install

### Step 2: Initial Setup

**First Launch:**
1. Look for Continue icon in VS Code sidebar (left panel)
2. Click to open Continue panel
3. You'll see:
   - Chat interface
   - Model selector dropdown
   - `@` symbol for context providers

**Optional Sign-In:**
- Continue offers cloud sync for config
- **Not required** for local-only usage
- Sign in only if you want config sync across machines

### Step 3: Verify Installation

**Current Status (Your System):**

```bash
# Check Continue config directory
ls -la ~/.continue/

# Output shows:
# ✅ config.yaml (your configuration)
# ✅ index/ (codebase embeddings)
# ✅ sessions/ (chat history)
```

**Test Continue:**
1. Open any code file
2. Type a comment: `// function to calculate factorial`
3. Press `Tab` - Continue should suggest code
4. Success! ✅

---

## Open-Source Development (100% Free)

### Why Use Local Models?

**Cost Savings:**
- **Startup Example:** Reduced AI costs from $60,000 to $3,000/year using local models
- **Personal Project:** $0 vs $120/year (GitHub Copilot)
- **High Volume:** Unlimited requests, zero per-token charges

**Privacy Benefits:**
- Code never leaves your machine
- No data sent to third-party servers
- Perfect for proprietary/confidential code
- GDPR/HIPAA compliant by default

**Performance:**
- **No network latency** - Instant responses
- **Offline capable** - Work anywhere
- **Predictable speed** - Not affected by API rate limits

### Best Free Models for M1 Pro 16GB (You Already Have These!)

**Your Current Setup (Ollama):**

| Model | Size | Speed (t/s) | Best For | Status |
|-------|------|-------------|----------|--------|
| **deepseek-coder-v2** | 8.9GB | 15-25 | Complex coding, debugging | ✅ Installed |
| **qwen2.5-coder:7b** | 4.7GB | 30-50 | Fast completions | ✅ Installed |
| **starcoder2:7b** | 4.0GB | 35-45 | Code completion | ✅ Installed |
| **llama3:8b** | 4.7GB | 40-50 | General queries | ✅ Installed |
| **mistral:7b** | 4.2GB | 35-45 | Reasoning | ✅ Installed |
| **qwen3:8b** | 5.2GB | 30-40 | Research | ✅ Installed |
| **deepseek-r1:8b** | 5.2GB | 25-35 | Advanced reasoning | ✅ Installed |

### Configure Continue.dev with Ollama Models

**Method 1: Automatic Detection (Easiest)**

Continue.dev auto-detects Ollama models! Just:
1. Make sure Ollama is running: `ollama serve`
2. Open Continue panel
3. Click model selector dropdown
4. See your models listed under "Ollama"

**Method 2: Manual Configuration (Recommended for Customization)**

Edit `~/.continue/config.yaml`:

```yaml
models:
  # Primary coding model
  - title: DeepSeek Coder V2
    provider: ollama
    model: deepseek-coder-v2
    systemMessage: |
      You are an expert programmer. Provide clean, efficient code.
      Follow best practices and include error handling.
    
  # Fast autocomplete model
  - title: Qwen Coder (Fast)
    provider: ollama
    model: qwen2.5-coder:7b
    systemMessage: |
      Provide concise code completions. No explanations unless asked.
      
  # General purpose
  - title: Llama 3
    provider: ollama
    model: llama3:8b
    
  # Reasoning tasks  
  - title: DeepSeek R1 (Reasoning)
    provider: ollama
    model: deepseek-r1:8b

# Set default model for chat
defaultModel: deepseek-coder-v2

# Set model for autocomplete (use faster model)
tabAutocompleteModel:
  title: Qwen Coder Autocomplete
  provider: ollama
  model: qwen2.5-coder:7b
  maxTokens: 500  # Shorter for autocomplete
```

**Save the file** - Continue auto-reloads on save!

### Complete Free Workflow Example

**Scenario:** Build a REST API with FastAPI using only local models

**Step 1: Chat to Plan**

Open Continue chat (`Cmd + L`):

```
You: I need to build a REST API with FastAPI for a todo app. 
Help me plan the structure.

Continue (using deepseek-coder-v2, local):
I'll help you create a well-structured FastAPI todo application.

Recommended Structure:
app/
├── main.py (entry point)
├── models.py (Pydantic models)  
├── database.py (DB connection)
├── crud.py (database operations)
└── routers/
    └── todos.py (API endpoints)

Models needed:
1. Todo (id, title, description, completed, created_at)
2. TodoCreate (title, description)
3. TodoUpdate (title?, description?, completed?)

Would you like me to generate the code for each file?
```

**Cost:** $0 (local model)

**Step 2: Generate Code with Context**

```
You: @workspace Generate main.py with proper project structure

Continue (analyzing entire project):
[Generates complete FastAPI main.py with proper imports, CORS, and router registration]
```

**Step 3: Autocomplete as You Code**

Type in `models.py`:

```python
from pydantic import BaseModel
from datetime import datetime

class Todo(BaseModel):
    # Press Tab here ↓
```

Continue autocompletes:
```python
    id: int
    title: str
    description: str | None = None
    completed: bool = False
    created_at: datetime
```

**Cost:** Still $0!

**Step 4: Refactor with Inline Editing**

Select existing code, press `Cmd + I`:

```
Prompt: Add input validation and better error messages
```

Continue streams diff directly into editor - accept or reject changes.

**Total Cost:** **$0** for entire development session

**Time Saved:** ~2 hours vs manual coding

---

## Paid Model Integration (Cost-Optimized)

### When to Use Paid Models

**Use Cases Worth Paying For:**
1. **Extremely Complex Reasoning** - Multi-step problem solving
2. **Latest Model Capabilities** - Cutting-edge AI features
3. **Guaranteed Uptime** - Production critical applications
4. **Multimodal Needs** - Image/audio understanding
5. **Very Long Context** - 100K+ token documents

### Cost-Efficient Paid Options

**Best Value Models (December 2024):**

| Model | Provider | Input Cost | Output Cost | Best For |
|-------|----------|------------|-------------|----------|
| **Gemini 1.5 Flash** | Google | $0.075/1M | $0.30/1M | Ultra cheap, fast |
| **Claude 3 Haiku** | Anthropic | $0.25/1M | $1.25/1M | Balanced price/quality |
| **GPT-4o-mini** | OpenAI | $0.15/1M | $0.60/1M | Best OpenAI value |
| **Llama 3.1 70B** | Together AI | $0.90/1M | $0.90/1M | Powerful open-source |

**Free Tiers (Start Here!):**
- **GitHub Models:** 15,000 requests/month FREE
- **Google AI Studio:** Gemini 1.5 Flash FREE (rate limited)
- **Groq:** 14,400 requests/day FREE (Llama, Mixtral)

### Configure Paid Models in Continue.dev

**OpenAI Setup:**

```yaml
# ~/.continue/config.yaml
models:
  # For complex tasks only
  - title: GPT-4o Mini
    provider: openai
    model: gpt-4o-mini
    apiKey: ${OPENAI_API_KEY}  # Reference env variable
    maxTokens: 2000

# Set environment variable
# In ~/.zshrc:
export OPENAI_API_KEY="sk-..."
```

**Anthropic (Claude) Setup:**

```yaml
models:
  - title: Claude 3 Haiku (Fast & Cheap)
    provider: anthropic
    model: claude-3-haiku-20240307
    apiKey: ${ANTHROPIC_API_KEY}
    maxTokens: 4000
    
  # Optional: Premium model for hard problems
  - title: Claude 3.5 Sonnet (Premium)
    provider: anthropic
    model: claude-3-5-sonnet-20240620
    apiKey: ${ANTHROPIC_API_KEY}
```

**Google Gemini Setup (Cheapest!):**

```yaml
models:
  - title: Gemini 1.5 Flash (Ultra Cheap)
    provider: gemini
    model: gemini-1.5-flash
    apiKey: ${GOOGLE_API_KEY}
    # Only $0.075/1M tokens input!
```

**Groq Setup (Free, Ultra Fast):**

```yaml
models:
  - title: Llama 3 70B (Groq Free)
    provider: groq
    model: llama-3.1-70b-versatile
    apiKey: ${GROQ_API_KEY}
    # FREE with high rate limits!
```

### Hybrid Strategy (Best of Both Worlds)

**Configuration for Maximum Cost Efficiency:**

```yaml
models:
  # 1. PRIMARY: Free local model (95% of usage)
  - title: DeepSeek Coder (Local)
    provider: ollama
    model: deepseek-coder-v2
    
  # 2. FALLBACK: Free cloud tier (4% of usage)  
  - title: Groq Llama 3 (Free Cloud)
    provider: groq
    model: llama-3.1-70b-versatile
    apiKey: ${GROQ_API_KEY}
    
  # 3. PREMIUM: Paid only when needed (1% of usage)
  - title: Gemini Flash (Cheapest Paid)
    provider: gemini
    model: gemini-1.5-flash
    apiKey: ${GOOGLE_API_KEY}

# Default to local (free)
defaultModel: DeepSeek Coder (Local)

# Autocomplete always uses local (free, faster)
tabAutocompleteModel:
  provider: ollama
  model: qwen2.5-coder:7b
```

**Usage Strategy:**
- **Daily coding:** Use local DeepSeek Coder (Free)
- **Complex problems:** Switch to Groq Llama 3 (Free)
- **Production critical:** Use Gemini Flash ($0.075/1M)

**Expected Monthly Costs:**
- Local models: $0
- Groq (free tier): $0  
- Gemini Flash (~1M tokens): $0.075
- **Total: <$5/month** vs $10-20 for Copilot/Cursor

---

## Core Features Deep Dive

### 1. Tab Autocomplete (Inline Suggestions)

**How It Works:**
- Continue analyzes your code in real-time
- Suggests completions as you type
- Press `Tab` to accept, `Esc` to dismiss

**Configuration:**

```yaml
tabAutocompleteModel:
  provider: ollama
  model: qwen2.5-coder:7b  # Fast model recommended
  maxTokens: 500
  
# Customize autocomplete behavior
tabAutocompleteOptions:
  # Enable multi-line completions
  multiline: true
  
  # Debounce delay (ms) - how long to wait before suggesting
  debounceDelay: 300
  
  # Disable in specific files
  disableInFiles:
    - "*.md"
    - "*.txt"
    - ".env"
```

**Best Practices:**
- Use **faster, smaller models** for autocomplete (qwen2.5-coder:1.5b is ideal)
- **Don't** use large models like GPT-4 (slow, expensive)
- Enable for coding files only

**Example:**

```python
# Type this comment:
# function to validate email address

# Press Enter, Continue suggests:
def validate_email(email: str) -> bool:
    """Validate email address format."""
    import re
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None
```

**Cost:** $0 with local model

### 2. AI Chat (`Cmd + L`)

**Open Chat:**
- Press `Cmd + L` (macOS) or `Ctrl + L` (Windows/Linux)
- Chat panel appears on right side

**Basic Usage:**

```
You: How do I read a CSV file in pandas?

Continue:
Here's how to read a CSV file using pandas:

```python
import pandas as pd

# Basic usage
df = pd.read_csv('your_file.csv')

# With options
df = pd.read_csv(
    'file.csv',
    delimiter=',',
    encoding='utf-8',
    na_values=['NA', 'null']
)
```

Would you like me to explain any specific parameters?
```

**Using Context Providers:**

Continue.dev includes powerful `@` context providers:

```yaml
# In config.yaml
contextProviders:
  - name: code
    # Reference functions, classes from codebase
    
  - name: docs  
    # Reference documentation sites
    
  - name: web
    # Search the internet
    
  - name: terminal
    # Include terminal output
    
  - name: problems
    # Include IDE errors/warnings
    
  - name: folder
    # Reference specific folder
    
  - name: codebase
    # Search entire codebase
```

**Example with Context:**

```
You: @code calculate_total Optimize this function for large datasets

Continue: [Analyzes the calculate_total function and suggests optimization]

You: @web Latest pandas best practices for memory optimization

Continue: [Searches web and provides current recommendations]

You: @docs numpy How to use np.vectorize?

Continue: [Fetches from numpy documentation]
```

**Advanced Chat Features (2024):**
- **Tool Use:** Continue can read/write files, run commands (with approval)
- **Links to Code:** Click code references to jump to file
- **Sticky Input:** Input box stays visible while scrolling
- **Auto-docs:** Suggests documentation based on context

### 3. Inline Editing (`Cmd + I`)

**Most Powerful Feature!**

**How to Use:**
1. Select code in editor
2. Press `Cmd + I` (or `Cmd + Shift + I` for multi-file)
3. Type your instruction
4. Continue streams diff into editor
5. Accept (`Cmd + Enter`) or Reject (`Cmd + Backspace`)

**Example 1: Refactoring**

```python
# Original code (selected):
def process(data):
    result = []
    for item in data:
        if item > 0:
            result.append(item * 2)
    return result

# Press Cmd+I, type: "Convert to list comprehension with type hints"

# Continue suggests:
from typing import List

def process(data: List[int]) -> List[int]:
    """Process positive numbers by doubling them."""
    return [item * 2 for item in data if item > 0]

# Accept or reject with one keystroke!
```

**Example 2: Adding Features**

```python
# Existing function (selected):
def save_user(user_data):
    db.insert(user_data)

# Cmd+I: "Add validation, error handling, and logging"

# Continue adds:
import logging
from pydantic import ValidationError

def save_user(user_data: dict) -> bool:
    """Save user data with validation and error handling."""
    try:
        # Validate input
        if not user_data.get('email'):
            raise ValueError("Email is required")
            
        # Save to database
        db.insert(user_data)
        logging.info(f"User saved: {user_data.get('email')}")
        return True
        
    except ValidationError as e:
        logging.error(f"Validation failed: {e}")
        return False
    except Exception as e:
        logging.error(f"Failed to save user: {e}")
        return False
```

**Multi-File Editing (New in 2024!):**

Press `Cmd + Shift + I` to select multiple files and edit them together:

```
Selected files:
- app/models.py
- app/routes.py  
- app/database.py

Prompt: "Add async support to all database operations"

Continue modifies all 3 files simultaneously with consistent changes!
```

### 4. Codebase Understanding

Continue automatically indexes your entire codebase for:
- Function/class definitions
- Import relationships
- Recent changes (via Git)
- Clipboard content

**Enable Codebase Indexing:**

```yaml
# config.yaml
embeddingsProvider:
  provider: ollama
  model: nomic-embed-text  # Free local embeddings!
  
# Or use cloud embeddings (costs $)
#embeddingsProvider:
#  provider: openai
#  model: text-embedding-3-small
#  apiKey: ${OPENAI_API_KEY}
```

**Download Embeddings Model:**

```bash
# Free local embeddings
ollama pull nomic-embed-text  # Only ~274MB!

# Continue will now embed your codebase
# Stored in ~/.continue/index/
```

**Using Codebase Search:**

```
You: @codebase Where do we initialize the database connection?

Continue: [Searches entire codebase and finds relevant code]

You: @codebase Show me all functions that call our payment API

Continue: [Lists all relevant functions with code snippets]
```

**Benefits:**
- Accurate code suggestions based on **your** codebase
- Find related code automatically
- Understand legacy codebases faster

**Cost:** $0 with local `nomic-embed-text`

---

## Practical Use Cases & Examples

### Use Case 1: Debugging with Continue.dev

**Scenario:** Runtime error in Python application

**Step 1: Include Error in Chat**

```
You: @problems Explain this error and suggest a fix

Continue: [Analyzes VSCode problems panel]

The error "AttributeError: 'NoneType' object has no attribute 'get'"
occurs in user_handler.py line 45.

The issue is that `user_data` can be None when the database query fails.

Suggested fix:
...
```

**Step 2: Apply Fix with Cmd+I**

Select the buggy function, press `Cmd+I`:

```
Prompt: Fix the NoneType error with proper null checking
```

Continue adds null checks and error handling.

**Time Saved:** 15-30 minutes of debugging  
**Cost:** $0 (local model)

### Use Case 2: Learning New Framework

**Scenario:** Learning FastAPI for the first time

**Conversation:**

```
You: I'm new to FastAPI. Help me understand dependency injection.

Continue (deepseek-coder-v2):
FastAPI's dependency injection system allows you to:
1. Share logic across endpoints
2. Manage resources (DB connections, auth)
3. Create reusable components

Example:

```python
from fastapi import Depends, FastAPI
from sqlalchemy.orm import Session

app = FastAPI()

# Dependency (reusable)
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Use in endpoint
@app.get("/users/{user_id}")
def read_user(user_id: int, db: Session = Depends(get_db)):
    return db.query(User).filter(User.id == user_id).first()
```

You: @code app.py Add dependency injection for all database access

Continue: [Refactors entire file with proper dependency injection]
```

**Learning Speed:** 3x faster than reading docs alone  
**Interactive:** Ask follow-up questions immediately

### Use Case 3: Code Review Assistant

**Scenario:** Review a pull request

**Workflow:**

1. Open PR files in editor
2. Select changed code
3. Press `Cmd+L` for chat

```
You: @code Review this code for security issues, performance problems, and best practices violations

Continue performs multi-aspect review:

Security Issues:
1. Line 23: SQL injection vulnerability
   Use parameterized queries instead

2. Line 45: Hardcoded API key
   Move to environment variable

Performance Issues:
1. Line 67: N+1 query problem
   Use select_related() to optimize

2. Line 89: Inefficient loop
   Use list comprehension instead

Best Practices:
1. Missing type hints
2. No docstrings
3. Function too long (90 lines, recommend <50)
4. Inconsistent error handling

Would you like me to generate fixes?
```

**Cost:** $0 with local model  
**Time Saved:** 20-30 min per review

### Use Case 4: Documentation Generation

**Scenario:** Add docstrings to entire module

**Method 1: Bulk Generation**

```python
# Select all functions in file, Cmd+I:
Prompt: Add Google-style docstrings to all functions
```

**Method 2: Interactive**

```
You: @code Generate comprehensive documentation for the User class including examples

Continue: [Generates detailed docstring with parameter descriptions, return types, examples, and notes]
```

**Example Output:**

```python
class User:
    """
    Represents a user in the system.
    
    This class handles user authentication, profile management,
    and permission verification. Users are stored in the database
    with bcrypt-hashed passwords.
    
    Attributes:
        id (int): Unique user identifier
        email (str): User's email address (unique)
        username (str): Display name (unique)
        password_hash (str): Bcrypt hashed password
        created_at (datetime): Account creation timestamp
        is_active (bool): Account status flag
        
    Example:
        >>> user = User(email="test@example.com", username="testuser")
        >>> user.set_password("secure_password_123")
        >>> user.check_password("secure_password_123")
        True
        
    Note:
        Passwords are never stored in plain text. Always use
        set_password() and check_password() methods.
    """
```

### Use Case 5: Test Generation

**Scenario:** Create unit tests for existing code

```
You: @code calculate_discount Generate pytest tests covering all edge cases

Continue generates:

```python
import pytest
from decimal import Decimal
from myapp import calculate_discount

class TestCalculateDiscount:
    """Test suite for calculate_discount function."""
    
    def test_basic_discount(self):
        """Test basic percentage discount."""
        assert calculate_discount(100, 0.1) == Decimal('90.00')
        assert calculate_discount(50, 0.2) == Decimal('40.00')
    
    def test_zero_discount(self):
        """Test with no discount."""
        assert calculate_discount(100, 0) == Decimal('100.00')
    
    def test_full_discount(self):
        """Test 100% discount."""
        assert calculate_discount(100, 1.0) == Decimal('0.00')
    
    @pytest.mark.parametrize("price,discount,expected", [
        (100, 0.1, Decimal('90.00')),
        (99.99, 0.15, Decimal('84.99')),
        (0, 0.5, Decimal('0.00')),
    ])
    def test_various_inputs(self, price, discount, expected):
        """Test with various price and discount combinations."""
        result = calculate_discount(price, discount)
        assert abs(result - expected) < Decimal('0.01')
    
    def test_invalid_discount_negative(self):
        """Test that negative discount raises ValueError."""
        with pytest.raises(ValueError, match="Discount must be between 0 and 1"):
            calculate_discount(100, -0.1)
    
    def test_invalid_discount_over_100(self):
        """Test that discount > 1 raises ValueError."""
        with pytest.raises(ValueError, match="Discount must be between 0 and 1"):
            calculate_discount(100, 1.5)
    
    def test_invalid_price_negative(self):
        """Test that negative price raises ValueError."""
        with pytest.raises(ValueError, match="Price must be non-negative"):
            calculate_discount(-100, 0.1)
```

Run tests:
```bash
pytest -v test_myapp.py
```

All tests pass! ✅
```

**Time Saved:** 30-45 minutes per module  
**Test Coverage:** Typically achieves 90%+ coverage

---

## Advanced Configuration

### Custom Rules & System Prompts

**Create Project-Specific Rules:**

Create `.continuerules` file in project root:

```markdown
# .continuerules

You are a senior Python developer working on a FastAPI application.

## Coding Standards:
- Always use type hints (PEP 484)
- Follow PEP 8 style guide
- Maximum line length: 88 characters (Black formatter)
- Prefer composition over inheritance

## Project Conventions:
- Use Pydantic for all data validation
- All database operations must be async
- Error messages in format: {"error": "message", "code": "ERROR_CODE"}
- Log all database operations with logger.info()

## Security Requirements:
- Never log sensitive data (passwords, tokens, PII)
- Always validate input with Pydantic models
- Use parameterized queries for SQL
- Implement rate limiting on all public endpoints

## Testing:
- Write tests for all new functions
- Use pytest fixtures for database setup
- Aim for >80% code coverage
```

Continue will automatically use these rules in all chat and code generation!

### Slash Commands (Custom Prompts)

**Define Reusable Prompts:**

```yaml
# config.yaml
slashCommands:
  - name: test
    description: Generate pytest tests
    prompt: |
      Generate comprehensive pytest tests for the selected code.
      Include:
      - Happy path tests
      - Edge cases
      - Error handling
      - Parametrized tests
      Use clear test names and assertions.
      
  - name: review
    description: Code review
    prompt:  |
      Review the selected code for:
      1. Security vulnerabilities
      2. Performance issues
      3. Best practices violations
      4. Potential bugs
      Provide specific suggestions with code examples.
      
  - name: doc
    description: Add documentation
    prompt: |
      Add comprehensive documentation to the selected code:
      - Google-style docstrings
      - Parameter descriptions with types
      - Return value description
      - Usage examples
      - Relevant notes/warnings
      
  - name: optimize
    description: Optimize performance
    prompt: |
      Optimize the selected code for performance:
      - Identify bottlenecks
      - Suggest algorithmic improvements
      - Recommend better data structures
      - Show before/after performance comparison
```

**Usage in Chat:**

```
/test
# Automatically generates tests for selected code

/review
# Performs comprehensive code review

/doc
# Adds documentation
```

### Context Providers Configuration

**Advanced Context Setup:**

```yaml
contextProviders:
  # Codebase search with embeddings
  - name: codebase
    params:
      nRetrieve: 50  # Number of results
      nFinal: 10     # Number shown to user
      
  # Documentation sites
  - name: docs
    params:
      sites:
        - url: https://fastapi.tiangolo.com
          title: FastAPI Docs
          
        - url: https://docs.pydantic.dev
          title: Pydantic Docs
          
        - url: https://docs.sqlalchemy.org
          title: SQLAlchemy Docs
          
  # Web search
  - name: web
    params:
      maxResults: 5
      
  # Folder-specific context
  - name: folder
    params:
      folders:
        - path: ~/workspace/research
          title: Research Project
          
  # Recent Git changes
  - name: diff
    params:
      maxLines: 100
```

### Model-Specific Configurations

**Different Models for Different Tasks:**

```yaml
models:
  # Chat: Use smart, slower model
  - title: Chat Model
    provider: ollama
    model: deepseek-coder-v2
    temperature: 0.3  # More focused
    
  # Autocomplete: Use fast, smaller model  
  - title: Autocomplete Model
    provider: ollama
    model: qwen2.5-coder:1.5b
    temperature: 0.2  # Very focused
    maxTokens: 200    # Short completions
    
  # Code review: Use reasoning model
  - title: Review Model
    provider: ollama
    model: deepseek-r1:8b
    temperature: 0.1  # Precise
    
  # Documentation: Use creative model
  - title: Docs Model
    provider: ollama
    model: qwen3:8b
    temperature: 0.7  # More creative explanations

defaultModel: Chat Model

tabAutocompleteModel: Autocomplete Model

# Override model for specific slash commands
slashCommands:
  - name: review
    description: Code review
    model: Review Model
    prompt: "Perform detailed code review..."
```

---

## Cost Optimization Strategies

### Strategy 1: Free-Only Configuration

**100% Free Setup (No API costs ever):**

```yaml
models:
  # All Ollama (local, free)
  - title: Coding
    provider: ollama
    model: deepseek-coder-v2
    
  - title: Fast
    provider: ollama
    model: qwen2.5-coder:7b
    
  - title: Reasoning
    provider: ollama
    model: deepseek-r1:8b

defaultModel: Coding
tabAutocompleteModel:
  provider: ollama
  model: qwen2.5-coder:1.5b  # Even faster

embeddingsProvider:
  provider: ollama
  model: nomic-embed-text  # Free embeddings

# No API keys needed!
```

**Monthly Cost:** $0  
**Privacy:** 100% local  
**Offline:** Works without internet

### Strategy 2: Freemium Hybrid

**Use free cloud tiers as backup:**

```yaml
models:
  # Primary: Local (95% usage)
  - title: Local Coder
    provider: ollama
    model: deepseek-coder-v2
    
  # Fallback: Groq Free Tier (4% usage for complex tasks)
  - title: Groq Llama 70B
    provider: groq
    model: llama-3.1-70b-versatile
    apiKey: ${GROQ_API_KEY}
    # 14,400 requests/day FREE!
    
  # Emergency: GitHub Models (1% usage for latest features)
  - title: GitHub GPT-4o-mini
    provider: free-trial  # Continue built-in
    model: gpt-4o-mini
    # 15,000 requests/month FREE!
```

**Expected Monthly Cost:** $0  
**Capabilities:** Local + cloud when needed  
**Rate Limits:**Reasonable for personal use

### Strategy 3: Cost-Efficient Paid

**Minimal paid usage for maximum value:**

```yaml
models:
  # 90% usage: Local (free)
  - title: Local Primary
    provider: ollama
    model: deepseek-coder-v2
    
  # 9% usage: Ultra-cheap cloud (when local not enough)
  - title: Gemini Flash
    provider: gemini
    model: gemini-1.5-flash
    apiKey: ${GOOGLE_API_KEY}
    # Only $0.075/1M tokens!
    
  # 1% usage: Premium (complex reasoning only)
  - title: Premium Reasoning
    provider: anthropic
    model: claude-3-haiku-20240307
    apiKey: ${ANTHROPIC_API_KEY}
    # $0.25/1M tokens
```

**Expected Monthly Cost:** $2-5  
**Use Cases:** Handles everything including complex tasks

### Cost Tracking

**Monitor Your Usage:**

Create a simple tracking script:

```python
# track_usage.py
import json
from datetime import datetime

class ContinueUsageTracker:
    def __init__(self):
        self.usage_file = "~/.continue_usage.json"
        
    def log_request(self, model, tokens_in, tokens_out):
        costs = {
            "deepseek-coder-v2": 0,  # Local, free
            "qwen2.5-coder:7b": 0,    # Local, free
            "gemini-1.5-flash": (0.075 / 1_000_000),  # $0.075/1M
            "claude-3-haiku": (0.25 / 1_000_000),     # $0.25/1M
        }
        
        input_cost = tokens_in * costs.get(model, 0)
        output_cost = tokens_out * costs.get(model, 0) * 4  # Output typically 4x
        total_cost = input_cost + output_cost
        
        # Log to file
        usage = {
            "timestamp": datetime.now().isoformat(),
            "model": model,
            "tokens_in": tokens_in,
            "tokens_out": tokens_out,
            "cost_usd": total_cost
        }
        
        # Append to usage file
        with open(self.usage_file, 'a') as f:
            f.write(json.dumps(usage) + '\n')
            
    def get_monthly_cost(self):
        # Calculate total monthly cost
        total = 0.0
        # ... implementation
        return total

# Usage
tracker = ContinueUsageTracker()
print(f"This month's cost: ${tracker.get_monthly_cost():.2f}")
```

---

## Integration & Workflows

### Integration with Git

**Git-Aware Features:**

Continue automatically:
- Sees recent Git changes
- Understands Git diff
- References uncommitted changes

**Use in Chat:**

```
You: @diff Explain the changes I just made

Continue: [Analyzes Git diff and explains your recent changes]

You: @diff Generate a commit message for these changes

Continue: 
Suggested commit message:

feat: Add user authentication with JWT

- Implement login endpoint with email/password
- Add JWT token generation and validation
- Create middleware for protected routes
- Add password hashing with bcrypt
- Include unit tests for auth functions
```

**Pre-Commit Review:**

```bash
# Before committing
# Select all changed files in VSCode
# Cmd+L in Continue:

You: @diff Review all changes for issues before I commit

Continue: [Reviews all your changes, finds potential bugs]
```

### Integration with VS Code Tasks

**Automate with Continue:**

Create `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Continue: Generate Tests",
      "type": "shell",
      "command": "echo 'Select code and use /test in Continue.dev'",
      "problemMatcher": []
    },
    {
      "label": "Continue: Code Review",
      "type": "shell",
      "command": "echo 'Select code and use /review in Continue.dev'",
      "problemMatcher": []
    }
  ]
}
```

### Integration with Testing Frameworks

**Automated Test Generation Workflow:**

1. Write function
2. Press `Cmd+I`
3. Type: `/test`
4. Continue generates tests
5. Run `pytest` to verify

**Example flow:**

```python
# 1. Write function
def process_payment(amount, currency):
    # implementation
    pass

# 2. Cmd+I → /test
# 3. Continue generates comprehensive tests
# 4. Run tests
```

```bash
$ pytest test_payment.py -v

test_process_payment_valid_amount PASSED
test_process_payment_invalid_currency PASSED
test_process_payment_negative_amount PASSED
test_process_payment_zero_amount PASSED
test_process_payment_large_amount PASSED

5 passed in 0.12s
```

**Cost:** $0 with local models  
**Time Saved:** 20-30 min per module

---

## Best Practices

### 1. Effective Prompting

**❌ Vague:**
```
Make this better
```

**✅ Specific:**
```
Refactor this function to:
1. Use type hints
2. Add input validation
3. Improve error messages
4. Add logging
5. Optimize for lists >1000 items
```

**❌ Too Broad:**
```
Build a web app
```

**✅ Focused:**
```
Create a FastAPI endpoint for user registration that:
- Accepts email and password
- Validates email format
- Hashes password with bcrypt
- Returns JWT token
- Includes error handling
```

### 2. Use Context Effectively

**Always provide context:**

```python
# ❌ Without context
You: Fix the bug

# ✅ With context
You: @code UserService @problems The login function throws AttributeError when user doesn't exist. Fix with proper null checking.
```

**Use multiple context providers:**

```
You: @codebase @docs fastapi @web latest fastapi best practices

Please refactor our API endpoints following current best practices
```

### 3. Iterative Refinement

**Don't expect perfect first try:**

```
You: Create a function to process CSV files

Continue: [Generates basic CSV reader]

You: Add error handling for:
- File not found
- Invalid CSV format
- Missing columns
- Encoding errors

Continue: [Adds comprehensive error handling]

You: Now add progress tracking and logging

Continue: [Enhances with progress bar and logging]
```

### 4. Review AI Code

**Always review before accepting:**

```python
# Continue suggests:
def delete_all_users():
    User.query.delete()
    db.commit()

# ❌ This is dangerous! No confirmation, no backup

# Cmd+I: "Add safeguards - require confirmation and create backup"

# ✅ Continue adds safety measures
```

### 5. Model Selection Strategy

**Match model to task:**

| Task | Model Choice | Reason |
|------|--------------|--------|
| Autocomplete | qwen2.5-coder:1.5b | Fastest, smallest |
| Chat/questions | deepseek-coder-v2 | Best balance |
| Complex reasoning | deepseek-r1:8b | Dedicated reasoning |
| Code review | deepseek-r1:8b | Thorough analysis |
| Documentation | qwen3:8b | Clear explanations |
| Quick answers | llama3:8b | Very fast |

**Don't use:**
- Large models (70B+) for autocomplete (too slow)
- General models (GPT-4) for coding (not specialized)
- Tiny models (<1B) for complex tasks (not capable)

---

## Troubleshooting

### Common Issues & Solutions

**1. Autocomplete Not Working**

```bash
# Check Ollama is running
ollama serve

# Verify model exists
ollama list | grep qwen2.5-coder

# Check Continue config
cat ~/.continue/config.yaml | grep tabAutocompleteModel

# Restart VSCode
# Cmd+Shift+P → "Reload Window"
```

**2. Slow Responses**

```yaml
# Use smaller/faster models
tabAutocompleteModel:
  provider: ollama
  model: qwen2.5-coder:1.5b  # Not 7b or 8b!
  
# Reduce max tokens
  maxTokens: 200  # Not 2000
```

**3. Out of Memory (OOM)**

```bash
# M1 Pro 16GB can handle 7-8B models comfortably
# But not multiple large models simultaneously

# Solution: Use one model at a time
# Or use smaller quantized versions:
ollama pull qwen2.5-coder:7b-q4  # Quantized, uses less RAM
```

**4. Continue Not Seeing Ollama Models**

```yaml
# Explicitly configure Ollama endpoint
models:
  - title: DeepSeek Coder
    provider: ollama
    model: deepseek-coder-v2
    apiBase: http://localhost:11434  # Explicit endpoint
```

**5. Context Not Working**

```bash
# Rebuild codebase index
# In Continue panel: Settings → Rebuild Index

# Or delete and recreate:
rm -rf ~/.continue/index/
# Continue will rebuild automatically
```

**6. API Key Errors (Paid Models)**

```bash
# Verify environment variable
echo $OPENAI_API_KEY

# Add to ~/.zshrc if missing
echo 'export OPENAI_API_KEY="sk-..."' >> ~/.zshrc
source ~/.zshrc

# Restart VSCode
```

---

## Quick Reference

### Keyboard Shortcuts

| Action | macOS | Windows/Linux |
|--------|-------|---------------|
| Open Chat | `Cmd + L` | `Ctrl + L` |
| Inline Edit | `Cmd + I` | `Ctrl + I` |
| Multi-file Edit | `Cmd + Shift + I` | `Ctrl + Shift + I` |
| Accept Autocomplete | `Tab` | `Tab` |
| Reject Autocomplete | `Esc` | `Esc` |
| Accept Inline Diff | `Cmd + Enter` | `Ctrl + Enter` |
| Reject Inline Diff | `Cmd + Backspace` | `Ctrl + Backspace` |

### Context Providers Quick Reference

| Provider | Usage | Example |
|----------|-------|---------|
| `@code` | Reference function/class | `@code UserService.login` |
| `@docs` | Search documentation | `@docs fastapi routing` |
| `@web` | Search internet | `@web latest python best practices` |
| `@codebase` | Search project | `@codebase database connection` |
| `@folder` | Reference folder | `@folder src/models` |
| `@problems` | Include errors | `@problems explain` |
| `@terminal` | Terminal output | `@terminal last command output` |
| `@diff` | Git changes | `@diff review` |

### Configuration Files

| File | Location | Purpose |
|------|----------|---------|
| `config.yaml` | `~/.continue/` | Main configuration |
| `.continuerules` | Project root | Project-specific rules |
| `.continueignore` | Project root | Exclude from indexing |

---

## Conclusion

**Continue.dev delivers:**  
✅ **100% Free** option with local models  
✅ **Privacy-first** with local-only mode  
✅ **Model freedom** - Choose any AI model  
✅ **Professional features** - Chat, autocomplete, inline editing  
✅ **Highly customizable** - `config.yaml` for everything  

**Your Current Setup:**  
✅ Continue.dev installed  
✅ 7 Ollama models ready  
✅ Config file present (`~/.continue/config.yaml`)  
✅ M1 Pro optimized  

**Recommended Next Steps:**
1. Test autocomplete with `Tab` in any code file
2. Try chat with `Cmd + L`
3. Experiment with `Cmd + I` inline editing
4. Configure `.continuerules` for your projects
5. Set up `/test` and `/review` slash commands

**Expected Value:**  
💰 **Save $120-240/year** vs paid alternatives  
⏱️ **Save 2-4 hours/week** in development time  
🔒 **100% private** - your code stays local  
🚀 **Unlimited usage** - no rate limits  

---

**Document Version:** 2.0  
**Platform:** macOS M1 Pro  
**Last Updated:** December 2024  
**Cost to Follow This Guide:** $0

**You're now ready to use Continue.dev like a pro with zero recurring costs!** 🎉
