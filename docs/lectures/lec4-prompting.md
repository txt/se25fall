# AI Coding Guidelines for AIPCC Test Suite Wrapper

This file contains comprehensive instructions and best practices for AI-assisted coding in the AIPCC Test Suite Wrapper repository. Include this context when working with AI coding assistants.

## Project Overview

The AIPCC Test Suite Wrapper is a comprehensive, modular testing system for validating custom-built Python wheel packages targeting CPU and accelerator environments (CUDA, ROCm, Gaudi, TPU) for Red Hat's AIPCC organization. 

### Three-Tier Testing Strategy (per PCC-ADR049)

**Step 1 – Smoke Import Tests**: Minimal runtime validation confirming successful installation and basic module importability (`import PACKAGE_NAME`). Detects packaging, dependency, or environment issues.

**Step 2 – Probe Tests**: Lightweight programmatic usage probes exercising minimal functionality with representative API calls. Catches runtime errors not detected in import-only checks without extensive setup or hardware dependencies.

**Step 3 – Upstream Test Suite Execution**: Comprehensive validation using upstream test suites when available and reliable. Provides the most thorough coverage and should be preferred when operationally viable.

### Core Technical Features

- **Per-wheel virtual environments** with guaranteed cleanup
- **Flexible dependency handling** (pipreqs, files, custom modes)  
- **Local wheel server** for reproducible installations
- **Multi-runner support** (pytest, unittest, nose, testify, hypothesis, mamba, ward)
- **Robust error handling** and signal management
- **Runner-agnostic test execution** for upstream test suite integration

## Core Architectural Principles

* **Per-wheel isolation**: Each package gets its own dedicated virtual environment for complete test isolation
* **Multi-tier validation**: Progressive testing from import → probe → upstream test suites with escalating confidence
* **Modular design**: Clear separation between configuration, dependency management, test execution, and cleanup
* **Runner agnostic**: Support for multiple test frameworks with consistent interfaces for upstream test integration
* **Graceful failure**: Comprehensive error handling with guaranteed cleanup on exceptions/interrupts
* **Reproducibility**: All wheels installed from local HTTP server, not PyPI
* **Hardware awareness**: Support for CPU and accelerator environments (CUDA, ROCm, Gaudi, TPU)

## Code Quality Standards

### Python Style & Conventions

* **Indentation**: Use 4 spaces (no tabs)
* **Import organization**: Standard library → Third-party → Local imports, with clear separation
* **Constants**: Extract ALL magic strings as module-level constants (actions, config keys, commands, messages)
* **Naming**: Use descriptive names that reflect the testing/packaging domain
* **Docstrings**: Include comprehensive module and class docstrings explaining purpose and key features

### Error Handling Patterns

* **Specific exceptions**: Always catch specific exception types, never bare `Exception`
* **Error message format**: Prefix with context like `"[ERROR]"`, `"Failed to install {package}"`
* **Subprocess handling**: Always capture stdout/stderr and log both on failures
* **Graceful degradation**: Handle missing files, network failures, and dependency conflicts gracefully
* **Cleanup on failure**: Use try/finally blocks or context managers to ensure resource cleanup

### Logging Standards

* **Logger setup**: Use `logger = logging.getLogger(__name__)` in each module
* **Log levels**: 
  - `INFO`: Normal operation status, package processing
  - `WARNING`: Non-fatal issues, missing optional files
  - `ERROR`: Failures that stop processing
  - `DEBUG`: Detailed debugging information
* **Message format**: Include context like package names, file paths, and operation types
* **Consistent formatting**: Use established message constants (e.g., `INFO_INSTALLING_WHEEL`)

## Project-Specific Guidelines

### Configuration System

* **YAML structure**: Follow the established package template structure
* **Config access**: Use `ConfigHandler` methods like `get_global()` and `get_package_value()` with defaults
* **Environment variables**: Support env var substitution in config files
* **Package naming**: YAML filenames must use PyPI package names (with hyphens)
* **Importable field**: Only set when import name differs significantly from package name

### Virtual Environment Management

