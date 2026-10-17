#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

echo "=== Initializing Agentic Coding Harness Environment ==="

# Update pip and install any foundational python utilities you choose to build
pip install --upgrade pip

# Pre-create the projects and configuration zone to avoid pathing errors
mkdir -p /workspaces/agentic-coding-harness/projects
mkdir -p /workspaces/agentic-coding-harness/config

# Configure Git safe directories
# This prevents ownership permission errors when mounting target repos into /projects/
git config --global --add safe.directory '*'

# STABILITY: Ensure target folder tracking dependencies are prepared
touch /workspaces/agentic-coding-harness/projects/.gitkeep

# Install open code as a harness
echo "Installing OpenCode Engine..."
npm install -g @opencode/cli || curl -fsSL https://opencode.live | sh

echo "=== Environment Ready! ==="
