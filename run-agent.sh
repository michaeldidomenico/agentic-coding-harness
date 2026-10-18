fi

echo "🚀 Activating Multi-Agent Harness for Workspace: [${TARGET_PROJECT}]"
echo "🏁 Launching OpenCode Session..."

# Step into the target workspace directory
cd "$WORKSPACE_PATH"

# Run OpenCode. It will automatically load the local config bridge, 
# inherit your master settings, and start your default AgentManager.
opencode run --standalone --auto "Initialize workspace tracking via project-bootstrap skill."
