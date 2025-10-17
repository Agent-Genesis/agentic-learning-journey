# TAC Advanced Tactics Analysis: TAC-7 & TAC-8

**Version:** 1.0  
**Created:** 2025-10-17  
**Focus:** Zero-Touch Engineering (TAC-7) and Prioritize Agentics (TAC-8)

---

## TAC-7: Target Zero-Touch Engineering (ZTE)

### What Does "Zero-Touch" Mean?

Zero-Touch Engineering represents the ultimate goal of agentic coding: **GitHub issues automatically become shipped features without human intervention in the code lifecycle.**

**The Evolution:**
- **In-Loop**: Human writes, AI assists (traditional AI coding)
- **Out-Loop**: Agent writes, human reviews (advanced agentic coding) - **2 touchpoints**: Prompt + Review
- **Zero-Touch**: Agent writes AND ships, human only prompts - **1 touchpoint**: Prompt only

The key innovation is reducing human touchpoints from 2 to 1, eliminating the review gate entirely through structured automation.

### Infrastructure That Enables Zero-Touch

#### 1. **Composable Agentic Primitives**

ZTE isn't traditional SDLC—it's composable primitives that can be arranged for any engineering problem:

```
Plan → Build → Test → Review → Document → Ship
```

Each primitive:
- Can execute independently
- Combines in different sequences
- Maintains state via `adw_state.json`
- Chains through persistent context

**Single-phase scripts**: `adw_plan_iso.py`, `adw_build_iso.py`, `adw_test_iso.py`, etc.  
**Multi-phase compositions**: `adw_plan_build_test_iso.py`, `adw_plan_build_test_review_iso.py`  
**Complete ZTE**: `adw_sdlc_zte_iso.py` (Plan → Build → Test → Review → Document → Ship)

#### 2. **Git Worktree Isolation Strategy**

Each ADW (AI Developer Workflow) instance gets complete isolation:

```
trees/
├── a1b2c3d4/    # ADW instance 1 (isolated git worktree)
├── e5f6g7h8/    # ADW instance 2 (separate branch, ports)
└── ...          # Up to 15 concurrent instances
```

**Benefits:**
- No file conflicts between parallel agents
- Dedicated port ranges (backend: 9100-9114, frontend: 9200-9214)
- Independent git branches and commit histories
- Safe parallel execution without interference
- Deterministic port allocation: `backend_port = 9100 + (adw_hash % 15)`

#### 3. **State-Driven Orchestration**

Persistent state in `agents/{adw_id}/adw_state.json` enables:

```json
{
  "adw_id": "cc73faf1",
  "issue_number": 47,
  "branch_name": "adw-cc73faf1-issue-47",
  "current_phase": "ship",
  "status": "success",
  "worktree_path": "/path/to/trees/cc73faf1",
  "backend_port": 9100,
  "frontend_port": 9200
}
```

**Enables:**
- Phase continuation after failures
- Workflow orchestration between scripts
- Resource allocation tracking
- Complete audit trails

#### 4. **Complete Automation Pipeline**

The `adw_sdlc_zte_iso.py` script demonstrates true ZTE:

1. **Plan**: Analyze issue, generate implementation plan
2. **Build**: Execute plan, make code changes
3. **Test**: Run all tests, fix failures automatically
4. **Review**: Validate against specifications
5. **Document**: Generate feature documentation
6. **Ship**: Create PR, merge automatically

### ZTE Key Features

- **No Human Intervention**: Runs completely autonomously from GitHub issue to production
- **Automatic Failure Recovery**: Each phase includes self-healing mechanisms
- **Quality Gates**: Won't proceed if critical checks fail
- **Automatic Shipping**: Creates and merges PRs automatically
- **Comprehensive Logging**: Full audit trail of all actions

### TAC-7 Application: Zero-Touch Knowledge Management

**For governance files:**
- Specifications trigger automatic documentation generation
- Tests trigger automatic validation and coverage reports
- Changes trigger automatic cross-reference updates
- No manual review needed for routine updates

---

## TAC-8: Prioritize Agentics (The Meta-Tactic)

