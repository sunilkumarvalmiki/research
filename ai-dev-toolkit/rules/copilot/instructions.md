# GitHub Copilot Instructions

## Overview
These instructions help you get the most out of GitHub Copilot by establishing a "contract" of expectations through comments and context.

## 1. The "Context Header" Pattern
Start every file or major component with a context header to ground Copilot.

```javascript
/**
 * Component: UserProfileCard
 * Purpose: Displays user details and actions.
 * State: Read-only view with "Edit" toggle.
 * Styling: Tailwind CSS, Dark Mode compatible.
 * Accessibility: ARIA labels required for all buttons.
 */
```

## 2. The "Step-by-Step" Commenting
Don't ask for the whole function at once. Guide Copilot line by line for complex logic.

```python
def calculate_risk_score(user_data):
    # 1. Validate input data schema
    # ... (Copilot fills this)
    
    # 2. Calculate base score from credit history
    # ...
    
    # 3. Apply penalties for recent missed payments
    # ...
    
    # 4. Normalize score to 0-100 range
    # ...
    
    # 5. Return detailed result object
    # ...
```

## 3. Explicit Constraints (The "No Python" Rule)
If you are in a polyglot environment, be explicit.

```rust
// IMPLEMENTATION: Rust
// CONSTRAINT: No unwrap(), use proper error propagation (Result<T, E>)
// PERFORMANCE: Avoid cloning strings, use references where possible
```

## 4. Test Generation
Write the test name to prompt the test body.

```typescript
// Test: Should throw ValidationError when email is invalid
it('should throw ValidationError when email is invalid', () => {
    // ... Copilot generates the test body
});
```

## 5. Documentation Generation
Type `/**` above a function to trigger JSDoc/Docstring generation.

```typescript
/**
 * @function retryRequest
 * @description Retries a failed HTTP request with exponential backoff.
 * @param {string} url - The URL to request.
 * ...
 */
```

## 6. Refactoring
Select code and use the Chat interface (Cmd+I / Ctrl+I) with specific instructions:

- "Refactor this to use async/await instead of callbacks."
- "Optimize this loop to avoid O(n^2) complexity."
- "Add error handling for network timeouts."
- "Convert this Python class to a Go struct and methods."

## Best Practices
- **Open Related Files**: Keep relevant files open in tabs so Copilot can see the context.
- **Be Specific**: "Fix bug" is bad. "Fix null pointer exception when user list is empty" is good.
- **Review**: Always review Copilot's code. It is a suggestion, not a command.
- **Security**: Watch out for hardcoded secrets or unsafe patterns (e.g., `eval()`).
