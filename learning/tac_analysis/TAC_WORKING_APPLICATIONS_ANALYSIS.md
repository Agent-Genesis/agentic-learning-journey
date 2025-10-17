# TAC Working Applications Analysis: Systems vs Scripts

**Author:** Claude Code  
**Date:** October 17, 2025  
**Purpose:** Identify infrastructure patterns that distinguish working agentic applications (systems) from standalone scripts

---

## Overview

Through analysis of three production-ready TAC applications, this document identifies the architectural patterns and infrastructure that define "systems" in agentic coding. These systems demonstrate autonomy, scalability, and systematic integration—far beyond isolated scripts.

**Key Finding:** Systems have persistent infrastructure, multi-layer orchestration, and integrated quality gates. Scripts are single-execution, stateless, and task-focused.

---

## Analysis: Three Working Applications

### 1. Multi-Agent Todone System (tac8_app2)

**Purpose:** Autonomous multi-agent task orchestration for parallel experimental workflows

**Location:** `/home/omar/Projects/learning/tac/tac-8/tac8_app2__multi_agent_todone/`

#### Directory Structure - System Foundations
```
adws/
├── adw_triggers/
│   └── adw_trigger_cron_todone.py     # PERSISTENT: Runs every N seconds
├── adw_modules/
│   └── agent.py                       # Core: Agent execution + retry logic
├── adw_build_update_task.py           # Workflow: 2-phase execution
└── adw_plan_implement_update_task.py  # Workflow: 3-phase execution

.claude/
├── commands/*.md                      # Templates: Reusable agent prompts
└── settings.json                      # Config: Hook automation

tasks.md                               # STATE: Central task tracking file
```

#### What Makes It a System

1. **Persistent State Management**
   - `tasks.md` as single source of truth
   - Status tracking: `[]`, `[🟡, adw_id]`, `[✅ hash, adw_id]`, `[❌, adw_id]`
   - Enables resumable workflows and audit trails

2. **Autonomous Orchestration**
   - Cron trigger continuously scans `tasks.md`
   - Auto-spawns agents for pending tasks
   - Respects dependencies and blocking (`[⏰]`)
   - Manages git worktrees for isolation

3. **Multi-Phase Workflows**
   - Build → Update (2-phase for simple tasks)
   - Plan → Implement → Update (3-phase for complex tasks)
   - Each phase produces observable outputs

4. **Observability & Debugging**
   - ADW IDs track every execution
   - Timestamped status panels prevent log conflicts
   - Workflow summary JSON in `agents/{adw_id}/workflow_summary.json`
   - Multi-agent parallel execution visibility

**System vs Script Distinction:**
- **Script:** `python build_model.py` → executes once → done
- **System:** Cron continuously monitors `tasks.md` → spawns agents → updates state → repeats

---

### 2. Multi-Agent Observability System (tac8_app3)

**Purpose:** Real-time monitoring infrastructure for Claude Code agent behavior across sessions

**Location:** `/home/omar/Projects/learning/tac/tac-8/tac8_app3__out_loop_multi_agent_task_board/`

#### Directory Structure - Event-Driven Architecture
```
.claude/hooks/
├── pre_tool_use.py                    # Hook: Validates tool execution
├── post_tool_use.py                   # Hook: Captures results
├── send_event.py                      # Core: Event transmission
└── settings.json                      # Orchestration: When hooks fire

apps/server/
├── src/index.ts                       # HTTP + WebSocket endpoints
├── src/db.ts                          # SQLite with WAL mode
└── events.db                          # Persistent event store

apps/client/
├── components/EventTimeline.vue       # Real-time visualization
└── composables/useWebSocket.ts        # Live data streaming
```

#### What Makes It a System

1. **Hook-Based Event Automation**
   - Pre/Post tool execution interception
   - Automatic event capture on every Claude Code action
   - No manual logging required
   - Declarative hook configuration in `settings.json`

