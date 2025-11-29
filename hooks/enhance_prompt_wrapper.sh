#!/bin/bash
# Optimized wrapper for Claude Code prompt enhancement hook
# Ensures correct environment and execution context

cd ~/Documents/claude-code-prompt-improver/claude-prompt-enhancer || {
    echo "Error: Project directory not found" >&2
    exit 1
}

# Use uv for fast, reliable Python execution
exec uv run --quiet python -m scripts.enhance_prompt "$@"
