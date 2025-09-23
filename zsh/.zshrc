# ============================================================================
# VSCode Shell Integration - Using Automatic Injection
# Ref: https://code.visualstudio.com/docs/terminal/shell-integration
# terminal.integrated.shellIntegration.enabled = true (in settings)
# ============================================================================

# ============================================================================
# Essential PATH setup (for VSCode to find commands immediately)
# ============================================================================
# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Java
export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Essential environment variables
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# ============================================================================
# VSCode Shell Integration: Load everything immediately for proper hook setup
# ============================================================================
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    # In VSCode: Load everything immediately to ensure proper shell integration
    source "$HOME/.zshrc_heavy"
else
    # Non-VSCode: Can use normal loading 
    source "$HOME/.zshrc_heavy"
fi
