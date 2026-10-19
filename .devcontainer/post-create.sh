#!/bin/bash
set -e

echo "=== Initializing Secure Harness Environment ==="

# 1. Force automated non-interactive confirmations for system runtimes
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip nodejs npm gh sqlite3

# 2. Establish required directory structures
mkdir -p /workspaces/agentic-coding-harness/projects
mkdir -p /workspaces/agentic-coding-harness/config/skills

# 3. SECURITY: Trust nested project spaces
git config --global --add safe.directory '*'
touch /workspaces/agentic-coding-harness/projects/.gitkeep

# 4. ENGINE: Install OpenCode and automate the global V2 layout linkage
echo "📥 Provisioning OpenCode CLI Platform..."
npm install -g @opencode/cli

echo "🔗 Binding Universal Harness Configuration to Global User Profile..."
# Create the global OpenCode config directories for both potential user spaces
mkdir -p /home/vscode/.config/opencode
mkdir -p /root/.config/opencode

# Symlink the master config to the global paths so the TUI works anywhere natively
ln -sf /workspaces/agentic-coding-harness/config/opencode.json /home/vscode/.config/opencode/opencode.json
ln -sf /workspaces/agentic-coding-harness/config/opencode.json /root/.config/opencode/opencode.json

echo "=== Harness Architecture Ready! ==="
