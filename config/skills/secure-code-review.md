---
id: secure-code-review
title: Automated Vulnerability & Integrity Code Review
description: Reviews local file modifications and workspace git diff tracks to detect security flaws or structural regressions.
risk_tier: moderate
human_review_required: true
---

# PROCEDURE: SECURE CODE REVIEW

## Step 1: Extract Modification Track
- Execute a strict `git diff` within the target project directory to isolate every modification string introduced during the active session.

## Step 2: Vulnerability Scan Gate
- Route the extracted code modification track directly to the `PlanVerifier`.
- Audit the structural modifications specifically checking for:
  - Hardcoded API variables, authentication strings, or encryption passwords.
  - Intentional or unintentional logical backdoors, auth bypass bugs, or memory regressions.
  - Hidden prompt-injection hooks embedded inside modified third-party data inputs.

## Step 3: Report Synthesis
- Write a localized summary report file at `projects/<target-repo>/SECURITY_REVIEW.md`.
- Explicitly log a status flag of `PASSED` or `FAILED`. If vulnerabilities are caught, halt the automation pipeline and prompt the human operator for manual clearance.
