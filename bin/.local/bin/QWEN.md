# Swift Development Tool Suite

This directory contains a comprehensive set of Swift development tools designed to streamline Swift development workflows. The tools provide a unified interface for common Swift development tasks, supporting both Xcode projects (workspaces/projects) and Swift Package Manager (SPM) projects.

## Tool Suite Overview

### Swift Build Tools
- `swift-build`: Universal Swift Project Builder that automatically detects and builds Swift projects (Xcode or SPM), supporting workspaces, projects, and Swift packages. It now defaults to iOS Simulator when no platform is specified.
- `swift-test`: Universal Swift Project Test Runner with support for code coverage, parallel testing, and test filtering.
- `swift-clean`: Swift Project Build Artifacts Cleaner that removes .build, build, and DerivedData directories.
- `swift-lint`: Swift Code Linter Wrapper for SwiftLint with auto-fixing capabilities.
- `swift-deps`: Swift Package Manager Dependency Manager for common dependency operations.

### TCA (The Composable Architecture) Project Generators
- `create-tca-project`: Creates a complete TCA project structure with modular architecture, XcodeGen configuration, and workspace setup.
- `create-tca-feature`: Generates new TCA features with standardized structure and file templates.
- `create-tca-client`: Creates API clients with standardized networking patterns for TCA projects.

## Key Features

### Swift Build Tools
- **Universal Detection**: All tools automatically detect project types by searching up to 10 directory levels for .xcworkspace, .xcodeproj, or Package.swift
- **Cross-Platform Support**: Support for iOS, macOS, tvOS, watchOS, and visionOS platforms
- **Seamless Integration**: Work from any subdirectory within a project
- **Enhanced UX**: Pretty output formatting and comprehensive error reporting

### TCA Generators
- **Modular Architecture**: Enforces best practices for modular Swift development
- **Template-Based**: Consistent file structures and boilerplate generation
- **TCA Compliant**: Follows The Composable Architecture patterns and conventions

## Usage

### Building Swift Projects
```bash
# Build with default iOS Simulator platform
swift-build

# Build for specific platform
swift-build --platform macos

# Build with specific configuration
swift-build --configuration Release

# Build specific project
swift-build ~/Projects/MyApp
```

### Testing Swift Projects
```bash
# Run all tests
swift-test

# Run tests with coverage
swift-test --coverage

# Run tests in parallel
swift-test --parallel

# Filter tests by name
swift-test --filter "UserFeature"
```

### Managing Dependencies
```bash
# Update all dependencies
swift-deps update

# Show dependency tree
swift-deps show

# Resolve dependencies
swift-deps resolve
```

### Creating TCA Projects
```bash
# Create a new TCA project
create-tca-project MyProject

# Create a new TCA feature
create-tca-feature UserManagement

# Create a new TCA client
create-tca-client UserClient
```

## Development Conventions

1. **Path Handling**: All tools support relative paths (../, ./), absolute paths, and ~ expansion
2. **Platform Defaults**: Tools default to iOS Simulator when no platform is specified
3. **Error Handling**: Comprehensive error reporting with suggestions for resolution
4. **Verbosity Control**: Consistent --verbose/-v flag for detailed output
5. **Configuration**: Support for common build configurations (Debug/Release)

## Architecture

The tools follow a consistent architecture pattern:
- **Detection Phase**: Find project root and determine project type
- **Validation Phase**: Check required tools and dependencies
- **Execution Phase**: Perform the requested operation with detailed feedback
- **Summary Phase**: Provide comprehensive build/test results

This tool suite is designed to support professional Swift development workflows with emphasis on automation, consistency, and developer experience.

## OPTIMIZED WORKING PROCESS - MANDATORY FOR ALL TASKS

**This optimized process must be followed for ALL tasks involving tools in this directory. Failure to follow this process will result in incomplete or incorrect implementations.**

### Process Loop (Repeat until requirements are met):
1. [Research & Deep Analysis] → 2. [Evaluation & Filtering] → 3. [Planning] → 4. [Implementation] → 5. [Testing & Evaluation] → LOOP BACK IF NOT MATCHING REQUIREMENTS

