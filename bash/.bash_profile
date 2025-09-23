alias h=history
alias c=clear
alias ll="ls -lh"
alias ddd="cd ~/Library/Developer/Xcode/DerivedData"

PS1="\n\w \u@\h \n> "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/thanhhaikhong/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/thanhhaikhong/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/thanhhaikhong/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/thanhhaikhong/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"

export PATH="$PATH:/opt/homebrew/bin"