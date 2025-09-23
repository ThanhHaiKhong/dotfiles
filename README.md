# Dotfiles

This repository contains my personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

All configuration files are organized into packages and managed using GNU Stow.

### Prerequisites

- GNU Stow: `brew install stow`

### Installation

Clone this repository to your home directory and run:

```bash
cd ~/dotfiles
stow bash zsh git vim tmux wezterm claude configstore exercism flutter gh gh-copilot ghc github-copilot glab-cli jgit nvim rclone lldb swift
```

### Package Structure

- **bash**: Bash shell configuration (`.bashrc`, `.bash_profile`)
- **zsh**: Zsh shell configuration (`.zshrc`, `.zshrc_heavy`)
- **git**: Git configuration (`.gitconfig`, `.gitignore_global`, etc.)
- **vim**: Vim and related editor configs (`.vimrc`, `.vim/`, `.ideavimrc`)
- **tmux**: Terminal multiplexer configuration (`.tmux.conf`)
- **wezterm**: WezTerm terminal emulator configuration (`.config/wezterm/wezterm.lua`)
- **claude**: Claude AI configuration files (`.config/claude/`)
- **configstore**: Node.js config store (`.config/configstore/`)
- **exercism**: Exercism CLI configuration (`.config/exercism/`)
- **flutter**: Flutter configuration (`.config/flutter/`)
- **gh**: GitHub CLI configuration (`.config/gh/`)
- **gh-copilot**: GitHub Copilot CLI configuration (`.config/gh-copilot/`)
- **ghc**: Glasgow Haskell Compiler configuration (`.config/ghc/`)
- **github-copilot**: GitHub Copilot configuration (`.config/github-copilot/`)
- **glab-cli**: GitLab CLI configuration (`.config/glab-cli/`)
- **jgit**: JGit configuration (`.config/jgit/`)
- **nvim**: Neovim configuration (`.config/nvim/`)
- **rclone**: Rclone configuration (`.config/rclone/`)
- **lldb**: LLDB debugger configuration (`.lldbinit`, `.lldbinit-rules_xcodeproj`)
- **swift**: Swift development configuration (`.swift-version`)

### Managing Changes

To add new config files:
1. Move the file to the appropriate package directory
2. Run `stow <package-name>` to create the symlink
3. Commit changes to git

To remove stowed files:
```bash
stow -D <package-name>
```

### Rollback

In case of issues, you can:
1. Unstow all packages: `stow -D bash zsh git vim tmux wezterm claude configstore exercism flutter gh gh-copilot ghc github-copilot glab-cli jgit nvim rclone lldb swift`