### The 50%+ Rule

**Tactic #8 core principle**: Spend 50%+ of your engineering time building the **agentic layer** rather than the **application layer.**

**The insight**: When you reach maturity, your agentic layer becomes exponentially more valuable than individual application features.

### The Agentic Layer Ring

Imagine a ring around your codebase:
- **Initially**: Thin, not very useful
- **As you build**: Layer grows thicker
- **At scale**: Layer becomes exponentially more valuable
- **At maturity**: Layer multiplies value of all future work

### Two Distinct Layers

**1. Application Layer** (Traditional Development)
- DevOps, infrastructure, databases
- Actual raw application code
- What users interact with
- Problem-specific implementation

**2. Agentic Layer** (Meta-Infrastructure)
- Systems that operate on the application layer
- Orchestration, automation, workflow engines
- Infrastructure templates and commands
- Problem class solutions, not one-offs

**The Irreplaceable Engineer**: Operates on the agentic layer 50%+ of the time, not on application code.

### Minimum Viable Agentic Layer

To get started, you only need:

```
specs/              # Plans for agents to follow
.claude/commands/   # Agentic prompts (slash commands)
adws/               # AI Developer Workflows (orchestration scripts)
```

This minimal set provides:
- **Plans**: Structured specifications guiding agent actions
- **Prompts**: Reusable templates for agent interactions
- **Workflows**: Executable scripts orchestrating agents

### Five TAC-8 Application Demonstrations

**1. Agent Layer Primitives (tac8_app1)**
- Minimum viable agentic layer + scaled production version
- All 12 leverage points demonstrated
- Learning: Start minimal, scale systematically

**2. Multi Agent Todone (tac8_app2)**
- Parallel agents across multiple worktrees
- Task management in `tasks.md`
- Status tracking with commit hashes
- Learning: Agents work in parallel when properly isolated

**3. Out Loop Multi Agent Task Board (tac8_app3)**
- Web-based visual task orchestration
- Hook-based event tracking (Claude Code integration)
- Real-time agent status monitoring
- Learning: Visual interfaces enable oversight while maintaining out-loop

**4. Agentic Prototyping (tac8_app4)**
- Rapid application generation from natural language
- Framework-specific `/plan_[prototype]` commands
- Notion-based task automation
- Prototype types: `uv_script`, `vite_vue`, `bun_scripts`, `uv_mcp`
- Learning: Agentic layer enables 10x rapid prototyping

**5. NLQ to SQL AEA (tac8_app5)**
- Advanced autonomous architecture
- Complete workflow automation
- Learning: Sophisticated applications run entirely through agentic layer

### Problem Classes vs One-Offs

**Key Insight**: Focus on problem classes, not individual fixes.

**One-off thinking:**
- Fix this bug
- Build this feature
- Update this file
- Requires intervention each time

**Problem class thinking:**
- Template for all bugs like this
- Meta-prompts solving entire feature categories
- Workflows that handle classes of problems
- Scales with each new problem in class

### The Gateway Script

The gateway script is your entry point into agentic coding—distinctly different because it calls agents rather than executing logic:

```python
# Gateway script example
agent_result = call_claude_agent(
    prompt_template="implement_feature",
    context=feature_spec,
    tools=["read", "write", "bash"]
)
```

This surrounds any unit of code, progressively moving you out of the loop.

### Parabolic Value Curve

Building an agentic layer provides parabolic returns:

| Phase | Input | Output | Status |
|-------|-------|--------|--------|
| Start | 0 hours | 0 value | Thin layer, not useful |
| Build | 10 min workflows | +30 min value | Layer becoming useful |
| Scale | 1 hour infrastructure | +5 hour value | Exponential multiplication |
| Mature | 2 hour investment | +20 hour value | Compounds on previous layers |

### Agentic Layer Architecture Pattern (tac8_app4)

**Real-world example**: Notion-based rapid prototyping system

