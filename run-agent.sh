#!/bin/bash
# ==============================================================================
# Agentic Coding Harness Orchestrator
# Stability & Security Mode: Strict Path Enforcements
# ==============================================================================
set -e

# Validation: Ensure a target project folder argument was provided
if [ -z "$1" ]; then
    echo "❌ Error: No target project folder specified."
    echo "Usage: ./run-agent.sh <project-folder-name>"
    echo "Example: ./run-agent.sh my-web-app"
    exit 1
fi

TARGET_PROJECT="$1"
WORKSPACE_PATH="/workspaces/agentic-coding-harness/projects/${TARGET_PROJECT}"
UNIVERSAL_CONTRACT="/workspaces/agentic-coding-harness/config/AGENTS.universal.md"

# Security Check: Ensure the target directory actually exists and is within boundaries
if [ ! -d "$WORKSPACE_PATH" ]; then
    echo "❌ Error: Project path not found: ${WORKSPACE_PATH}"
    echo "Please clone the target repository into your 'projects/' folder first."
    exit 1
fi

# Security Check: Ensure credential presence before booting external routes
if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "❌ Security Exception: OPENROUTER_API_KEY is missing from environment secrets."
    exit 1
fi

echo "🚀 Activating Harness for Workspace: [${TARGET_PROJECT}]"
echo "🔗 Gateway Routing: OpenRouter Enabled"

# Context Stitching Layer (The GSA Playbook Concept)
# We inspect if the target repo has its own thin Layer 2 local context contract.
# If not, we fall back gracefully to just our foundational Universal Contract rules.
LOCAL_PROJECT_CONTRACT="${WORKSPACE_PATH}/AGENTS.md"
TEMP_COMPOSED_CONTEXT="/tmp/AGENTS.composed.md"

cat "$UNIVERSAL_CONTRACT" > "$TEMP_COMPOSED_CONTEXT"

if [ -f "$LOCAL_PROJECT_CONTRACT" ]; then
    echo "📄 Found Layer 2 Project Contract. Merging custom context..."
    echo -e "\n\n# --- PROJECT LAYER SPECIFIC RULES ---\n" >> "$TEMP_COMPOSED_CONTEXT"
    cat "$LOCAL_PROJECT_CONTRACT" >> "$TEMP_COMPOSED_CONTEXT"
else
    echo "🛡️  No local AGENTS.md contract found. Operating strictly on Universal Contract constraints."
fi

# Execution Gateway
# Launch OpenCode pointing explicitly to the chosen isolated project workspace directory
# and feeding it the stitched multi-layer system instruction profile.
# Customize these flags based on your preferred OpenCode CLI execution tags.
echo "🏁 Starting OpenCode Session..."

opencode run \
  --workspace "$WORKSPACE_PATH" \
  --system-prompt "$TEMP_COMPOSED_CONTEXT" \
  --openai-base-url "https://openrouter.ai" \
  --openai-api-key "$OPENROUTER_API_KEY" \
  --model "google/gemini-2.5-pro" # Change this string to your preferred OpenRouter model target

# Clean up ephemeral context allocations upon session teardown
rm -f "$TEMP_COMPOSED_CONTEXT"
echo "🔌 Session Terminated Cleanly."
