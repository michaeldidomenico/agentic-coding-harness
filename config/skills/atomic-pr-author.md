---
id: atomic-pr-author
title: Atomic Git Branching and Pull Request Generation
description: Automatically structures code changes into atomic Git feature tracking tracks and drafts professional PR templates.
risk_tier: moderate
human_review_required: true
---

# PROCEDURE: ATOMIC PR AUTHORING

## Step 1: Build Workspace Cleanliness Check
- Run local code test suites and verify that the target working directory tree is clear of un-tracked transient file pollution.

## Step 2: Atomic Feature Isolation
- Determine a highly structured, descriptive branch naming paradigm based on the active issue (e.g., `feature/validate-stripe-webhooks`).
- Execute local git tracking updates to check out a clean, isolated tracking branch from the repository's base line branch.

## Step 3: Conventional Commit Extraction
- Group files cleanly and generate local version control snapshots.
- Ensure all commit messages strictly match the Conventional Commits specification layout (e.g., `fix(api): secure webhook validation error conditions`).

## Step 4: Draft Pull Request
- Utilize the integrated GitHub CLI (`gh`) tool to package the branch details.
- Output a comprehensive Pull Request body detailing the core alterations, verification methods, and architectural notes for human review.
