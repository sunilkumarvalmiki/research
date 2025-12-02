# Production-Grade PRD Generation Prompt

## Overview
This prompt guides the AI to act as a complete product team (Product Owner, Tech Lead, QA, etc.) to generate a detailed, industry-standard Product Requirements Document (PRD). It ensures all aspects of product development, from user stories to technical architecture and risk mitigation, are covered.

## Prompt Template

```markdown
# Role & Objective
Assume the role of **each stakeholder** involved in the comprehensive product development lifecycle (Product Manager, Tech Lead, UX Designer, QA Engineer, DevOps). Engage in a thorough process of analyzing, debating, and optimizing the proposed idea.

Your objective is to produce a high-quality **Product Requirements Document (PRD)** that meets industry standards and is suitable for integration into any AI development tool.

**Project Context**:
{{PROJECT_CONTEXT_AND_REQUIREMENTS}}

---

## PRD Structure Requirements

Generate the PRD with the following structure. Ensure explicit, machine-friendly formatting.

### 1. Executive Summary
- High-level overview of the product/feature.
- Core value proposition.

### 2. Stakeholders
- List of roles and responsibilities (e.g., Product Owner, Tech Lead).

### 3. Goals and Objectives
- **Business Goals**: Revenue, market share, etc.
- **User Goals**: Efficiency, satisfaction, etc.
- **Technical Goals**: Performance, scalability, security.

### 4. Assumptions and Constraints
- **Assumptions**: User behavior, market conditions.
- **Constraints**: Budget, timeline, technical limitations, compliance.

### 5. Detailed Requirements (Functional)
- **User Stories**: "As a [user], I want to [action], so that [benefit]."
- **Acceptance Criteria**: Gherkin syntax (Given/When/Then) or bulleted lists.
- **Prioritization**: MoSCoW (Must have, Should have, Could have, Won't have).

### 6. Detailed Requirements (Non-Functional)
- **Performance**: Latency, throughput, load times.
- **Scalability**: Concurrent users, data volume.
- **Reliability**: Availability (e.g., 99.9%), recovery time.
- **Security**: Auth, encryption, compliance (GDPR/CCPA).
- **Usability**: Accessibility standards (WCAG).

### 7. Architecture Design
- **High-Level Architecture**: Components, services, interactions.
- **Tech Stack**: Frontend, Backend, Database, Infrastructure.
- **Data Flow**: How data moves through the system.

### 8. UX & UI Requirements
- **User Flows**: Step-by-step journey.
- **Wireframe Descriptions**: Layouts and key elements.
- **Design System**: Colors, typography, components.

### 9. API Requirements
- **Endpoints**: Paths, methods (GET, POST, etc.).
- **Request/Response**: JSON schemas, headers.
- **Authentication**: Token flows (OAuth, JWT).

### 10. Data Requirements
- **Data Model**: Entities, attributes, relationships (ERD description).
- **Data Privacy**: PII handling, retention policies.

### 11. AI/ML Requirements (If Applicable)
- **Model Purpose**: What problem is AI solving?
- **Input/Output**: Data formats.
- **Training/Inference**: Methodologies, latency constraints.
- **Safety**: Hallucination prevention, guardrails.

### 12. Success Metrics
- **North Star Metric**: The primary measure of success.
- **KPIs**: Customer, Business, and Technical metrics.

### 13. Release Plan
- **MVP Definition**: Minimal feature set for launch.
- **Phases**: Roadmap for future iterations.
- **Launch Criteria**: What must be true to go live.

### 14. Analytics & Telemetry
- **Events to Capture**: User actions, system states.
- **Dashboards**: Key visualizations needed.

### 15. Risks & Mitigation Plan
- **Risk**: Potential issue.
- **Severity/Likelihood**: High/Medium/Low.
- **Mitigation**: Strategy to avoid or minimize impact.

### 16. Testing Strategy
- **Unit/Integration**: Code-level testing.
- **E2E/UI**: User flow validation.
- **Performance/Security**: Load testing, pen testing.

---

## Output Instructions
1. **Tone**: Professional, technical, and concise.
2. **Format**: Markdown with clear headers and bullet points.
3. **Completeness**: Do not leave sections empty; use "N/A" with a reason if not applicable.
4. **Clarity**: Avoid jargon where simple language suffices; define terms in a Glossary if needed.
```

## Usage Instructions
1. Provide the `{{PROJECT_CONTEXT_AND_REQUIREMENTS}}` with as much detail as possible (rough notes, emails, brain dumps).
2. Run the prompt.
3. Review the generated PRD.
4. Use the **Iterative Validation Loop** to refine specific sections (e.g., "Refine the API requirements section to include specific error codes").

## Integration
- Use the output of this prompt as the input for the **Implementation Plan** creation.
- Use the **UI/UX Research Prompt** output to populate the "UX & UI Requirements" section.
