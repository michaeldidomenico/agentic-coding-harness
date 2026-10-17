#!/bin/bash
set -e

echo "=== Initializing Secure Harness Environment ==="

# 1. Force automated non-interactive confirmations for system runtimes
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip nodejs npm gh

# 2. Establish required directory structures
mkdir -p /workspaces/agentic-coding-harness/projects
mkdir -p /workspaces/agentic-coding-harness/config

# 3. SECURITY: Trust nested project spaces
git config --global --add safe.directory '*'
touch /workspaces/agentic-coding-harness/projects/.gitkeep

# 4. ENGINE: Install the production OpenCode global binary layout
echo "📥 Provisioning OpenCode CLI Platform..."
sudo npm install -g @opencode/cli

echo "=== Harness Architecture Ready! ==="
