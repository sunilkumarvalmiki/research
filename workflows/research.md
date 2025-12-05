# Research Workflow

## Overview

Structured approach to conducting technical research and documenting findings.

## Use Cases

- Evaluating new technologies
- Comparing framework options
- Investigating best practices
- Prototyping proof-of-concepts
- Performance analysis

## Workflow Steps

### 1. Define Research Question

#### 1.1 Clearly State Question

Example questions:
- "Which database is best for our use case?"
- "How can we improve API response time?"
- "What's the best approach to implement feature X?"

#### 1.2 Define Success Criteria

- What answers are we looking for?
- How will we measure success?
- What's our decision framework?

### 2. Gather Information

#### 2.1 Literature Review

- Official documentation
- Technical blogs and articles
- Academic papers
- GitHub repositories
- Stack Overflow discussions

#### 2.2 Expert Consultation

- Talk to colleagues
- Reach out to community experts
- Attend conferences/meetups
- Join relevant forums

**Agent**: `market-researcher` can help gather information

### 3. Hands-On Experimentation

#### 3.1 Create Prototype

```bash
mkdir research-{topic}
cd research-{topic}
# Set up minimal environment
```

#### 3.2 Test Scenarios

Design experiments to answer specific questions:

```python
# Example: Database performance comparison
def benchmark_query_performance():
    databases = ["PostgreSQL", "MongoDB", "Redis"]
    for db in databases:
        time = measure_query_time(db)
        log_result(db, time)
```

#### 3.3 Collect Data

- Performance metrics
- Resource usage
- Developer experience notes
- Edge case behavior

### 4. Document Findings

#### 4.1 Create Research Document

```markdown
# Research: {Topic}

## Objective
{What we're trying to learn}

## Methodology
{How we conducted research}

## Findings

### Option 1: {Technology A}
- **Pros**: 
- **Cons**: 
- **Performance**: 
- **Use Cases**: 

### Option 2: {Technology B}
...

## Comparison Matrix

| Criteria | Option A | Option B | Option C |
|----------|----------|----------|----------|
| Performance | ★★★★☆ | ★★★☆☆ | ★★★★★ |
| Learning Curve | Easy | Medium | Hard |
| Community | Large | Medium | Small |

## Recommendation

{What we recommend and why}

## Next Steps

{What to do with this research}
```

#### 4.2 Include Code Examples

```python
# Example implementations
# Benchmarks
# Configuration samples
```

#### 4.3 Add References

- Links to documentation
- Blog posts consulted
- Code repositories
- Discussions

### 5. Share and Discuss

#### 5.1 Create PR

Add research document to this repository:

```bash
git checkout -b research/{topic}
# Add document to appropriate directory
git commit -m "docs: add research on {topic}"
git push origin research/{topic}
```

#### 5.2 Present Findings

- Team meeting presentation
- Written summary
- Demo of prototype

#### 5.3 Gather Feedback

- What did we miss?
- Alternative perspectives?
- Additional concerns?

### 6. Make Decision

#### 6.1 Decision Document

If research leads to a decision:

```markdown
# ADR-{number}: {Decision}

## Status
Accepted

## Context
{What we learned from research}

## Decision
{What we're choosing}

## Consequences
{Implications of this choice}
```

#### 6.2 Create Implementation Plan

- Timeline
- Resources needed
- Migration strategy (if applicable)
- Training requirements

### 7. Archive Research

#### 7.1 Update Research Repository

Ensure findings are accessible:

- Clear organization
- Tagged appropriately
- Cross-referenced with related research

#### 7.2 Create Artifact Catalog

Document prototypes and benchmarks:

```yaml
research:
  topic: "Database Selection"
  date: "2024-12-05"
  artifacts:
    - "benchmarks/db-performance.py"
    - "prototypes/mongodb-example/"
    - "reports/database-comparison.md"
  outcome: "Selected PostgreSQL"
```

## Research Templates

### Technology Evaluation

```markdown
# Technology: {Name}

## Overview
Brief description

## Evaluation Criteria

### 1. Functional Requirements
- [ ] Meets requirement A
- [ ] Meets requirement B

### 2. Non-Functional Requirements
- Performance: {Assessment}
- Scalability: {Assessment}
- Security: {Assessment}

### 3. Developer Experience
- Learning curve: {Easy/Medium/Hard}
- Documentation quality: {Rating}
- Community size: {Assessment}

### 4. Operational Concerns
- Deployment complexity: {Assessment}
- Monitoring capabilities: {Assessment}
- Maintenance burden: {Assessment}

## Recommendation
{Go / No-Go / Further Investigation}
```

### Performance Study

```markdown
# Performance Study: {Topic}

## Methodology
- Test environment
- Load patterns
- Metrics collected

## Results

### Baseline
- Metric 1: X
- Metric 2: Y

### After Optimization
- Metric 1: X + 50%
- Metric 2: Y - 30%

## Conclusion
{What we learned}
```

## Tips for Effective Research

1. **Be Objective**: Avoid confirmation bias
2. **Be Thorough**: Cover all relevant options
3. **Be Practical**: Test in realistic scenarios
4. **Be Clear**: Document findings clearly
5. **Be Timely**: Set time limits for research
6. **Be Collaborative**: Involve team members

## Common Pitfalls

- **Analysis Paralysis**: Don't research forever, set deadline
- **Ignoring Constraints**: Consider real-world limitations
- **Incomplete Testing**: Test edge cases and failure modes
- **Poor Documentation**: Document as you go, not after
- **No Follow-Up**: Ensure research leads to action

## Related

- [Frameworks Research](../frameworks/README.md)
- [Market Researcher Agent](../agents/ideation/market-researcher.yaml)
- [Feasibility Assessor Agent](../agents/ideation/feasibility-assessor.yaml)
