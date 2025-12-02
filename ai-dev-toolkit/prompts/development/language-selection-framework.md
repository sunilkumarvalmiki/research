# Language Selection Framework

## Overview
A systematic framework for choosing the most appropriate programming language(s) for a project, avoiding the default-to-Python trap. This ensures language selection is based on actual project requirements rather than familiarity.

## Problem This Solves
Many AI tools default to Python for all problems, even when other languages would be more suitable. This framework enforces explicit evaluation of multiple languages before making a decision.

## The Framework

### 1. Task Definition

```
You will receive a problem description:
**Problem Description**: {{PROBLEM_DESCRIPTION}}

Your job is to:
1. Understand the problem and its constraints
2. Evaluate multiple suitable programming languages
3. Compare and rank them for this specific use case
4. Choose the most appropriate language(s) and justify the choice
5. Only then, produce code and detailed guidance in the chosen language(s)
```

### 2. Hard Rules (Non-Negotiable)

1. **Do not default to Python**
   - You must explicitly consider multiple languages before picking any one language
   - You must treat Python as one candidate among many, not the default

2. **Use Python only when truly justified**
   - Use Python only if your comparison and ranking clearly shows Python is the best choice for this exact problem and constraints
   - If Python is not ranked #1, you must not use Python for the main solution

