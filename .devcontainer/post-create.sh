#!/bin/bash
set -e

echo "=== Initializing Secure Infrastructure Layer ==="

# 1. Update system package repositories and provision basic software tools
apt-get update && apt-get install -y curl git sqlite3 python3 python3-pip nodejs npm

# 2. Install the GitHub CLI tool globally
curl -fsSL https://github.com | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://github.com stable main" | tee /etc/apt/sources.list.p/github-cli.list > /dev/null
apt-get update && apt-get install -y gh

# 3. Establish required directories and map workspace permissions
mkdir -p /workspaces/agentic-coding-harness/projects
mkdir -p /workspaces/agentic-coding-harness/config
git config --global --add safe.directory '*'
touch /workspaces/agentic-coding-harness/projects/.gitkeep

# 4. Install the OpenCode CLI Engine globally using the verified path
echo "📥 Provisioning OpenCode CLI Platform..."
curl -fsSL https://opencode.ai | bash

echo "=== Harness Architecture Initialized Successfully ==="
