---
description: Automated code review and quality assurance workflow
---

# Code Review Workflow

This workflow performs a comprehensive code review focusing on quality, security, and performance.

## 1. Preparation
1. **Context Analysis**:
   - Identify the language and framework
   - Understand the purpose of the code changes

2. **Static Analysis**:
   - Check for syntax errors
   - Verify linting rules compliance

## 2. Deep Dive Review
1. **Logic & Correctness**:
   - Verify business logic implementation
   - Check for off-by-one errors, null pointer exceptions
   - Validate edge case handling

2. **Security Audit**:
   - Check for injection vulnerabilities (SQL, XSS)
   - Verify input sanitization and validation
   - Check for hardcoded secrets

3. **Performance Profiling**:
   - Identify O(n^2) or worse complexity
   - Check for memory leaks or inefficient resource usage
   - Verify database query optimization

4. **Maintainability**:
   - Check naming conventions (Variables, Functions)
   - Verify code modularity and DRY principles
   - Check comment quality and documentation

## 3. Testing Verification
1. **Test Coverage**:
   - Verify unit tests exist for new logic
   - Check for integration tests where appropriate

2. **Test Quality**:
   - Ensure tests cover positive, negative, and edge cases
   - Verify tests are deterministic and independent

## 4. Reporting
1. **Feedback Generation**:
   - Group issues by severity (Critical, Major, Minor)
   - Provide actionable suggestions and code snippets
   - Explain *why* a change is recommended

// turbo
2. **Refinement**:
   - If requested, apply the fixes directly
   - Re-run the review on the updated code