* **VenvManager usage**: Always use `VenvManager` for venv operations, never manual venv commands
* **Cleanup registration**: Register all venvs with `cleanup_manager` for guaranteed cleanup
* **Per-wheel isolation**: Each wheel gets its own uniquely named venv with timestamp
* **Context managers**: Use `safe_venv_context()` for automatic cleanup
* **Path handling**: Use `Path` objects for all filesystem operations

### Dependency Handling

* **Three modes supported**:
  - `pipreqs`: Auto-extract requirements and filter out installed packages
  - `files`: Use provided requirements.txt/constraints.txt files
  - `custom`: Execute custom install/cleanup shell commands
* **Wheel installation**: Always install from local HTTP server via `DependencyHandler`
* **Exclusion lists**: Maintain `EXCLUDED_UNINSTALLS` to protect core dependencies
* **Requirements filtering**: Filter out already-installed packages before dependency installation

### Three-Tier Testing Implementation

#### Smoke Import Testing (Step 1)
* **Import exclusions**: Use `DEFAULT_IMPORT_EXCLUDES` for packages that can't be imported
* **Package format**: All exclusions use PyPI naming (hyphens, e.g., 'fastapi-cli')
* **Individual processing**: Each package tested in isolation with dedicated venv
* **Result tracking**: Use structured results with PASSED/FAILED/SKIPPED status
* **Server coordination**: Reuse wheel server across multiple package tests
* **Trigger**: Every builder modification or merge request

#### Probe Testing (Step 2) - Future Implementation
* **Lightweight API calls**: Exercise minimal functionality without extensive setup
* **Hardware independence**: Avoid GPU-heavy operations in probe tests
* **Representative coverage**: Test core functionality paths typical users would encounter
* **Fast execution**: Keep probe tests under reasonable time limits for CI integration
* **Trigger**: Every builder modification or merge request (alongside Step 1)

#### Upstream Test Suite Execution (Step 3)
* **Comprehensive validation**: Run full upstream test suites when available and reliable
* **Comparison baseline**: Compare results against official PyPI wheel test runs
* **Scoped adjustments**: Handle GPU-heavy tests or midstream validation packages appropriately
* **Operational viability**: Prefer upstream suites over probe tests when feasible
* **Trigger**: Only on addition or modification of package configurations

### Test Execution Workflow

* **Extract → Collect → Test**: Standard workflow for upstream test suites
* **Runner detection**: Automatic detection of test framework from package config
* **Command execution**: All test commands run in dedicated venvs via `run_command_in_venv()`
* **Priority support**: Optional test prioritization via `prioritization_list`
* **Result aggregation**: Consistent result collection and reporting across all runners

## File Organization & Patterns

### Directory Structure
```
src/PoC/
├── config/
│   ├── config.yaml           # Global configuration
│   └── packages/*.yaml       # Per-package configurations
├── tests/                    # Unit tests with mocking patterns
├── *.py                      # Core modules following single responsibility
```

### Module Responsibilities

* **`cli.py`**: Click-based CLI with action constants and workflow dispatch
* **`main.py`**: Entry point with logging configuration and direct execution
* **`config_handler.py`**: YAML config loading with env var substitution
* **`execute_tests.py`**: Test runner coordination and smoke testing
* **`dependency_handler.py`**: Modular dependency installation/management
* **`test_extractor.py`**: Source extraction and test collection
* **`wheels_server.py`**: Local HTTP server for wheel serving
* **`venv_manager.py`**: Virtual environment lifecycle management
* **`cleanup_manager.py`**: Guaranteed cleanup with signal handling
* **`workflows.py`**: High-level workflow orchestration

### Testing Patterns

* **Mock external dependencies**: Mock subprocess calls, file operations, and network requests
* **Test isolation**: Each test uses fresh mocks and temporary directories
* **Exception testing**: Test both success and failure scenarios
* **Configuration testing**: Test config loading, validation, and default handling
* **Integration testing**: Test complete workflows end-to-end

## Common Operations & Best Practices

### Adding New Features

* **Constants first**: Define all new constants at module level
* **Error handling**: Add comprehensive try/catch blocks with specific exceptions
* **Logging**: Add appropriate log messages for normal operation and errors
* **Testing**: Create unit tests for new functionality with proper mocking
* **Documentation**: Update docstrings and add inline comments for complex logic

### Modifying Configurations