3. **Check for alternative languages**
   - Assume by default that the solution can be implemented in multiple languages (C, C++, Rust, Go, Java, Kotlin, TypeScript/Node.js, C#, etc.)
   - If you have internet access: Search the web to confirm which languages are commonly used for this kind of problem
   - If no internet access: Explicitly state that you are relying on internal knowledge without live web verification

4. **Explain your reasoning clearly**
   - Show reasoning step-by-step for:
     - How you understood the problem
     - How you selected candidate languages
     - How you ranked them
     - Why you chose the final language(s)
   - Do not skip directly to code

5. **If multiple components exist, you may choose multiple languages**
   - Example: backend API in Go, data pipeline in Rust, frontend in TypeScript/React
   - Clearly explain which language is used for which component and why

### 3. Language Selection Process

#### 3.1 Identify Candidate Languages

Create a list of at least 3–5 reasonable candidate languages for this problem.

Consider languages from different categories:
- **Systems / high-performance**: C, C++, Rust
- **Backend / services**: Go, Java, Kotlin, C#, Rust
- **Scripting / glue / automation**: Python, JavaScript/TypeScript (Node.js), Ruby
- **Frontend / UI**: TypeScript/JavaScript (React, Vue, Angular, Svelte)
- **Data / analytics**: Python, R, Julia, Rust
- **Others as appropriate for the domain**

#### 3.2 Define Evaluation Criteria

For this specific problem, evaluate each language using these criteria (adapt as needed):

- **Runtime performance**: latency, throughput, memory usage
- **Developer productivity**: speed of development, simplicity
- **Ecosystem & libraries**: maturity and availability of libraries/frameworks for this use case
- **Maintainability & readability**: long-term code health, clarity
- **Tooling & debugging**: IDE support, debuggers, profilers, linters
- **Reliability & safety**: type system, memory safety, error handling
- **Concurrency & scalability**: if applicable for this problem
- **Interoperability**: integration with other systems/languages in the stack
- **Deployment & hosting**: ease of running in containers, cloud, serverless
- **Team skill assumptions**: if user mentions preferred or known languages, factor that in

#### 3.3 Build a Comparison Table

Produce a small table where rows = languages and columns = criteria. Include short notes, not essays.

**Example:**

| Language | Performance | Ecosystem | Dev Speed | Safety | Concurrency | Deployment | Notes |
|----------|-------------|-----------|-----------|--------|-------------|------------|-------|
| Rust | Very high | Good | Medium | Strong | Strong | Good | Great for low-latency, safe systems |
| Go | High | Very good | High | Good | Strong | Excellent | Simple, great for web services |
| Python | Medium/low | Excellent | Very high | Medium | Limited | Good | Fast to prototype, slower runtime |
| TypeScript | Medium | Excellent | High | Good | Good | Excellent | Best for full-stack web, Node.js |

*Adjust based on your specific problem*

#### 3.4 Rank the Languages

For this specific use case, provide a ranked list:

**Language Ranking for This Problem**
1. **Language A** – [justification based on criteria]
2. **Language B** – [justification based on criteria]
3. **Language C** – [justification based on criteria]

Make sure the ranking is based on the actual problem, not on general popularity.

#### 3.5 Choose the Final Language(s)

From the ranking:
- Pick the top 1–2 languages and explicitly justify:
  - Why they are best for this exact problem
  - Why you are not choosing the others
- After choosing: Lock in the language(s) and use them consistently

**Python-specific rule**: If Python is not ranked #1, you must not pick Python as the primary implementation language. If Python is ranked #1, explicitly state why (e.g., heavy ML usage, fastest iteration, existing Python ecosystem).

### 4. Implementation Guidelines

Once the language(s) are chosen, then and only then:

1. **High-level design first**
   - Show the architecture
   - Show modules/components
   - Explain data flow and major responsibilities

2. **Then code**
   - Provide well-structured, production-oriented examples, not toy snippets
   - Include:
     - Project structure (folders, files)
     - Core code examples
     - Important config (build tools, package managers, Dockerfile outline)
   - Write idiomatic code following best practices for that language

3. **Performance & scalability notes**
   - Explain how the chosen language and design will handle:
     - Expected load
     - Scaling (horizontal/vertical)
     - Performance optimizations where relevant

4. **Testing & CI/CD**
   - Recommend testing strategies and libraries for this language
   - Outline how this code can be integrated into CI/CD pipelines
   - Mention static analysis / linters / formatters for that language

### 5. Web Research Requirement (If Available)

If the AI system has web access:
1. Search for real-world usage of this problem type in different languages
   - Example: "high performance REST API in Rust vs Go", "ML serving in Python vs Java"
2. Use findings to:
   - Validate your language choices
   - Reference common patterns, frameworks, or well-known tools
3. If research contradicts your initial ranking, update your ranking and explain the change

If web access is not available, explicitly state:
> "Web access is not available. I am using my internal knowledge without live verification."

### 6. Output Format

Always structure your response in this order:

1. **Problem Understanding**
   - Short summary of what needs to be built

2. **Candidate Languages & Criteria**
   - List of languages considered
   - The evaluation criteria used

3. **Comparison Table**
   - A compact table comparing languages

4. **Ranking & Final Choice**
   - Ranked list
   - Explanation of the final chosen language(s)
   - Explicit mention of why Python is or is not chosen

5. **High-Level Design**
   - Architecture
   - Components/modules

6. **Implementation in Chosen Language(s)**
   - Project structure
   - Code examples
   - Important configs

7. **Performance, Testing, and Deployment Notes**
   - Optimization ideas
   - Testing strategies
   - CI/CD and deployment guidance

## Usage Examples

### Example 1: High-Performance API

```
Problem: Build a REST API that handles 10,000 requests/second with <50ms latency

[Apply framework]

Expected outcome:
- Go or Rust ranked #1
- Python explicitly ruled out due to performance requirements
- Detailed justification with benchmarks
```

### Example 2: Data Science Pipeline

```
Problem: Build ML model training pipeline with extensive data preprocessing

[Apply framework]

Expected outcome:
- Python likely ranked #1 due to ecosystem (pandas, scikit-learn, PyTorch)
- Explicit justification: "Python ranked #1 because..."
- Alternative languages considered and ruled out with reasons
```

### Example 3: Full-Stack Application

```
Problem: Build a web application with real-time features

[Apply framework]

Expected outcome:
- Multiple languages chosen: TypeScript (frontend + Node.js backend), possibly Go or Rust for performance-critical services
- Clear component-to-language mapping
- Justification for each choice
```

## Integration with Other Tools

### For Continue.dev
Add to custom instructions:
```
Always apply the language selection framework before generating code.
Never default to Python without explicit comparison.
```

### For GitHub Copilot
Use in comments:
```
// Language selection: Compare Go, Rust, and Python for this API
// Justify the choice based on performance, ecosystem, and maintainability
```

### For Antigravity
Use as a workflow (see `.agent/workflows/language-selection.md`)

## Common Mistakes to Avoid

- ❌ Skipping the comparison table
- ❌ Not considering at least 3-5 languages
- ❌ Defaulting to Python "because it's easy to start"
- ❌ Not documenting why other languages were ruled out
- ❌ Ignoring performance requirements in favor of familiarity
- ❌ Not considering the team's existing skills

## Benefits

✅ **Better technology decisions**: Choose languages based on requirements, not defaults
✅ **Clearer justification**: Document why a language was chosen
✅ **Avoid technical debt**: Prevent choosing wrong languages that require rewrites later
✅ **Learning opportunity**: Exposure to multiple languages and their trade-offs
✅ **Production-ready**: Consider real-world factors like deployment and maintenance

## Customization

Adapt this framework by:
- Adding domain-specific criteria (e.g., mobile development, embedded systems)
- Adjusting the number of languages evaluated
- Including additional evaluation dimensions (licensing, community support, hiring pool)
- Tailoring for specific organizational constraints
