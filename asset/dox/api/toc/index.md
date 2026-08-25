# foundation-developer Library Documentation for AI

## 1. Introduction & Purpose

**foundation-developer** is the core mulle-sde extension that provides meta-project configuration for MulleFoundation development. It coordinates multiple mulle-foundation extensions and sets up the complete development environment for building foundation-based projects.

This library is particularly useful for:
- Setting up complete development environments
- Coordinating foundation extensions
- Managing complex multi-project setups
- Foundation ecosystem maintenance
- CI/CD integration for foundation projects

## 2. Key Concepts & Design Philosophy

- **Meta-Extension**: Coordinates other extensions
- **Environment Setup**: Complete initialization
- **Dependency Coordination**: Manages inter-project dependencies
- **Consistent Configuration**: Unified build and test configuration
- **Extension Management**: Handles multiple extension configurations

## 3. Extensions Coordinated

- **mulle-foundation-developer**: Objective-C project templates
- **Build Infrastructure**: CMake and mulle-sde configuration
- **Testing Framework**: Test setup and execution
- **Documentation Tools**: Generated documentation support
- **Release Tooling**: Version management and distribution

## 4. Setup & Configuration

### Installation

- Comprehensive installation of all foundation tooling
- Automatic dependency resolution
- Integration with mulle-sde ecosystem

### Project Initialization

- `foundation-developer` as meta-extension
- Coordinates sub-extensions
- Unified configuration approach

### Build Configuration

- CMake integration
- mulle-sde build hooks
- Testing infrastructure
- Installation targets

## 5. Developer Workflow

1. **Install foundation-developer**: One-time setup
2. **Create Project**: Using included extensions
3. **Develop**: With coordinated tooling
4. **Test**: Unified testing framework
5. **Build/Install**: Consistent across projects

## 6. Integration Points

- **mulle-sde**: Project management and building
- **CMake**: Build generation
- **Git**: Version control integration
- **CI Systems**: GitHub Actions, etc.

## 7. Dependencies

- **mulle-sde** - Project and build manager
- **CMake** - Build system
- **MulleFoundation** - Runtime
- **Sub-extensions**: Various foundation tools

## 8. Use Cases

### Example 1: Foundation Contribution
```bash
# Foundation framework contributors use this
mulle-sde -m foundation-developer init ...
mulle-sde build
mulle-sde test
```

### Example 2: Complex Multi-Project Setup
```bash
# Coordinate multiple foundation projects
# foundation-developer handles configuration
```

## 9. Version Information

foundation-developer version macro: `FOUNDATION_DEVELOPER_VERSION`
