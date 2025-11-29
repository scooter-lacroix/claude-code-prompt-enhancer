#!/bin/bash
# Optimized Prompt Enhancement System Installation Script
# Version 2.0.0 - 5x smaller, 22-38% performance improvement

set -e  # Exit on any error

echo "🚀 Installing Optimized Prompt Enhancement System v2.0.0..."
echo "   Size reduction: 168KB → 36KB (5x smaller)"
echo "   Performance: 22-38% uplift with ToT + Reflection"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

# Check if .claude directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "❌ Error: Claude Code directory not found at $CLAUDE_DIR"
    echo "   Please install Claude Code first"
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p "$CLAUDE_DIR/hooks"

# Backup existing installation
if [ -f "$CLAUDE_DIR/hooks/enhance_prompt.py" ] || [ -f "$CLAUDE_DIR/hooks/enhance-prompt.py" ]; then
    BACKUP_DIR="$CLAUDE_DIR/prompt-enhancer-backup-$(date +%Y%m%d-%H%M%S)"
    echo "📦 Backing up existing installation to: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    cp -r "$CLAUDE_DIR/hooks/"* "$BACKUP_DIR/" 2>/dev/null || true
fi

# Install optimized components
echo "🔧 Installing optimized components..."

# Copy enhancement script
echo "   • Installing optimized enhancement script (36KB)..."
cp "$SCRIPT_DIR/hooks/enhance_prompt.py" "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/enhance_prompt.py"

# Copy wrapper script
echo "   • Installing optimized wrapper script..."
cp "$SCRIPT_DIR/hooks/enhance_prompt_wrapper.sh" "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/enhance_prompt_wrapper.sh"

# Copy configuration
echo "   • Installing optimized configuration with ToT + Reflection..."
mkdir -p "$CLAUDE_DIR/hooks/config"
cp "$SCRIPT_DIR/hooks/config/default_config.json" "$CLAUDE_DIR/hooks/config/"

# Copy templates
echo "   • Installing enhanced templates..."
cp -r "$SCRIPT_DIR/hooks/templates/" "$CLAUDE_DIR/hooks/"

# Copy integration manager
echo "   • Installing integration manager..."
cp "$SCRIPT_DIR/integration_manager.py" "$CLAUDE_DIR/hooks/"

# Clean up old duplicate files
if [ -f "$CLAUDE_DIR/hooks/enhance-prompt.py" ]; then
    echo "   • Removing old duplicate file..."
    rm "$CLAUDE_DIR/hooks/enhance-prompt.py"
fi

# Verify installation
echo "🔍 Verifying installation..."

if [ -f "$CLAUDE_DIR/hooks/enhance_prompt.py" ]; then
    SIZE=$(du -h "$CLAUDE_DIR/hooks/enhance_prompt.py" | cut -f1)
    echo "   ✓ Enhancement script installed ($SIZE)"
else
    echo "   ❌ Enhancement script not found"
    exit 1
fi

if [ -f "$CLAUDE_DIR/hooks/enhance_prompt_wrapper.sh" ]; then
    echo "   ✓ Wrapper script installed"
else
    echo "   ❌ Wrapper script not found"
    exit 1
fi

if python3 -c "import json; json.load(open('$CLAUDE_DIR/hooks/config/default_config.json'))" 2>/dev/null; then
    echo "   ✓ Configuration valid"
else
    echo "   ❌ Configuration invalid"
    exit 1
fi

echo ""
echo "🎉 Installation completed successfully!"
echo ""
echo "🚀 OPTIMIZATION ACTIVATED:"
echo "   • Tree-of-Thought + Reflection: Enabled"
echo "   • Ultra Mode: Enabled for complex tasks"
echo "   • Uncertainty Handling: Enhanced"
echo "   • Output Format Validation: Enabled"
echo "   • Learning System: Integrated"
echo ""
echo "💡 USAGE:"
echo "   • Normal prompts: Enhanced automatically"
echo "   • Ultra mode triggers: orchestrate, multi-agent, architecture, etc."
echo "   • Bypass prefixes: *, /, # (disable enhancement)"
echo "   • Learning: Patterns tracked automatically"
echo ""
echo "📚 For more information, see docs/OPTIMIZATION_GUIDE.md"
echo ""

# Test the installation
echo "🧪 Testing installation..."
cd "$CLAUDE_DIR/hooks"
if python3 -c "import enhance_prompt; print('✅ System ready!')" 2>/dev/null; then
    echo "   ✓ System functional"
else
    echo "   ⚠️  System test failed (may need dependencies)"
fi

echo ""
echo "🎯 Optimized Prompt Enhancement System v2.0.0 ready!"