---

### STEP 1: Deep Research and Documentation Review
- **Base on requirement**: Analyze the specific requirement and desired outcome
- **Deep research**: Consult official documentation (`swift build --help`, `xcodebuild --help`, etc.)
- **Additional resources**: Research best practices, examples, and related materials
- **Cross-reference**: Compare multiple sources to ensure accuracy and completeness

### STEP 2: Analysis, Evaluation, and Source Filtering
- **Analyze** each resource found in Step 1 for relevance and accuracy
- **Evaluate** the quality and applicability of information to the specific requirement
- **Sort and filter** resources to identify the most valuable and reliable sources
- **Validate** that resources meet implementation requirements
- **If insufficient quality resources found**: **RETURN TO STEP 1**

### STEP 3: Create Detailed Plan with Researched Resources
- **Resource integration**: Use only the validated resources from Step 2
- **Detailed breakdown**: Break implementation into specific, manageable steps
- **Expectation setting**: Define expected results for each implementation step
- **Risk assessment**: Identify potential issues and mitigation strategies
- **Test scenarios**: Plan comprehensive testing based on requirement

### STEP 4: Step-by-Step Implementation
- **Follow plan**: Execute each step exactly as planned in Step 3
- **Document progress**: Record actual outcomes vs expected outcomes for each step
- **Maintain consistency**: Follow established patterns in existing codebase
- **Quality assurance**: Verify each step before moving to the next

### STEP 5: Testing and Evaluation
- **Comprehensive testing**: Execute all planned test scenarios from Step 3
- **Result comparison**: Compare actual results to original requirement
- **Quality validation**: Ensure the solution meets requirement specifications
- **If results don't match requirements**: **RETURN TO STEP 1**
- **If results match requirements**: Document final implementation

### CONTINUOUS VERIFICATION CHECKPOINTS:
- **After Step 1**: Are the requirements clearly understood based on documentation?
- **After Step 2**: Are the selected resources reliable and appropriate?
- **After Step 3**: Is the plan comprehensive and achievable?
- **After Step 4**: Was implementation executed according to plan?
- **After Step 5**: Do results satisfy the original requirements?

---

## RESULTS DOCUMENTATION REQUIREMENTS

### Final Results Table (Mandatory):
| Step | Requirement | Expected | Actual | Status | Notes |
|------|-------------|----------|--------|--------|-------|
| Research | Deep documentation review | Complete | | | |
| Evaluation | Resource validation | Complete | | | |
| Planning | Detailed plan creation | Complete | | | |
| Implementation | Code changes | Complete | | | |
| Testing | Requirement match | Complete | | | |

## CRITICAL REMINDERS:
- **ALWAYS** complete the full process loop for every task
- **ALWAYS** return to Step 1 if requirements aren't met
- **ALWAYS** validate with official documentation and reliable sources
- **ALWAYS** document actual vs expected results
- **NEVER** skip steps or proceed without verification

## Suggestions for Improving the Working Process

### 1. Automated Testing Framework
- Consider implementing automated tests for all tools
- Create test suites for different project types and scenarios
- Use continuous integration to validate changes across different environments

### 2. Version Control Strategy
- Use feature branches for all changes
- Implement pull requests for code review
- Maintain clear commit messages explaining the purpose of changes

### 3. Documentation Consistency
- Maintain consistent help text and usage documentation across all tools
- Update documentation immediately when features change
- Include usage examples for new or modified functionality

### 4. Error Handling Standardization
- Implement consistent error codes across tools
- Provide helpful error messages with suggested solutions
- Log errors to help with debugging

### 5. Configuration Management
- Allow for user-level and project-level configuration
- Maintain backward compatibility with existing configurations
- Provide clear migration paths for configuration changes

### 6. Performance Monitoring
- Implement timing measurements for operations
- Track performance regressions across releases
- Optimize common paths for better user experience

### 7. Cross-Platform Considerations
- Ensure tools work across different macOS versions
- Consider future Xcode and Swift version compatibility
- Document system requirements clearly