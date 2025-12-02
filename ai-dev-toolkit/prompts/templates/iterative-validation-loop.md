# Iterative Validation Loop Prompt

## Overview
This prompt template enforces iterative refinement with validation checkpoints to ensure consistent, high-quality output. Use this for any task requiring multiple iterations until desired quality is achieved.

## Prompt Template

```
Iteratively execute the loop until the desired output is consistently achieved, ensuring that each iteration brings measurable improvements or meets the predefined success criteria.

### 1. Validation of Criteria
- Thoroughly verify that all the previously outlined criteria are fully met and valid
- Implement checkpoints to regularly assess adherence to these criteria throughout the process
- Document which criteria are met and which require further work

### 2. Grammatical and Spelling Review
- Conduct a meticulous review for any grammatical or spelling errors
- If errors are identified, promptly rewrite the affected sections to ensure grammatical correctness and clarity
- Use automated tools where available to catch subtle errors

### 3. Optimization Without Compromising Goals
- Evaluate the current output to identify potential areas for optimization
- Apply optimization techniques cautiously to enhance performance or clarity without disturbing the core objectives or altering the intended outcome
- Ensure each optimization maintains alignment with fundamental goals

### 4. Adherence to Best Practices
- Consistently follow industry-standard best practices relevant to the task
- Stay updated with the latest methodologies and incorporate them where applicable to improve overall efficiency and effectiveness
- Document which best practices are being applied and why

### 5. Iteration Tracking
- After each iteration, summarize:
  - What was improved
  - What criteria are now met
  - What still needs work
  - Estimated iterations remaining
- Continue iterating until all success criteria are met
```

## Usage Examples

### Example 1: Code Review
```
Using the iterative validation loop, review the following code:
[CODE HERE]

Success criteria:
- No linting errors
- All functions have docstrings
- Test coverage > 80%
- Performance benchmarks met
- Security best practices followed
```

### Example 2: Document Writing
```
Using the iterative validation loop, create a PRD for:
[PROJECT DESCRIPTION]

Success criteria:
- All 20 PRD sections complete
- Technical requirements clearly specified
- User stories have acceptance criteria
- No grammatical errors
- Stakeholder requirements addressed
```

### Example 3: UI/UX Design
```
Using the iterative validation loop, design a dashboard that:
[REQUIREMENTS]

Success criteria:
- Mobile, tablet, desktop wireframes complete
- Accessibility standards met (WCAG 2.1 AA)
- Design system tokens defined
- User flows documented
- Performance considerations addressed
```

## Best Practices

1. **Define Clear Success Criteria**: Before starting, establish measurable, specific criteria
2. **Track Progress**: Document what improves in each iteration
3. **Set Iteration Limits**: Define max iterations to prevent infinite loops
4. **Validate Incrementally**: Check criteria after each change, not just at the end
5. **Document Decisions**: Record why certain optimizations were or weren't applied

## Integration with Other Prompts

This validation loop can be combined with:
- [Language Selection Framework](../development/language-selection-framework.md)
- [PRD Generation Prompt](./prd-generation-prompt.md)
- [UI/UX Research Prompt](../ui-ux/ui-ux-research-prompt.md)
- [Test Scenario Generation](../testing/test-scenario-generation.md)

Simply append the iteration loop requirements to any of these prompts for enhanced quality control.

## Common Pitfalls

- ❌ **Not defining concrete success criteria**: Vague criteria lead to endless iterations
- ❌ **Over-optimizing**: Changing things that already work well
- ❌ **Ignoring best practices**: Skipping industry standards in favor of quick fixes
- ❌ **Not tracking iterations**: Losing sight of what's been tried and why

## Customization

Adjust this template by:
- Adding domain-specific criteria (e.g., security checks for backend, accessibility for frontend)
- Modifying validation checkpoints based on your workflow
- Integrating automated validation tools (linters, spell checkers, test runners)
- Setting iteration limits based on project timeline
