#!/bin/bash
# ==============================================================================
# Agentic Coding Harness Orchestrator (OpenCode V2.0.32 Compliant)
# Stability & Security Mode: Strict Path Enforcements
# ==============================================================================
set -e

# 1. Validation: Ensure a target project folder argument was provided
if [ -z "$1" ]; then
    echo "❌ Error: No target project folder specified."
    echo "Usage: ./run-agent.sh <project-folder-name>"
    echo "Example: ./run-agent.sh my-web-app"
    exit 1
fi

TARGET_PROJECT="$1"
WORKSPACE_PATH="/workspaces/agentic-coding-harness/projects/${TARGET_PROJECT}"
MASTER_CONFIG="/workspaces/agentic-coding-harness/config/opencode.json"

# 2. Security Check: Ensure the target directory actually exists
if [ ! -d "$WORKSPACE_PATH" ]; then
    echo "❌ Error: Project path not found: ${WORKSPACE_PATH}"
    echo "Please clone the target repository into your 'projects/' folder first."
    exit 1
fi

# 3. Security Check: Ensure credential presence before booting external routes
if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "❌ Security Exception: OPENROUTER_API_KEY is missing from environment secrets."
    exit 1
fi

echo "🚀 Activating Harness for Workspace: [${TARGET_PROJECT}]"

# 4. OpenCode V2.0.32 Execution Platform Gateway
# This boots the centralized multi-agent matrix cleanly. OpenCode natively 
# processes the project workspace root, auto-discovers any localized Layer 2 
# AGENTS.md rules inside it, applies your tiered model mappings, and begins.
echo "🏁 Starting OpenCode Multi-Agent Session via AgentManager..."

opencode run \
  --project "$WORKSPACE_PATH" \
  --config "$MASTER_CONFIG" \
  --agent "AgentManager" \
  --auto