2. **Persistent Data Architecture**
   - SQLite with WAL for concurrent access
   - Event store is permanent audit trail
   - Enables historical analysis and replay

3. **Real-Time Data Pipeline**
   - HTTP POST → SQLite → WebSocket → Vue client
   - Sub-second latency for visualization
   - Scales to multiple concurrent agents

4. **Infrastructure as Configuration**
   - `.claude/settings.json` defines automation rules
   - Copy-paste `.claude/` to new projects to replicate
   - No code changes required for adoption

**System vs Script Distinction:**
- **Script:** `./collect_events.py` → reads logs → prints output → exits
- **System:** Hook infrastructure automatically captures every event → stores persistently → broadcasts live → enables observability without manual intervention

---

### 3. Agent Layer Primitives (project/system/apps/app1)

**Purpose:** Production-grade delegation intelligence infrastructure for business orchestration

**Location:** `/home/omar/Projects/learning/tac/project/system/apps/app1__agent_layer_primitives/`

#### Directory Structure - Enterprise Scale
```
adws/
├── adw_orchestrate.py                 # Top-level: Multi-agent coordination
├── adw_delegate.py                    # Core: Delegation with authority levels
├── adw_plan_strategist.py             # Specialist: Planning layer
├── adw_quality_orchestrator.py        # Specialist: Quality gates
├── adw_modules/
│   ├── delegation_core.py             # Authority + quality framework
│   ├── git_ops.py                     # Git workflow automation
│   ├── github.py                      # GitHub integration
│   └── state.py                       # Persistent state management
├── adw_triggers/
│   ├── trigger_webhook.py             # Event-driven invocation
│   └── trigger_cron.py                # Scheduled invocation
└── adw_tests/
    └── test_agents.py                 # Automated validation

infrastructure/
├── core/                              # Core orchestration logic
└── workflows/                         # Workflow definitions

governance/
├── docs/                              # Decision records
├── quality/                           # Quality standards
└── specs/                             # Business specifications

agents/
└── {adw_id}/ → {agent_name}/ → outputs  # Per-execution artifacts

trees/                                 # Isolated git worktrees
```

#### What Makes It a System

1. **Authority & Quality Framework**
   - `AuthorityLevel.SENIOR/JUNIOR` controls execution scope
   - `QualityGate` validates outputs against business objectives
   - Strategic approval points prevent unauthorized actions
   - Business alignment verification on every delegation

2. **Multi-Trigger Invocation**
   - Cron triggers: Scheduled batch processing
   - Webhook triggers: Event-driven external invocation
   - Manual triggers: CLI invocation
   - All routes through same orchestration engine

3. **Specialist Agent Composition**
   - Planner strategist: Creates plans
   - Implementer: Executes plans
   - Quality orchestrator: Validates results
   - Agents composed into workflows, not executed in isolation

4. **Governance Integration**
   - Business config in `business_config.json`
   - Decision records in `governance/docs/`
   - Quality standards enforced via `governance/quality/`
   - Complete traceability from business objective → agent action → quality validation

5. **State Persistence & Observability**
   - `adw_state.json` tracks workflow state per execution
   - Per-agent artifacts in isolated directories
   - Comprehensive logging enabling debugging
   - Historical analysis of all delegations

**System vs Script Distinction:**
- **Script:** `./analyze_market.py` → generates report → done
- **System:** Delegation orchestrates multiple agents → each passes quality gates → aligned with business config → state persisted → auditable → repeatable → composable into larger workflows

---

## Infrastructure Pattern Summary: What Makes Systems

### The Core Four System Elements

#### 1. Persistent State Layer
- **Todone:** `tasks.md` with status markers
- **Observability:** SQLite event store
- **App1:** `adw_state.json` + workflow database
- **Key:** State survives execution; enables resumption and audit trails

#### 2. Event-Driven Orchestration
- **Todone:** Cron monitor → task spawn
- **Observability:** Hook interception → event capture
- **App1:** Webhook + cron triggers → delegation invocation
- **Key:** Autonomous response to events without manual intervention

