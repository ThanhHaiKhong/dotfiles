# bin - Development Scripts Package

This package contains custom development scripts for Swift/TCA development workflows.

## Contents

### TCA (The Composable Architecture) Scripts

- **create-tca-client** - Generate TCA client dependencies with Interface, Models, Mocks, and Live implementation
- **create-tca-feature** - Generate complete TCA features with Store and View files
- **create-tca-project** - Bootstrap new TCA projects with modular architecture

### Swift Development Scripts

- **swift-build** - Universal Swift project builder (auto-detects Xcode/SPM projects)
- **swift-clean** - Clean build artifacts and caches with size reporting
- **swift-deps** - Swift Package Manager dependency management wrapper
- **swift-lint** - SwiftLint wrapper with auto-detection and fixing
- **swift-test** - Universal test runner with coverage and filtering support

## Installation

```bash
cd ~/dotfiles
stow bin
```

This will create symlinks in `~/.local/bin/` pointing to the scripts in this package.

### Shell Completions

The package includes tab completions for both Zsh and Bash.

**Zsh Completions:**

Add to your `.zshrc`:
```bash
# Add custom completions to fpath
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit
```

Then reload your shell:
```bash
source ~/.zshrc
```

**Bash Completions:**

Add to your `.bashrc`:
```bash
# Load custom bash completions
if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
    [ -r "$file" ] && source "$file"
  done
fi
```

Then reload your shell:
```bash
source ~/.bashrc
```

**Testing Completions:**

After installation, try:
```bash
swift-build --<TAB>              # Shows all options
swift-deps <TAB>                 # Shows available commands
swift-lint --reporter <TAB>      # Shows reporter types
create-tca-project My<TAB>       # Completes project names
```

## Features

All scripts include:
- ✅ Comprehensive inline documentation
- ✅ Safe path handling (no eval exploits)
- ✅ Auto-detection of project structure
- ✅ Colored output for better readability
- ✅ Built-in help (`--help` flag)
- ✅ Error handling and validation

## Usage Examples

### Creating a New TCA Project

```bash
create-tca-project TodoApp
cd todo-app
swift-build
```

### Adding a Feature

```bash
create-tca-feature TodoList
```

### Creating a Client Dependency

```bash
create-tca-client NetworkClient
```

### Building and Testing

```bash
swift-build --configuration Release
swift-test --coverage
swift-lint --fix
```

### Cleaning Build Artifacts

```bash
swift-clean --deep
swift-clean --all --dry-run  # Preview what will be deleted
```

## Requirements

- **Required**: Xcode Command Line Tools
- **Optional**:
  - XcodeGen (`brew install xcodegen`) - for create-tca-project
  - SwiftLint (`brew install swiftlint`) - for swift-lint
  - xcpretty (`gem install xcpretty`) - for prettier build output

## Uninstallation

```bash
cd ~/dotfiles
stow -D bin
```

## Script Documentation

Each script has detailed header documentation. View with:

```bash
head -40 ~/.local/bin/swift-build
```

Or use the `--help` flag:

```bash
swift-build --help
create-tca-feature --help
```

## Updates

To update scripts:
1. Edit files in `~/dotfiles/bin/.local/bin/`
2. Commit changes to git
3. Push to remote repository

No need to re-stow - the symlinks will automatically reflect changes.

## Shell Completion Features

Each script includes intelligent tab completions:

| Script | Completion Features |
|--------|-------------------|
| `swift-build` | Configuration (Debug/Release), platforms (ios/macos/etc.), paths |
| `swift-test` | Configuration, platforms, filter patterns, paths |
| `swift-clean` | Flags (--all, --deep, --dry-run), paths |
| `swift-deps` | Commands (update/resolve/show/etc.), package names |
| `swift-lint` | Reporter types, rule names, config files, paths |
| `create-tca-project` | Project names, directory names, paths |
| `create-tca-feature` | Feature names, target paths |
| `create-tca-client` | Client names, target paths |

## Troubleshooting

### Scripts not found
Ensure `~/.local/bin` is in your PATH:
```bash
echo $PATH | grep -q ".local/bin" || echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
```

### Completions not working (Zsh)
Check fpath and reload:
```bash
echo $fpath | grep -q ".zsh/completions" || echo 'fpath=(~/.zsh/completions $fpath)' >> ~/.zshrc
rm -f ~/.zcompdump && exec zsh
```

### Completions not working (Bash)
Source completion files:
```bash
source ~/.bash_completion.d/swift-build  # Test individual file
# Or add loader to ~/.bashrc (see installation above)
```

### Permission issues
Make scripts executable:
```bash
chmod +x ~/dotfiles/bin/.local/bin/*
```

### Symlink conflicts
If you have existing scripts in `~/.local/bin/`, either:
- Remove them before stowing
- Use `stow --adopt bin` to move existing files into the package