* **Backward compatibility**: Ensure changes don't break existing package configs
* **Default values**: Provide sensible defaults for new configuration options
* **Validation**: Add validation for new config fields
* **Template updates**: Update `template.yaml` for new package creation

### Working with Packages

* **PyPI vs Import naming**: Always distinguish between package names (hyphens) and import names (underscores)
* **Exclusion management**: Use appropriate exclusion lists for non-importable packages
* **Version handling**: Support package==version format in smoke testing
* **Graph.json integration**: Support dependency graph files for bulk testing
* **Hardware targeting**: Consider CPU vs accelerator environment requirements (CUDA, ROCm, Gaudi, TPU)
* **Package prioritization**: Focus on packages with meaningful builder overrides (~15-20 initial packages)
* **Special handling**: GPU-constrained packages (torch, xformers) and midstream validation (vllm) require careful consideration

### Debugging & Troubleshooting

* **Verbose logging**: Use `--verbose` flag to enable detailed logging
* **Venv inspection**: Check venv creation and cleanup in logs
* **Server status**: Verify wheel server startup and availability
* **Config validation**: Ensure all required config fields are present

## Change Management

### Before Submitting Changes

* **Run test suite**: Execute `pytest tests/` and ensure all tests pass
* **Check linting**: Verify code follows established patterns
* **Test integration**: Run end-to-end tests with actual packages
* **Verify cleanup**: Ensure no leftover venvs or processes
* **Update documentation**: Modify relevant docstrings and comments

### Commit Practices

* **Focused commits**: Each commit should address a single concern
* **Clear messages**: Explain WHY changes were made, not just WHAT
* **Reference issues**: Link to relevant Jira tickets (e.g., AIPCC-1234)
* **AI attribution**: Include AI assistance acknowledgment when applicable

### AI Attribution

When AI assistance is used, include attribution in commits or PR descriptions:
```
Co-authored-by: Claude (Anthropic AI Assistant) <claude@anthropic.com>
```

## Critical Considerations

### Testing Strategy Impact
* **Progressive validation**: Understand that this tool supports escalating test confidence (import → probe → upstream)
* **CI/CD integration**: Changes affect Red Hat's AIPCC pipeline reliability and runtime
* **Hardware environment awareness**: Consider CPU vs accelerator testing requirements
* **Upstream test compatibility**: Ensure changes don't break upstream test suite execution
* **Baseline comparison**: Support comparing custom wheel results against official PyPI wheels

### Technical Requirements
* **Resource cleanup**: Always ensure venvs and processes are cleaned up, even on failures
* **Configuration consistency**: Maintain consistency between YAML configs and code expectations
* **Error propagation**: Don't silently ignore failures that should stop execution
* **Platform compatibility**: Consider Windows, Linux, and container environments
* **Scalability**: Design for future expansion to probe testing and broader package coverage

## Questions to Ask When Coding

### Core Architecture
1. Does this change maintain per-wheel isolation?
2. Are all resources properly cleaned up on failure?
3. Is the error handling specific and informative?
4. Are new constants extracted for maintainability?

### Testing Strategy Alignment
5. Does this support the three-tier testing strategy (import → probe → upstream)?
6. Will this work for future probe test implementation?
7. Does this maintain compatibility with upstream test suite execution?
8. Are hardware environment considerations (CPU/GPU) properly handled?

### Production Impact
9. Does this work with both local and containerized environments?
10. Will this change affect the CI/CD pipeline stability or runtime?
11. Are the logging messages consistent with existing patterns?
12. Is the configuration change backward compatible?
13. Does this scale appropriately for ~15-20 prioritized packages initially?

## Strategic Context

This tool is part of Red Hat's AIPCC initiative to validate custom-built Python wheels for AI/ML workloads across diverse hardware accelerators. Your changes directly impact:

- **Component-level validation** for downstream AI applications
- **CI/CD pipeline reliability** for Red Hat's AI package builds
- **Future expansion** to comprehensive probe and upstream testing
- **Hardware compatibility** across CPU and accelerator environments

Remember: You are responsible for all code submitted, whether human or AI-generated. This is a production system that supports Red Hat's AI package testing pipeline - quality, reliability, and strategic alignment are paramount.
