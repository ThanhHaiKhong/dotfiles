

# Claude Code MCP Auto-loader
claude-code() {
    # Check if mcp-manager exists and has add-all command
    if [ -f "/usr/local/bin/mcp-manager" ]; then
        echo "Starting Claude Code with auto-loaded MCPs..."
        
        # Start Claude Code in background
        command claude-code "$@" &
        CLAUDE_PID=$!
        
        # Wait a moment for Claude Code to initialize
        sleep 2
        
        # Add all MCPs
        "/usr/local/bin/mcp-manager" add-all
        
        # Bring Claude Code back to foreground
        wait $CLAUDE_PID
    else
        # Fallback to regular claude-code if script not found
        command claude-code "$@"
    fi
}

# Alias for shorter command
alias cc="claude-code"

. "$HOME/.cargo/env"
