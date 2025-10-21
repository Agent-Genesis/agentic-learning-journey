# ADR-002: DRY Violation Elimination

**Status**: In Progress
**Date**: 2025-10-21
**Decision Made By**: Main Agent
**Related Issues**: Task 0015, Task 0016, ADR-001

## Context

The project contained significant DRY (Don't Repeat Yourself) violations:

### Identified Duplications
1. **Task Files**: 16 duplicate files between `tasks/` and `.users/admin/reports/issues/`
2. **Scripts Directories**: Multiple `scripts/` directories with overlapping content
3. **Documentation**: Multiple `docs/` directories with similar content
4. **Configuration**: Scattered configuration files across multiple locations

### Impact
- Maintenance overhead (updates in multiple places)
- Conflicting information between duplicates
- Navigation complexity
- Storage inefficiency
- Cognitive load for users

## Decision

Eliminate all DRY violations by establishing single sources of truth for each content type and consolidating duplicated content.

## Elimination Strategy

### Phase 1: Task File Consolidation
**Current State**:
- `tasks/TASKS.md` (consolidated dashboard)
- `.users/admin/reports/issues/0001.md` through `0016.md` (individual files)

**Action**:
- Preserve `tasks/TASKS.md` as single source of truth
- Archive `.users/admin/reports/issues/` directory
- Create backup reference if needed

### Phase 2: Scripts Directory Consolidation
**Current State**:
- `scripts/` (project-level automation)
- `tasks/scripts/` (task-specific automation)

**Action**:
- Consolidate all scripts into single `scripts/` directory
- Organize by function: `scripts/build/`, `scripts/deploy/`, `scripts/tasks/`
- Update all script references

### Phase 3: Documentation Consolidation
**Current State**:
- `docs/` (general documentation)
- `tasks/docs/` (task-specific documentation)

**Action**:
- Consolidate all documentation into single `docs/` directory
- Organize by type: `docs/architecture/`, `docs/guides/`, `docs/api/`
- Maintain clear categorization

### Phase 4: Configuration Centralization
**Current State**:
- `CONFIGURATION_KNOWLEDGE.md` (root)
- `.mcp.json` (root)
- Various config files scattered

**Action**:
- Consolidate all configuration into `config/` directory
- Maintain `CONFIGURATION_KNOWLEDGE.md` at root for visibility
- Update all configuration references

## Implementation Rules

### DRY Compliance Checklist
1. **Search Before Create**: Always search for existing content before creating new
2. **Single Source Policy**: Each content type has exactly one location
3. **Reference Strategy**: Use references/symlinks instead of duplication
4. **Update Protocol**: Update content at source, not duplicates

### Content Type Classification
- **Source Content**: Code, documentation, configuration, tasks
- **Generated Content**: Logs, build artifacts, temporary files
- **Reference Content**: Links, shortcuts, external references

## Migration Process

### Step 1: Backup Creation
- Create complete backup of current structure
- Document current duplications for reference
- Establish rollback capability

### Step 2: Content Analysis
- Identify all duplicate content
- Determine canonical source for each content type
- Map migration paths for consolidation

### Step 3: Consolidation Execution
- Move content to canonical locations
- Update all references and dependencies
- Validate functionality after consolidation

### Step 4: Cleanup
- Remove duplicate files and directories
- Clean up broken references
- Update documentation

## Success Metrics

### Quantitative
- Zero duplicate files (target: 100% DRY compliance)
- Single location per content type
- Reduced file count by eliminating duplicates

### Qualitative
- Simplified navigation and maintenance
- Clear information architecture
- Reduced cognitive load
- Improved consistency

## Risk Mitigation

### Backup Strategy
- Complete backup before any deletion
- Step-by-step validation after each consolidation
- Rollback capability at each stage

### Functionality Preservation
- All existing functionality preserved
- Scripts and tools updated to work with new structure
- Dependencies and references maintained

## Future Prevention

### Configuration Integration
- Enhanced CONFIGURATION_KNOWLEDGE.md with DRY principles
- Pre-creation checklist includes duplication check
- Behavioral constraints for Claude instances

### Process Enforcement
- Mandatory duplication checks before content creation
- Regular architecture reviews for DRY compliance
- Automated detection of potential duplications

---

**This decision establishes zero tolerance for duplication and implements a systematic approach to maintaining single sources of truth.**