```
Cron Monitor → Detects Prototype Tags → Routes to Specialized Planning
    ↓
Framework-Specific Commands (/plan_vite_vue, /plan_uv_script, etc.)
    ↓
Isolated Worktree Creation (git worktree for parallel execution)
    ↓
Parallel Agent Execution (multiple prototypes simultaneously)
    ↓
Notion Updates (automatic status tracking)
    ↓
Generated Applications (production-ready code)
```

**Components:**
- **Continuous Monitoring**: Polls every 15 seconds for new tasks
- **Task Routing**: Detects `{{prototype: type}}` tags, routes to specialized workflows
- **Worktree Isolation**: Each task gets isolated git worktree
- **Specialized Commands**: Framework templates understand patterns (Vue 3, Bun, Python UV, MCP)
- **Parallel Execution**: Multiple agents work simultaneously
- **Automatic Updates**: Results tracked back to Notion

---

## How TAC-7 and TAC-8 Compound

### TAC-7 Infrastructure Powers TAC-8 Scalability

**TAC-7 provides:**
- Composable primitives (Plan, Build, Test, Review, Document, Ship)
- Isolation mechanisms (git worktrees, port allocation)
- State persistence (adw_state.json)
- Complete automation (ZTE pipeline)

**TAC-8 leverages this for:**
- Problem class solutions (not one-offs)
- Parallel agentic execution
- Scaled infrastructure
- Minimal viable layer growing to sophisticated systems

### Synthesis of All TAC Tactics

**TAC-1: Stop Coding** → Agents do coding, you orchestrate  
**TAC-2: Agent Perspective** → 12 leverage points multiply through infrastructure  
**TAC-3: Template Engineering** → Meta-prompts solve problem classes  
**TAC-4: Out Loop** → Autonomous workflows with AFK operation  
**TAC-5: Feedback Loops** → Self-correcting systems with automatic recovery  
**TAC-6: One Agent, One Purpose** → Specialized, composable primitives  
**TAC-7: Zero-Touch** → Complete automation with single touchpoint  
**TAC-8: Prioritize Agentics** → All tactics unified as infrastructure

---

## Application to Knowledge Management

### Current State: Application Layer Focused
- Manual governance document updates
- Human-maintained cross-references
- Static specification files
- Time-intensive consistency checks

### TAC-7 Transformation: Zero-Touch Governance
- Specifications trigger automatic updates
- Changes auto-propagate across related docs
- Tests validate documentation accuracy
- PRs merge automatically when quality gates pass

### TAC-8 Transformation: Agentic Governance Layer

**Minimum Viable Layer:**
```
specs/governance/              # Governance specifications
.claude/commands/
  ├── /validate_governance     # Consistency checking
  ├── /update_cross_refs       # Auto-update references
  └── /generate_summary        # Auto-generate documentation
adws/
  ├── adw_governance_monitor.py   # Watch for changes
  └── adw_apply_governance.py     # Apply governance rules
```

**Parabolic Value:**
- **Week 1**: Basic automation (10 min investment, +30 min value)
- **Week 4**: Problem classes solved (1 hour infrastructure, +5 hour value)
- **Quarter 1**: Governance self-maintains (2 hour investment, +20 hour value)

---

## The Single Guiding Question

At the end of the TAC journey:

**"Am I investing enough time in my agentic layer?"**

If spending < 50% of engineering time on agentic layer infrastructure, you're operating below optimal leverage.

---

## Key Takeaways

| Dimension | TAC-7 | TAC-8 |
|-----------|-------|-------|
| **Focus** | Eliminate human review gate | Build layer operating on application |
| **Mechanism** | Composable primitives + isolation | Problem classes + minimal viable layer |
| **Goal** | 1 touchpoint (prompt only) | 50% time on agentic, 50% on application |
| **Architecture** | Complete SDLC automation | Infrastructure that scales autonomously |
| **Value Curve** | Linear (each feature ships automatically) | Parabolic (layer multiplies over time) |
| **Scaling** | 15 parallel ADW instances | Unlimited agents, single infrastructure |

---

**The Future of Engineering**: Humans define problems and standards, autonomous systems execute at scale with quality gates and automatic recovery. ZTE (TAC-7) provides the execution model; prioritizing agentics (TAC-8) provides the sustainability model.

