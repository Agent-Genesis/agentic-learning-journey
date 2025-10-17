# Directory Architecture Options

**Purpose:** Explore different ways to organize the agentic infrastructure
**Phase:** LEARNING - Presenting options, not making decisions
**Authority:** Omar El Mountassir will decide

---

## Current State

```sh
~/work/
├── learning/           # Where we are now
│   ├── tac_analysis/
│   ├── architecture_thinking/
│   └── decisions/
├── design/             # Phase 0 (future)
└── system/             # Phase 1+ (future)
```

**Question:** What should go in `system/` when we build it?

---

## Option A: TAC-Inspired Functional Separation

```sh
~/work/system/
├── docs/               # System documentation
│   ├── architecture.md
│   ├── capability_domains.md
│   └── api_reference.md
├── commander/          # The Commander agent
│   ├── system_prompt.py
│   ├── config.py
│   └── agent.py
├── domains/            # Capability domains
│   ├── knowledge_management/
│   │   ├── .claude/commands/
│   │   ├── adws/
│   │   ├── specs/
│   │   ├── state/
│   │   └── tests/
│   ├── business_operations/
│   │   ├── .claude/commands/
│   │   ├── adws/
│   │   ├── specs/
│   │   ├── state/
│   │   └── tests/
│   └── infrastructure/
│       ├── .claude/commands/
│       ├── adws/
│       ├── specs/
│       ├── state/
│       └── tests/
└── shared/             # Shared utilities
    ├── lib/
    ├── templates/
    └── tools/
```

**Pros:**

- Clear domain separation
- Each domain self-contained
- Follows TAC patterns
- Scalable (add domains easily)

**Cons:**

- Some duplication across domains
- Need shared utilities directory
- Deeper nesting

---

## Option B: Layered Architecture (Application/Agentic Split)

```sh
~/work/system/
├── agentic_layer/      # Orchestration infrastructure
│   ├── commander/
│   │   └── agent.py
│   ├── commands/       # All slash commands
│   ├── adws/           # All ADW orchestrators
│   ├── specs/          # All specifications
│   ├── hooks/          # Event triggers
│   └── state/          # Persistent state
├── application_layer/  # What the agentic layer builds
│   ├── knowledge_management/
│   ├── business_operations/
│   └── tools/
├── infrastructure/     # Supporting systems
│   ├── mcp_servers/
│   ├── databases/
│   └── monitoring/
└── docs/
```

**Pros:**

- Clear agentic vs application split (TAC principle)
- Follows TAC-8's 50% rule visually
- Centralized orchestration

**Cons:**

- Less modular
- Harder to reason about domain boundaries
- Mixing concerns in single directories

---

## Option C: Monorepo Style (All Separate Projects)

```sh
~/work/system/
├── packages/
│   ├── commander/          # Independent package
│   │   ├── src/
│   │   ├── tests/
│   │   └── package.json
│   ├── knowledge-management/  # Independent package
│   │   ├── src/
│   │   ├── tests/
│   │   └── package.json
│   ├── business-operations/   # Independent package
│   │   ├── src/
│   │   ├── tests/
│   │   └── package.json
│   └── shared/             # Shared package
│       ├── src/
│       ├── tests/
│       └── package.json
├── docs/
└── package.json            # Root package
```

**Pros:**

- Independent packages (true modularity)
- Can version separately
- Can publish/share individual packages
- Professional monorepo setup

**Cons:**

- More complex setup
- Requires package manager (npm/pnpm/yarn or pip/poetry)
- May be overkill for single-user system

---

## Option D: Flat Pragmatic Structure

```sh
~/work/system/
├── commander.py        # Main Commander agent
├── config.py           # Configuration
├── commands/           # All slash commands
├── workflows/          # All ADWs (renamed from adws/)
├── specs/              # All specifications
├── state/              # Persistent state
├── hooks/              # Event triggers
├── tests/              # All tests
├── docs/               # Documentation
└── lib/                # Shared utilities
```

**Pros:**

- Simple, flat structure
- Easy to navigate
- Quick to find things
- Minimal nesting

**Cons:**

- Everything mixed together
- Harder to scale
- No clear domain boundaries
- Doesn't follow TAC patterns

---

## Option E: Source/Build Separation

```sh
~/work/system/
├── src/                # Source code
│   ├── commander/
│   ├── domains/
│   └── shared/
├── .claude/            # Claude Code integration
│   └── commands/
├── build/              # Build outputs (compiled/generated)
├── deploy/             # Deployment configs
├── state/              # Runtime state (gitignored)
├── tests/
└── docs/
```

**Pros:**

- Clear separation of source vs runtime
- Standard software project structure
- Easy to .gitignore runtime state
- Familiar to developers

**Cons:**

- May not need build/ if Python
- Adds complexity
- Not TAC-specific

---

## Option F: Hybrid (Recommended)

**Combines best of Options A and B:**

