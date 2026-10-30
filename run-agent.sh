#!/bin/bash
# ==============================================================================
# Agentic Coding Harness Orchestrator (OpenCode v2.0.32 Compliant)
# Stability & Security Mode: Extended Configuration Inheritance
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

# 2. Security Check: Ensure the target directory physically exists
if [ ! -d "$WORKSPACE_PATH" ]; then
    echo "❌ Error: Project path not found: ${WORKSPACE_PATH}"
    echo "Please clone your target repository into the 'projects/' folder first."
    exit 1
fi

# 3. Security Check: Ensure credential presence before booting external routes
if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "❌ Security Exception: OPENROUTER_API_KEY is missing from environment secrets."
    exit 1
fi

echo "🚀 Activating Multi-Agent Harness for Workspace: [${TARGET_PROJECT}]"
echo "🏁 Launching OpenCode Session..."

# 4. Context Transition
# Move inside the target project directory so OpenCode scopes its work here
cd "$WORKSPACE_PATH"

# 5. OpenCode Native Launch
# Runs OpenCode in standalone mode. The engine will automatically read the
# local opencode.json bridge, inherit your master settings, and start the AgentManager.
opencode run \
  --standalone \
  --auto \
  "Initialize workspace tracking via project-bootstrap skill."
