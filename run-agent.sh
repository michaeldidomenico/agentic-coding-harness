#!/bin/bash
# ==============================================================================
# Agentic Coding Harness Orchestrator (OpenCode v2.0.32 Match)
# ==============================================================================
set -e

# 1. Validation: Ensure a target project folder argument was provided
if [ -z "$1" ]; then
    echo "❌ Error: No target project folder specified."
    echo "Usage: ./run-agent.sh <project-folder-name>"
    exit 1
fi

TARGET_PROJECT="$1"
WORKSPACE_PATH="/workspaces/agentic-coding-harness/projects/${TARGET_PROJECT}"
MASTER_CONFIG="/workspaces/agentic-coding-harness/config/opencode.json"

# 2. Security Check: Ensure the target directory physically exists
if [ ! -d "$WORKSPACE_PATH" ]; then
    echo "❌ Error: Project path not found: ${WORKSPACE_PATH}"
    exit 1
fi

if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "❌ Security Exception: OPENROUTER_API_KEY is missing from environment secrets."
    exit 1
fi

echo "🚀 Activating Multi-Agent Harness for Workspace: [${TARGET_PROJECT}]"
echo "🏁 Starting OpenCode Multi-Agent Session via AgentManager..."

# 3. Context Transition: Move inside the target project directory so OpenCode targets it
cd "$WORKSPACE_PATH"

# 4. OpenCode v2.0.32 Native Launch Array
# We use the correct modern --standalone flag and feed the model string format
# provider/model. The configuration maps right back to your universal layer.
opencode run \
  --standalone \
  --agent "AgentManager" \
  --model "openrouter/deepseek/deepseek-v4.1-flash" \
  --auto \
  "Initialize the workspace using the project-bootstrap skill. Ingest the universal contract guidelines and output a directory map."