```sh
~/work/system/
├── commander/          # The Commander agent
│   ├── system_prompts/
│   │   ├── learning.py
│   │   ├── design.py
│   │   ├── implementation.py
│   │   └── operations.py
│   ├── config.py
│   ├── agent.py
│   └── cli.py
│
├── domains/            # Capability domains (from Option A)
│   ├── knowledge_management/
│   │   ├── .claude/commands/
│   │   ├── adws/
│   │   ├── specs/
│   │   ├── state/
│   │   ├── tests/
│   │   └── README.md
│   ├── business_operations/
│   │   ├── .claude/commands/
│   │   ├── adws/
│   │   ├── specs/
│   │   ├── state/
│   │   ├── tests/
│   │   └── README.md
│   └── infrastructure/
│       ├── .claude/commands/
│       ├── adws/
│       ├── specs/
│       ├── state/
│       ├── tests/
│       └── README.md
│
├── shared/             # Shared infrastructure
│   ├── lib/            # Shared libraries
│   ├── templates/      # Shared templates
│   ├── tools/          # Shared MCP tools
│   └── utils/          # Utilities
│
├── hooks/              # Global event hooks
│   ├── pre_session.sh
│   ├── post_session.sh
│   └── validation_gate.sh
│
├── state/              # Global state (gitignored)
│   └── .gitkeep
│
├── tests/              # Integration tests
│   └── test_domains_integration.py
│
├── docs/               # System documentation
│   ├── architecture.md
│   ├── capability_domains.md
│   ├── commander_api.md
│   └── deployment.md
│
├── .claude/            # Claude Code integration (if needed)
│   └── settings.json
│
├── .gitignore
├── README.md
└── Makefile            # Build/run commands
```

**Pros:**

- Clear domain separation (Option A)
- Commander is separate and configurable
- Shared infrastructure for code reuse
- Follows TAC patterns
- Scalable and modular
- Professional structure

**Cons:**

- More directories than flat approach
- Requires discipline to maintain separation

**Why Hybrid:**

- Balances modularity with simplicity
- Domain-driven (clear responsibilities)
- Commander is first-class citizen
- Shared infrastructure reduces duplication
- Can version control properly
- Supports multiple capability domains
- Aligns with TAC philosophy

---

## Integration with ~/.claude/

**Question:** How should `~/work/system/` relate to `~/.claude/`?

### Option I: Separate (Recommended)

```sh
~/.claude/              # Claude Code governance
├── CLAUDE.md          # References ~/work/system/
├── protocols/
├── techniques/        # Still useful as knowledge
└── sessions/

~/work/system/         # Agentic infrastructure
├── commander/         # Custom agent via SDK
├── domains/
└── ...

# CLAUDE.md references system:
"For agentic operations, see ~/work/system/"
```

**Pros:**

- Clear separation of concerns
- ~/.claude/ = Claude Code config
- ~/work/system/ = Agentic infrastructure
- Independent versioning
- Can share ~/work/system/ as repo

**Cons:**

- Two locations to maintain
- Need to keep references in sync

### Option II: Integrated

```sh
~/.claude/
├── CLAUDE.md
├── protocols/
├── techniques/
├── system/            # ← Agentic infrastructure here
│   ├── commander/
│   ├── domains/
│   └── ...
└── sessions/
```

**Pros:**

- Everything in one place
- Single source of truth

**Cons:**

- Mixing Claude Code config with agentic infrastructure
- Harder to version control separately
- Not repo-friendly (contains sessions, state, etc.)

---

## Git Repository Structure

**If ~/work/system/ becomes a private repo:**

```sh
system/                 # Repo root
├── .git/
├── .gitignore
├── README.md
├── LICENSE
├── commander/
├── domains/
├── shared/
├── hooks/
├── tests/
└── docs/

.gitignore contains:
state/
*.pyc
__pycache__/
.env
.env.local
node_modules/
```

**Link to ~/.claude/:**

```bash
# In ~/.claude/CLAUDE.md:
"Agentic infrastructure: ~/work/system/ (git repo)"

# Optionally symlink:
ln -s ~/work/system/commander/cli.py ~/work/system/maestro
# Can invoke: ~/work/system/maestro
```

---

## Questions for Omar

### Priority 1: Main Structure

**Which main option?**

- A: TAC-Inspired (domains first)
- B: Layered (agentic/application split)
- C: Monorepo (independent packages)
- D: Flat (simple and pragmatic)
- E: Source/Build (software project)
- F: Hybrid (recommended combination)

### Priority 2: Integration

**How should ~/work/system/ relate to ~/.claude/?**

- I: Separate (recommended)
- II: Integrated (system/ inside ~/.claude/)

### Priority 3: Versioning

**Should ~/work/system/ be a git repo?**

- Yes (private GitHub repo)
- Yes (local git only)
- No (no version control)

**If yes:**

- Public or private repo?
- What should .gitignore?
- Should it be shareable?

---

## Recommendation

**Use Option F (Hybrid) with Separation (Option I):**

```sh
~/.claude/              # Claude Code governance (local only)
~/work/system/          # Agentic infrastructure (git repo)
```

**Rationale:**

1. **Hybrid structure** balances modularity with simplicity
2. **Domain-driven** aligns with capability domains thinking
3. **Separation** keeps concerns distinct
4. **Repo-friendly** for private GitHub
5. **Scalable** as system grows
6. **TAC-aligned** follows course patterns

**This gives Omar:**

- Clear organization
- Sharable infrastructure (if desired)
- Independent versioning
- Professional structure
- Room to grow

---

**Status:** ⏳ Awaiting Omar's decision on directory architecture
**Created:** 2025-10-17
**Phase:** LEARNING - Architecture options
