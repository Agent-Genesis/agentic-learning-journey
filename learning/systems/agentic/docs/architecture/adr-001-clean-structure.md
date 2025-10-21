# ADR-001: Clean Architecture and Software Engineering Principles

**Status**: Accepted
**Date**: 2025-10-21
**Decision Made By**: Main Agent
**Related Issues**: Task 0015, Task 0016

## Context

The project structure exhibited multiple violations of fundamental software engineering principles:
- Massive DRY violations with 16 duplicate task files
- No clear single responsibility for directories
- Mixed concerns (source vs generated content)
- No established architectural hierarchy
- Inconsistent organizational patterns

## Decision

Adopt clean architecture principles based on SOLID, DRY, KISS, and YAGNI for all file organization and project structure decisions.

## Architecture Principles

### SOLID Principles Applied to File Organization

1. **Single Responsibility Principle (SRP)**: Each directory has ONE clear purpose
2. **Open/Closed Principle (OCP)**: Structure extensible without modification
3. **Liskov Substitution Principle (LSP)**: Consistent patterns throughout
4. **Interface Segregation Principle (ISP)**: Clear boundaries between concerns
5. **Dependency Inversion Principle (DIP)**: High-level concepts independent of implementation

### Additional Principles

6. **DRY (Don't Repeat Yourself)**: Zero tolerance for duplication
7. **KISS (Keep It Simple, Stupid)**: Simple, predictable structure
8. **YAGNI (You Aren't Gonna Need It)**: Build for current requirements only
9. **Domain-Driven Organization**: Organize by business domain, not technical implementation
10. **Separation of Concerns**: Clear separation of source vs generated content

## Approved Directory Structure

```
project-root/
├── src/           # Source code & business logic
├── config/        # ALL configuration (single source)
├── tasks/         # Project management (single source)
├── docs/          # Documentation (single source)
├── scripts/       # Automation scripts (single source)
├── tests/         # Test files (single source)
├── build/         # Generated build artifacts
├── logs/          # Runtime logs (generated)
├── temp/          # Temporary files (generated)
└── .claude/       # Claude-specific configuration
```

## Consequences

### Positive
- Clear single responsibility for each directory
- Zero duplication with single sources of truth
- Consistent patterns throughout project
- Maintainable and scalable structure
- Clear dependency hierarchy

### Negative
- Requires migration effort from current structure
- Learning curve for new organizational patterns
- Initial overhead for checking compliance

## Implementation

### Phase 1: Configuration Enhancement
- ✅ Enhanced CONFIGURATION_KNOWLEDGE.md with principles
- ✅ Updated CLAUDE.md with behavioral constraints
- ✅ Created ADR documentation

### Phase 2: Content Consolidation
- Eliminate duplicate task files (.users vs tasks)
- Consolidate multiple scripts/docs directories
- Establish single sources of truth

### Phase 3: Structure Reorganization
- Implement clean directory structure
- Separate source from generated content
- Update all references and dependencies

## Compliance Requirements

### Mandatory Pre-Creation Checklist
1. Content Analysis (type, domain, existing content)
2. Duplication Check (DRY compliance)
3. Single Responsibility Validation
4. Placement Decision (based on structure)
5. Architecture Validation (SOLID principles)

### Behavioral Constraints
- NEVER create files at root without consideration
- NEVER duplicate existing content
- NEVER mix different content types
- ALWAYS follow established patterns

## Future Considerations

- All future Claude instances will have these principles integrated
- Regular architecture reviews to maintain compliance
- Evolution of principles based on project needs
- Documentation updates as patterns emerge

## Related Decisions

- ADR-002: DRY Violation Elimination (pending)
- ADR-003: Single Source of Truth Implementation (pending)

---

**This decision establishes the foundational architectural principles that will guide all future project organization and file management decisions.**