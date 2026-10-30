---
id: project-bootstrap
title: Target Project Onboarding & Bootstrap
description: Automatically scans a target repository to identify stack constraints and create a localized Layer 2 contract framework.
risk_tier: low
human_review_required: false
---

# PROCEDURE: TARGET PROJECT BOOTSTRAP

## Step 1: Stack Identification
- Execute directory listings and scan root configuration assets (e.g., `package.json`, `requirements.txt`, `pyproject.toml`, `go.mod`).
- Identify the core programming language, runtime framework, package managers, and designated test suite runners.

## Step 2: Local Firewall Verification
- Check if a local `.gitignore` asset exists inside the cloned target root.
- If missing, generate a standard configuration tailored specifically to that discovered tech stack.

## Step 3: Layer 2 Layer Generation
- Initialize a localized, thin file at `projects/<target-repo>/AGENTS.md` if it does not already exist.
- Populate it with explicit contextual labels detailing:
  - Discovered Framework & Runtime variations.
  - Precise shell command strings required to execute local compilation, linting, and testing suites.
- Keep it to project facts only. Do not restate agent roles, workflow phases, or tool policy here, and never create project-local `.opencode/agents` or `.opencode/skills` — those live only in the harness `config/` layer.
