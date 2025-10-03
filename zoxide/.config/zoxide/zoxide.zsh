# ============================================================================
# Zoxide Configuration
# ============================================================================
# zoxide is a smarter cd command that learns your habits

# Environment variables for zoxide configuration
export _ZO_ECHO=1                    # Print the matched directory before navigating
export _ZO_RESOLVE_SYMLINKS=1        # Resolve symlinks when storing paths
export _ZO_EXCLUDE_DIRS="$HOME/.Trash:$HOME/Library"  # Exclude system directories

# Initialize zoxide with zsh integration
eval "$(zoxide init zsh)"