#### 3. Multi-Layer Architecture
- **Todone:** Triggers → Workflows → Tasks → Agents
- **Observability:** Hooks → Server → Client (3-tier data pipeline)
- **App1:** Triggers → Orchestrator → Specialists → Agents
- **Key:** Abstractions enable composition and scaling

#### 4. Quality & Governance Gates
- **Todone:** Task dependencies, ADW tracking, status validation
- **Observability:** Pre/post tool validation, dangerous command blocking
- **App1:** Authority levels, quality gates, business alignment checks
- **Key:** Prevents degradation; ensures reliability at scale

### System vs Script: Clear Distinction

| Characteristic | Script | System |
|---|---|---|
| **Execution** | Run once → produce output → exit | Persistent, triggered by events, continuous operation |
| **State** | No persistent state | Central state store (db/file/config) |
| **Triggering** | Manual invocation | Cron/webhook/event-driven + manual |
| **Observability** | Print to console | Structured logging, persistence, dashboards |
| **Composition** | Standalone | Multi-component workflows, specialist agents |
| **Governance** | None | Quality gates, authority levels, validation |
| **Failure Handling** | Crash and fail | Retry logic, graceful degradation, alerting |
| **Auditability** | Lost when process exits | Complete trace of all operations |

---

## Agentic Layer vs Application Layer Split

### Universal Pattern Across All Systems

**Agentic Layer** (Orchestration & Automation):
```
.claude/commands/     # Templates
adws/                 # Workflows + orchestration
.claude/hooks/        # Event automation
```

**Application Layer** (Target Code):
```
apps/                 # Code being modified
specs/                # Application specifications
```

**Key Insight:** Systems wrap applications with orchestration. Scripts ARE applications.

---

## Lessons Learned: Building Agentic Systems

### 1. Start with Persistent State
- Not: "Run agent, get output"
- But: "Track objective, spawn agents, update state, retry on failure"

### 2. Event-Driven Over Scheduled
- Cron triggers enable batch processing
- Hook interception enables automation
- Webhook hooks enable external invocation
- Combine all three for maximum autonomy

### 3. Specialist Agents Over Generalists
- Delegate to authority-appropriate agents
- Each phase validates before next phase
- Composition enables complex workflows

### 4. Observability Is Infrastructure
- Not optional logging; part of core design
- Event store enables historical analysis
- Multi-tier visibility prevents blind spots

### 5. Quality Gates Are Non-Negotiable
- Authority levels prevent escalation
- Pre/post validation catches errors early
- Business alignment gates ensure relevance

---

## Integration Points: How Systems Connect

### Todone System
- Reads `tasks.md` (user writes tasks)
- Spawns agents via CLI
- Updates `tasks.md` with results
- **Integration:** Manual task writing + automated orchestration

### Observability System
- Captures Claude Code hook events automatically
- Stores in SQLite, broadcasts via WebSocket
- Visualized in Vue dashboard
- **Integration:** Copy `.claude/` to any project + restart server

### App1 System
- Reads `business_config.json` for authority rules
- Triggered via webhook or cron
- Delegates to specialist agents
- Updates state via persistent storage
- **Integration:** REST API for external systems + cron for batch

---

## Deliverable Conclusion

**These three applications demonstrate that agentic systems are fundamentally different from scripts:**

1. **Todone:** Demonstrates autonomous task orchestration with persistent state
2. **Observability:** Demonstrates event-driven hook automation and real-time data pipelines
3. **App1:** Demonstrates enterprise-grade orchestration with authority, quality gates, and business integration

**The system/script boundary is clear:** Systems have infrastructure (state, triggers, governance, observability). Scripts are single-execution logic.

**For sustainable agentic coding:** Build systems, not scripts. Template your engineering. Teach agents how to operate your codebase. Automate via events and orchestration. Make systems composable through specialist agents and quality gates.

