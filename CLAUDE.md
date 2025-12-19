# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository containing development environment configurations and custom tooling. The primary focus for development work is the `bin/.local/bin/` directory, which contains a comprehensive suite of Swift development tools.

## Swift Development Tools (`bin/.local/bin/`)

### Tool Categories

**Build & Test Tools:**
- `swift-build` - Universal Swift project builder (Xcode/SPM auto-detection)
- `swift-test` - Test runner with coverage, parallel execution, and filtering
- `swift-clean` - Build artifacts cleaner
- `swift-lint` - SwiftLint wrapper with auto-fixing
- `swift-deps` - SPM dependency manager

**TCA Project Generators:**
- `create-tca-project` - Complete TCA project scaffolding with XcodeGen
- `create-tca-feature` - TCA feature generator with @Reducer and SwiftUI views
- `create-tca-client` - API client generator with TCA patterns

### Common Commands

```bash
# Building projects
swift-build                                    # Auto-detect and build (defaults to iOS Simulator)
swift-build --platform macos                   # Build for specific platform
swift-build --configuration Release --clean    # Clean release build

# Running tests
swift-test                                     # Run all tests
swift-test --coverage --parallel               # Parallel tests with coverage
swift-test --filter "FeatureTests"             # Run specific test suite

# Managing dependencies
swift-deps update                              # Update all dependencies
swift-deps show                                # Show dependency tree
swift-deps resolve                             # Resolve dependencies

# Creating TCA projects
create-tca-project MyApp                       # Create new TCA project
create-tca-feature UserProfile                 # Add feature to existing project
create-tca-client APIClient                    # Create API client
```

### Architecture Patterns

**Project Detection System:**
All tools implement a hierarchical search (up to 10 levels) to auto-detect:
1. `.xcworkspace` files (highest priority)
2. `.xcodeproj` files
3. `Package.swift` files (SPM)

This allows tools to work from any subdirectory within a project.

**Path Handling:**
- Supports relative paths (`./`, `../`), absolute paths, and tilde expansion (`~`)
- All path arguments are expanded before processing
- Working directory is preserved after operations

**Error Handling:**
- Colored output (red/green/yellow/blue) for different message types
- Comprehensive error messages with suggested resolutions
- Exit codes follow standard conventions (0 = success, non-zero = failure)

**TCA Code Generation:**
- iOS version detection from `Package.swift`
- iOS < 17: Uses `WithPerceptionTracking` wrapper
- iOS >= 17: Direct view body without wrapper
- Auto-updates `Package.swift` with new feature targets
- Normalizes "Feature" suffix in naming

### Critical Implementation Requirements

When modifying tools in `bin/.local/bin/`, follow the **5-step mandatory process** documented in `QWEN.md`:

1. **Research & Deep Analysis** - Consult official documentation (`swift build --help`, `xcodebuild --help`, etc.)
2. **Evaluation & Filtering** - Validate resources for accuracy and relevance
3. **Planning** - Create detailed implementation plan with expected outcomes
4. **Implementation** - Execute step-by-step following the plan
5. **Testing & Evaluation** - Verify results match requirements; loop back to step 1 if not

**Loop until requirements are met.** Do not proceed if validation fails.

### Development Guidelines

**Consistency Requirements:**
- Maintain consistent option naming across tools (`--verbose`, `--configuration`, `--platform`)
- Use the same color scheme for output (RED/GREEN/YELLOW/BLUE/NC)
- Follow the established help text format
- Preserve the header comment structure in each script

**Bash Scripting Standards:**
- Use `set -e` for error handling
- Implement cleanup traps for temporary files
- Define helper functions for colored output (`print_error`, `print_success`, `print_info`, `print_warning`)
- Include comprehensive usage documentation in comments

**Tool Detection:**
- Check for required tools (Xcode, SwiftLint, xcpretty, XcodeGen) before execution
- Provide installation instructions in error messages
- Gracefully degrade when optional tools are missing (e.g., xcpretty)

**Testing New Features:**
- Test with both Xcode projects and SPM packages
- Verify from different directory depths (root, subdirectories)
- Test all platform options (iOS, macOS, tvOS, watchOS, visionOS)
- Validate path expansion with `~`, `./`, and `../`

### Shell Completions

Shell completions are located in:
- Bash: `bin/.bash_completion.d/`
- Zsh: `bin/.zsh/completions/`

When adding new options to tools, update the corresponding completion files.

### Common Pitfalls to Avoid

1. **Don't hardcode paths** - Always use path detection and expansion
2. **Don't assume Xcode or SPM** - Detect project type dynamically
3. **Don't skip platform validation** - Verify platform compatibility
4. **Don't ignore iOS version for TCA** - Detection is critical for correct code generation
5. **Don't break the search hierarchy** - Maintain workspace > project > package priority

### Related Documentation

- Main Swift tool documentation: `bin/.local/bin/QWEN.md`
- Individual script headers contain detailed usage and examples
- Git status shows current work: `master` branch, main branch is `clean-start`
