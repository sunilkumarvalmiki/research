# Test Plan Template

**Project**: [Project Name]
**Version**: 1.0
**Date**: [YYYY-MM-DD]
**Author**: [Name]

---

## 1. Introduction
* **Objective**: [What is being tested]
* **Scope**: [Features in scope / out of scope]
* **References**: [Links to PRD, Design Docs]

## 2. Test Strategy
* **Levels**: [Unit, Integration, System, UAT]
* **Types**: [Functional, Performance, Security, Usability]
* **Tools**: [Frameworks, CI/CD tools]

## 3. Test Environment
* **Hardware**: [Requirements]
* **Software**: [OS, Browsers, Versions]
* **Data**: [Test data requirements]

## 4. Test Scenarios

### 4.1 Feature: [Name]

| ID | Objective | Scenario | Technique | Expected Result | Priority |
|----|-----------|----------|-----------|-----------------|----------|
| TC-01 | Verify Login | Valid creds | Positive | Success | High |
| TC-02 | Verify Login | Invalid creds | Negative | Error Msg | High |
| TC-03 | Verify Login | Empty fields | Edge Case | Validation | Medium |

### 4.2 Feature: [Name]

| ID | Objective | Scenario | Technique | Expected Result | Priority |
|----|-----------|----------|-----------|-----------------|----------|
| TC-04 | | | | | |

## 5. Execution Plan
* **Schedule**: [Timeline]
* **Resources**: [Who is testing]
* **Defect Management**: [Tool, Process]

## 6. Entry & Exit Criteria
### Entry Criteria
* [ ] Code frozen
* [ ] Environment ready
* [ ] Smoke tests passed

### Exit Criteria
* [ ] 100% critical tests passed
* [ ] No critical bugs open
* [ ] Sign-off received

## 7. Deliverables
* [ ] Test Plan
* [ ] Test Cases
* [ ] Defect Reports
* [ ] Test Summary Report

## 8. Risks & Mitigation
* [ ] Risk 1 -> Mitigation
