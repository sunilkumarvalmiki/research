# Production-Grade PRD Generation Prompt (Updated 2025)

## Overview
This prompt guides the AI to act as a complete product team (Product Manager, Tech Lead, AI/ML Engineer, QA, DevOps, Security) to generate a detailed, industry-standard Product Requirements Document (PRD). Enhanced for 2025 with AI-specific requirements, modern evaluation metrics, and production deployment best practices.

## Prompt Template

```markdown
# Role & Objective
Assume the role of **each stakeholder** involved in the comprehensive product development lifecycle:
- Product Manager (strategy, requirements)
- Tech Lead (architecture, feasibility)
- AI/ML Engineer (model selection, evaluation)
- UX Designer (user experience)
- QA Engineer (testing, quality)
- DevOps Engineer (deployment, monitoring)
- Security Engineer (compliance, safety)

Engage in a thorough process of analyzing, debating, and optimizing the proposed idea.

Your objective is to produce a high-quality **Product Requirements Document (PRD)** that meets 2025 industry standards and is suitable for AI-powered products.

**Project Context**:
{{PROJECT_CONTEXT_AND_REQUIREMENTS}}

---

## PRD Structure Requirements

Generate the PRD with the following structure. Ensure explicit, machine-friendly formatting.

### 1. Executive Summary
- High-level overview of the product/feature
- Core value proposition
- Target users and market
- Success criteria (quantified)

### 2. Stakeholders
- List of roles and responsibilities
- Decision makers and approvers
- Communication plan

### 3. Goals and Objectives
- **Business Goals**: Revenue targets, market share, growth metrics
- **User Goals**: Efficiency gains, satisfaction scores, adoption rates
- **Technical Goals**: Performance SLAs, scalability targets, reliability
- **AI-Specific Goals**: Model accuracy, evaluation metrics, safety compliance

### 4. Assumptions and Constraints
- **Assumptions**: User behavior, market conditions, technology availability
- **Constraints**: Budget ($X/month), timeline (X weeks), technical limitations, compliance (GDPR, HIPAA, etc.)
- **Dependencies**: External services, third-party APIs, model providers

### 5. AI-Specific Requirements (NEW FOR 2025)

#### 5.1 Model Selection
- **Task Type**: Classification / Generation / Reasoning / Multimodal / RAG
- **Model Candidates**: 
  - Option 1: {{model_name}} - {{rationale}} - Cost: $X/1M tokens
  - Option 2: {{model_name}} - {{rationale}} - Cost: $Y/1M tokens
- **Hosting Strategy**: GitHub Models (free tier) / Microsoft Foundry / Local (Ollama) / Hybrid
- **Fallback Strategy**: What happens if primary model fails
- **Cost Constraints**: Budget per request, monthly cap, optimization strategy
- **Latency Requirements**: p50 / p95 / p99 targets (e.g., p95 < 2s)

#### 5.2 Prompt Engineering
- **System Prompt**: {{detailed_template}}
- **Few-Shot Examples**: {{example_1}}, {{example_2}}, {{example_3}}
- **Parameters**: 
  - Temperature: {{value}} (rationale: {{why}})
  - Top-p: {{value}}
  - Max Tokens: {{value}} (average: {{avg}})
  - Stop Sequences: {{list}}
- **Safety Guardrails**: 
  - Content filtering (categories and thresholds)
  - Prompt injection prevention
  - Output validation rules

#### 5.3 Evaluation Metrics
**Framework**: Azure AI Evaluation SDK (required for production)

**Agent Metrics** (using built-in evaluators):
- Task Adherence: Target ≥ 4.0/5.0 (TaskAdherenceEvaluator)
- Intent Resolution: Target ≥ 4.0/5.0 (IntentResolutionEvaluator)
- Tool Call Accuracy: Target ≥ 4.5/5.0 (ToolCallAccuracyEvaluator)

**Quality Metrics**:
- Coherence: Target ≥ 4.0/5.0 (CoherenceEvaluator)
- Fluency: Target ≥ 4.0/5.0 (FluencyEvaluator)
- Relevance: Target ≥ 4.0/5.0 (RelevanceEvaluator)

**RAG Metrics** (if applicable):
- Retrieval Quality: Target ≥ 4.0/5.0 (RetrievalEvaluator)
- Groundedness: Target ≥ 4.5/5.0 (GroundednessEvaluator)
- Response Completeness: Target ≥ 4.0/5.0 (ResponseCompletenessEvaluator)

**Safety Metrics**:
- Hallucination rate: Max 5% (custom evaluator)
- Harmful content: Max 0.1% (content safety filter)
- PII leakage: Max 0% (PII detection)
- Prompt injection success: Max 0% (security testing)

**Performance Metrics**:
- Latency p95: < {{X}}ms
- Throughput: > {{Y}} req/sec
- Cost per request: < ${{Z}}
- Token efficiency: < {{avg_tokens}} tokens/request

**Custom Business Metrics**:
- {{metric_name}}: Target {{value}} (measurement method)

#### 5.4 Dataset Requirements
- **Training Data**: {{size}} examples, {{format}} (JSONL), {{source}}
- **Evaluation Data**: {{size}} examples
  - Split: 70% train, 15% validation, 15% test
  - Version control: Track datasets in git
- **Test Scenarios**: 
  - Positive cases: {{X}}%
  - Negative cases: {{Y}}%
  - Edge cases: {{Z}}%
  - Adversarial cases: {{W}}%
- **Data Privacy**: 
  - PII handling: Redaction strategy
  - Retention: Delete after {{X}} days
  - Compliance: GDPR/CCPA requirements

#### 5.5 Agent Architecture (if applicable)
- **Framework**: Microsoft Agent Framework (required for production)
- **Agent Type**: Single / Multi-agent / Workflow / Hybrid
- **Tools/Functions**: 
  - Tool 1: {{name}} - {{description}} - Type: MCP/Native
  - Tool 2: {{name}} - {{description}} - Type: MCP/Native
- **Orchestration**: Sequential / Concurrent / Handoff / Conditional
- **Human-in-Loop**: 
  - When: {{trigger_condition}}
  - How: {{approval_mechanism}}
  - Timeout: {{X}} seconds

#### 5.6 Observability
- **Tracing**: OpenTelemetry (required)
- **Endpoint**: http://localhost:4317 (development), {{prod_endpoint}} (production)
- **Sensitive Data**: Enable/Disable prompt/completion capture
- **Visualization**: AI Toolkit (development), Application Insights (production)

### 6. Traditional Requirements (Functional)
- **User Stories**: "As a [user], I want to [action], so that [benefit]."
- **Acceptance Criteria**: Gherkin syntax (Given/When/Then) or bulleted lists
- **Prioritization**: MoSCoW (Must have, Should have, Could have, Won't have)

### 7. Non-Functional Requirements
- **Performance**: Latency ({{X}}ms p95), throughput ({{Y}} req/sec)
- **Scalability**: Concurrent users ({{X}}), data volume ({{Y}}GB)
- **Reliability**: Availability (99.9%), MTTR ({{X}} minutes)
- **Security**: Auth (OAuth/JWT), encryption (TLS 1.3), compliance (list)
- **Usability**: Accessibility (WCAG 2.1 AA), mobile responsive

### 8. Architecture Design
- **High-Level Architecture**: Components, services, interactions (Mermaid diagram)
- **Tech Stack**: 
  - Frontend: {{framework}}
  - Backend: {{framework}}
  - Database: {{system}}
  - AI Framework: Microsoft Agent Framework
  - Model Hosting: {{GitHub Models / Foundry / Ollama}}
  - Infrastructure: {{cloud_provider}}
- **Data Flow**: How data moves through the system (diagram)

### 9. UX & UI Requirements
- **User Flows**: Step-by-step journey (flowchart)
- **Wireframe Descriptions**: Layouts and key elements
- **Design System**: Colors, typography, components
- **AI Interaction Patterns**: How users interact with AI features

### 10. API Requirements
- **Endpoints**: Paths, methods (GET, POST, etc.)
- **Request/Response**: JSON schemas, headers
- **Authentication**: Token flows (OAuth, JWT)
- **Rate Limiting**: {{X}} requests per {{Y}} period
- **Versioning**: v1, v2 strategy

### 11. Data Requirements
- **Data Model**: Entities, attributes, relationships (ERD)
- **Data Privacy**: PII handling, retention policies ({{X}} days)
- **Data Security**: Encryption at rest and in transit
- **Backup Strategy**: {{frequency}}, retention ({{X}} days)

### 12. AI Safety & Compliance (NEW FOR 2025)
- **Content Filtering**: 
  - Categories: Hate, violence, self-harm, sexual
  - Thresholds: {{severity_levels}}
  - Action: Block / Warn / Log
- **Bias Mitigation**: 
  - Strategy: {{approach}}
  - Monitoring: {{metrics}}
  - Remediation: {{plan}}
- **Explainability**: 
  - How: Trace reasoning, cite sources
  - When: Always / On request / For high-stakes
- **Audit Trail**: 
  - What: All requests, responses, tool calls
  - Retention: {{X}} days
  - Access: {{who_can_access}}
- **Compliance**: 
  - GDPR: {{requirements}}
  - CCPA: {{requirements}}
  - HIPAA: {{requirements}} (if applicable)
  - Industry-specific: {{regulations}}
- **Incident Response**: 
  - Detection: Automated alerts
  - Escalation: {{procedure}}
  - Remediation: {{plan}}
  - Communication: {{stakeholders}}

### 13. Monitoring & Observability (NEW FOR 2025)
- **Tracing**: OpenTelemetry setup and configuration
- **Metrics**: Custom business metrics to track
- **Dashboards**: Key visualizations (list with priority)
- **Alerts**: 
  - Threshold 1: {{metric}} > {{value}} → {{action}}
  - Threshold 2: {{metric}} < {{value}} → {{action}}
- **A/B Testing**: Experimentation framework for model variants
- **User Feedback**: Collection method and analysis plan

### 14. Cost Management (NEW FOR 2025)
- **Budget**: 
  - Development: ${{X}}/month
  - Staging: ${{Y}}/month
  - Production: ${{Z}}/month
- **Optimization**: 
  - Caching: {{strategy}}
  - Batching: {{approach}}
  - Model selection: Local for simple, cloud for complex
  - Token reduction: {{techniques}}
- **Scaling**: Cost projections at 10x, 100x, 1000x scale
- **Fallbacks**: Cheaper alternatives for non-critical queries

### 15. Success Metrics
- **North Star Metric**: {{primary_measure}} (target: {{value}})
- **KPIs**: 
  - Customer: {{metric_1}} (target: {{value}}), {{metric_2}} (target: {{value}})
  - Business: {{metric_1}} (target: {{value}}), {{metric_2}} (target: {{value}})
  - Technical: {{metric_1}} (target: {{value}}), {{metric_2}} (target: {{value}})
  - AI-Specific: Task adherence (target: ≥4.0), Cost per request (target: <$X)

### 16. Release Plan
- **MVP Definition**: Minimal feature set for launch (list)
- **Phases**: 
  - Phase 1 (Week 1-4): {{features}}
  - Phase 2 (Week 5-8): {{features}}
  - Phase 3 (Week 9-12): {{features}}
- **Launch Criteria**: 
  - All evaluation metrics meet thresholds
  - Security audit passed
  - Load testing completed ({{X}} concurrent users)
  - Compliance review approved
  - Incident response plan documented

### 17. Testing Strategy
- **Unit/Integration**: Code-level testing (coverage > 80%)
- **E2E/UI**: User flow validation (critical paths covered)
- **Performance**: Load testing ({{X}} concurrent users, {{Y}} req/sec)
- **Security**: Penetration testing, vulnerability scan
- **AI Evaluation**: Azure AI Evaluation SDK (continuous)
- **A/B Testing**: Model variants, prompt variations

### 18. Risks & Mitigation
- **Risk 1**: {{description}}
  - Severity: High/Medium/Low
  - Likelihood: High/Medium/Low
  - Impact: {{description}}
  - Mitigation: {{strategy}}
  - Owner: {{person}}
  
- **Risk 2**: Model hallucination
  - Severity: High
  - Likelihood: Medium
  - Impact: User trust, accuracy
  - Mitigation: Groundedness evaluator, source citation, human review
  - Owner: AI/ML Engineer

- **Risk 3**: Cost overrun
  - Severity: Medium
  - Likelihood: High
  - Impact: Budget exceeded by {{X}}%
  - Mitigation: Caching, local models, rate limiting, monitoring
  - Owner: Tech Lead

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
