# TAC Scripts vs Systems: Definitive Criteria

**Version:** 1.0
**Date:** 2025-10-17
**Purpose:** Clear criteria to distinguish "scripts" from "systems" in Tactical Agentic Coding (TAC)
**Source:** Synthesis of TAC Lessons 1-8, production applications analysis, and integration patterns

---

## Executive Summary

In TAC, the distinction between "scripts" and "systems" is fundamental to understanding agentic coding mastery. **Scripts** are single-execution solutions that solve individual problems. **Systems** are persistent infrastructure that solve problem classes autonomously. This document provides actionable criteria to classify your work and a progression path from scripts to systems.

**Key Insight:** Systems have persistent state, event-driven orchestration, multi-layer architecture, and quality gates. Scripts are stateless, manually triggered, single-purpose, and lack governance.

---

## Part 1: Core Definitions

### What is a Script?

**Definition:** A script is a single-execution program that performs a specific task once when invoked manually, produces output, and exits without maintaining state.

**Core Characteristics:**
- **Execution Model:** Run once → produce output → exit
- **State Management:** No persistent state between executions
- **Triggering:** Manual invocation only
- **Problem Scope:** Solves individual problems, not problem classes
- **Composability:** Standalone, not part of larger orchestration
- **Improvement:** Forgotten after execution, doesn't get better over time
- **Autonomy Level:** Requires human intervention for each execution

**TAC Quote:**
> "Avoid ad hoc prompts that can't be improved. Build reusable, version-controlled prompts and templates that get better with each execution."
> - TAC Lesson 4: AFK Agents

**Example Script:**
```python
# Script: One-off bug fix
import subprocess

def fix_payment_bug():
    """Manually invoked to fix specific payment bug once"""
    subprocess.run(["claude", "code", "--prompt", "Fix the payment timeout bug in line 47"])
    print("Bug fix attempted. Check results manually.")

if __name__ == "__main__":
    fix_payment_bug()
```

**What Makes It a Script:**
- Manual execution required
- No state persistence
- Solves one specific bug, not a class of bugs
- Human must verify results
- Not reusable for similar problems

---

### What is a System?

**Definition:** A system is persistent infrastructure that autonomously solves entire problem classes through event-driven orchestration, maintains state, and improves over time.

**Core Characteristics:**
- **Execution Model:** Persistent, triggered by events (cron/webhook/state changes), continuous operation
- **State Management:** Central state store (database/files/config) survives execution
- **Triggering:** Event-driven + cron + webhook + manual (multi-modal)
- **Problem Scope:** Solves entire problem CLASSES, not individual problems
- **Composability:** Multi-component workflows, specialist agents coordinate
- **Improvement:** Version-controlled, improves with each iteration
- **Autonomy Level:** Operates without human intervention, self-corrects failures

**TAC Quote:**
> "Focus on building ADWs that solve classes of problems rather than individual issues. This approach scales your engineering efforts and creates reusable autonomous workflows."
> - TAC Lesson 4: Stay Out The Loop

**Example System:**
```python
# System: Autonomous payment bug resolution infrastructure
import json
from pathlib import Path

class PaymentBugResolutionSystem:
    """Autonomous system solving entire class of payment bugs"""
    
    def __init__(self):
        self.state_file = Path("adws/payment_system_state.json")
        self.bug_template = Path(".claude/commands/payment-bug-fix.md")
        self.test_suite = Path("tests/payment/")
        self.load_state()
    
    def load_state(self):
        """Persistent state survives execution"""
        if self.state_file.exists():
            self.state = json.loads(self.state_file.read_text())
        else:
            self.state = {"bugs_resolved": 0, "success_rate": 0.0, "patterns": []}
    
    def monitor_payment_issues(self):
        """Event-driven: Continuously monitors for payment bugs"""
        # Triggered by webhook, cron, or event system
        issues = self.detect_payment_issues()
        for issue in issues:
            self.resolve_payment_bug_class(issue)
    
    def resolve_payment_bug_class(self, issue):
        """Solves entire class using templates, not one-offs"""
        # Use template for problem class
        plan = self.generate_fix_plan(issue, template=self.bug_template)
        implementation = self.execute_fix(plan)
        tests = self.validate_fix(implementation, test_suite=self.test_suite)
        
        if tests.passed:
            self.update_state(success=True, pattern=issue.pattern)
            self.auto_merge()
        else:
            self.retry_with_enhanced_context(issue)
    
    def update_state(self, success, pattern):
        """State persists, system improves over time"""
        self.state["bugs_resolved"] += 1
        if pattern not in self.state["patterns"]:
            self.state["patterns"].append(pattern)
        self.state_file.write_text(json.dumps(self.state, indent=2))
```

**What Makes It a System:**
- Event-driven execution (monitors continuously)
- Persistent state (tracks history, patterns, success rate)
- Solves problem classes (all payment bugs, not just one)
- Self-correcting (retries on failure)
- Autonomous operation (no human intervention needed)
- Improves over time (learns patterns)

---

## Part 2: Classification Rubric

Use this rubric to classify whether your work is a **script** or a **system**:

### Dimension 1: State Management

| Criterion | Script | System |
|-----------|--------|--------|
| **Persistence** | No state between runs | Central state store (JSON/DB/files) |
| **History** | No execution history | Complete audit trail of all operations |
| **Resumption** | Cannot resume after failure | Can continue from last successful phase |
| **Learning** | Doesn't improve over time | Learns patterns, improves with each run |

**Scoring:**
- ✅ System: Has persistent state file(s) or database
- ❌ Script: All state lost when process exits

---

### Dimension 2: Execution & Triggering

| Criterion | Script | System |
|-----------|--------|--------|
| **Invocation** | Manual only (`./script.py`) | Event-driven (cron/webhook/hooks) + manual |
| **Operation Mode** | One-shot execution → exit | Continuous/long-running or triggered autonomously |
| **Scheduling** | No scheduling capability | Cron triggers, scheduled batch processing |
| **Event Response** | Cannot respond to events | Hook interception, webhook endpoints |

**Scoring:**
- ✅ System: Has at least one automated trigger (cron/webhook/hook)
- ❌ Script: Only runs when human types command

---

### Dimension 3: Problem Scope & Reusability

| Criterion | Script | System |
|-----------|--------|--------|
| **Problem Type** | Individual problem (fix THIS bug) | Problem class (fix ALL bugs of TYPE X) |
| **Reusability** | Single use or minimal reuse | Solves multiple problems of same class |
| **Templates** | Hardcoded logic | Version-controlled templates in `.claude/commands/` |
| **Abstraction** | Concrete implementation | Problem-class abstraction with parameters |

**Scoring:**
- ✅ System: Uses templates from `.claude/commands/` or similar
- ❌ Script: Hardcoded for specific instance

---

### Dimension 4: Composition & Architecture

| Criterion | Script | System |
|-----------|--------|--------|
| **Layers** | Single layer (application logic only) | Multi-layer (strategic/agentic/application) |
| **Composition** | Standalone, not composable | Specialist agents coordinated into workflows |
| **Orchestration** | No orchestration needed | Orchestrates multiple components/agents |
| **Modularity** | Monolithic | Modular with `adws/adw_modules/` |

**Scoring:**
- ✅ System: Has directory structure like `adws/`, `adws/adw_modules/`, orchestration scripts
- ❌ Script: Single file or minimal structure

---

### Dimension 5: Quality & Governance

| Criterion | Script | System |
|-----------|--------|--------|
| **Validation** | Manual testing only | Automated validation layers (4-7 layers) |
| **Error Handling** | Basic or none | Comprehensive error handling + retry logic |
| **Quality Gates** | No quality gates | Authority levels, quality gates, validation |
| **Observability** | Print to console | Structured logging, metrics, dashboards |
| **Governance** | No governance | Specs, decision records, business alignment |

**Scoring:**
- ✅ System: Has test suite, validation layers, structured logging
- ❌ Script: Minimal or no testing infrastructure

---

### Dimension 6: Autonomy & Self-Correction

| Criterion | Script | System |
|-----------|--------|--------|
| **Autonomy Level** | Requires human for each execution | Operates autonomously 24/7 |
| **Failure Handling** | Crashes and stops | Graceful degradation, automatic retry |
| **Self-Correction** | No self-correction | Test-resolve-retry loops, feedback mechanisms |
| **Human Touchpoints** | Multiple (prompt, execute, review, fix) | Minimal (1-2 touchpoints) or zero-touch |

**Scoring:**
- ✅ System: Can run for hours/days without human intervention
- ❌ Script: Needs human for each step

---

## Part 3: Classification Decision Tree

Use this decision tree to classify your work:

```
START: Is this a script or system?
│
├─ Q1: Does it maintain state between executions?
│   ├─ NO → Likely Script (continue to Q2 for confirmation)
│   └─ YES → Continue to Q2
│
├─ Q2: Is it triggered automatically (cron/webhook/hooks)?
│   ├─ NO → Likely Script (continue to Q3 for confirmation)
│   └─ YES → Continue to Q3
│
├─ Q3: Does it solve a problem CLASS or individual problem?
│   ├─ Individual → Likely Script (continue to Q4 for confirmation)
│   └─ Problem Class → Continue to Q4
│
├─ Q4: Does it use templates from `.claude/commands/` or similar?
│   ├─ NO → Likely Script (continue to Q5 for confirmation)
│   └─ YES → Continue to Q5
│
├─ Q5: Does it have automated validation/testing?
│   ├─ NO → Likely Script (continue to Q6 for confirmation)
│   └─ YES → Continue to Q6
│
└─ Q6: Can it operate autonomously for extended periods?
    ├─ NO → SCRIPT
    └─ YES → SYSTEM

SCORING:
- 0-2 YES answers → Script
- 3-4 YES answers → Hybrid (script with system elements)
- 5-6 YES answers → System
```

---

## Part 4: Examples from TAC Course Materials

### Example 1: Script - One-off Payment Fix

**Context:** Fix a specific payment timeout bug in production

```python
# adw_fix_payment_timeout.py
import subprocess

def fix_payment_timeout():
    result = subprocess.run([
        "claude", "code",
        "--prompt", "Fix payment timeout in checkout.py line 47"
    ])
    return result.returncode == 0

if __name__ == "__main__":
    success = fix_payment_timeout()
    print(f"Fix {'successful' if success else 'failed'}")
```

**Classification: SCRIPT**
- ❌ No persistent state
- ❌ Manual invocation only
- ❌ Solves individual problem (one specific bug)
- ❌ No template reuse
- ❌ No automated validation
- ❌ Not autonomous

**Decision Tree Score:** 0/6 → Script

---

### Example 2: Hybrid - Template-Based Feature Implementation

**Context:** Using template to implement a feature, but still manual

```python
# adw_implement_feature.py
import subprocess
from pathlib import Path

def implement_feature(feature_spec):
    template = Path(".claude/commands/feature.md").read_text()
    prompt = template.format(spec=feature_spec)
    
    result = subprocess.run([
        "claude", "code",
        "--prompt", prompt
    ])
    
    return result.returncode == 0

if __name__ == "__main__":
    spec = Path("specs/user-authentication.md").read_text()
    implement_feature(spec)
```

**Classification: HYBRID (Script with System Elements)**
- ❌ No persistent state
- ❌ Manual invocation only
- ✅ Uses template (solves feature class)
- ✅ Template from `.claude/commands/`
- ❌ No automated validation
- ❌ Not autonomous

**Decision Tree Score:** 2/6 → Hybrid

---

### Example 3: System - Multi-Agent Todone (TAC-8 App)

**Context:** Autonomous task orchestration system from TAC-8

**Directory Structure:**
```
adws/
├── adw_triggers/
│   └── adw_trigger_cron_todone.py    # Cron: Runs every N seconds
├── adw_modules/
│   └── agent.py                       # Core agent execution
├── adw_build_update_task.py           # Workflow orchestration
└── adw_plan_implement_update_task.py
.claude/commands/                      # Templates
tasks.md                               # STATE: Central task tracking
```

**Key System Code:**
```python
# adw_trigger_cron_todone.py
import time
import json
from pathlib import Path

class TodoneSystem:
    def __init__(self):
        self.state_file = Path("tasks.md")
        self.state = self.load_state()
    
    def load_state(self):
        """Persistent state from tasks.md"""
        return Path("tasks.md").read_text()
    
    def monitor_continuously(self):
        """Event-driven: Cron trigger every 15 seconds"""
        while True:
            pending_tasks = self.find_pending_tasks()
            for task in pending_tasks:
                self.spawn_agent(task)
            time.sleep(15)
    
    def spawn_agent(self, task):
        """Autonomous agent execution"""
        adw_id = self.generate_adw_id()
        worktree = self.create_isolated_worktree(adw_id)
        self.execute_workflow(task, worktree, adw_id)
        self.update_state(task, adw_id, status="in_progress")
```

**Classification: SYSTEM**
- ✅ Persistent state (`tasks.md` with status tracking)
- ✅ Event-driven (cron triggers every 15 seconds)
- ✅ Solves problem class (all tasks in `tasks.md`)
- ✅ Uses templates from `.claude/commands/`
- ✅ Automated validation (updates state on success/failure)
- ✅ Autonomous (runs 24/7 without human intervention)

**Decision Tree Score:** 6/6 → System

---

### Example 4: System - Zero-Touch Engineering (TAC-7)

**Context:** Complete SDLC automation from GitHub issue to merged PR

**Directory Structure:**
```
adws/
├── adw_sdlc_zte_iso.py              # Complete ZTE pipeline
├── adw_modules/
│   ├── agent.py, state.py, git_ops.py, github.py
│   └── workflow_ops.py
├── adw_plan_iso.py, adw_build_iso.py, adw_test_iso.py
├── adw_review_iso.py, adw_document_iso.py, adw_ship_iso.py
└── adw_triggers/
    └── trigger_webhook.py            # GitHub webhook integration

.claude/commands/                     # Specialized templates per phase
specs/                                # Agent-generated specifications
agents/{adw_id}/adw_state.json       # Per-execution state
trees/                                # Git worktree isolation
```

**Key System Code:**
```python
# adw_sdlc_zte_iso.py (simplified)
import json
from pathlib import Path

class ZeroTouchEngineeringSystem:
    def __init__(self, issue_number):
        self.adw_id = self.generate_adw_id()
        self.state_file = Path(f"agents/{self.adw_id}/adw_state.json")
        self.state = self.init_state(issue_number)
    
    def init_state(self, issue_number):
        """Persistent state across all SDLC phases"""
        return {
            "adw_id": self.adw_id,
            "issue_number": issue_number,
            "current_phase": "plan",
            "phases_completed": [],
            "confidence": 0.0,
            "worktree_path": None,
            "backend_port": 9100 + (hash(self.adw_id) % 15),
            "frontend_port": 9200 + (hash(self.adw_id) % 15)
        }
    
    def execute_zero_touch_pipeline(self):
        """Complete autonomous SDLC"""
        phases = ["plan", "build", "test", "review", "document", "ship"]
        
        for phase in phases:
            self.state["current_phase"] = phase
            success = self.execute_phase(phase)
            
            if success:
                self.state["phases_completed"].append(phase)
                self.state["confidence"] = self.calculate_confidence()
                self.save_state()
            else:
                self.resolve_failure_autonomously(phase)
                # Retry or escalate
        
        # Ship automatically if confidence >= 90%
        if self.state["confidence"] >= 0.90:
            self.auto_ship()
    
    def calculate_confidence(self):
        """Quality gate: Only ship if confident"""
        validation_coverage = len(self.state["phases_completed"]) / 6
        test_pass_rate = self.get_test_pass_rate()
        return (validation_coverage * 0.6) + (test_pass_rate * 0.4)
```

**Classification: SYSTEM (Enterprise-Grade)**
- ✅ Persistent state (`adw_state.json` across phases)
- ✅ Event-driven (GitHub webhooks trigger automatically)
- ✅ Solves problem class (any feature/bug/chore from GitHub)
- ✅ Templates for each SDLC phase in `.claude/commands/`
- ✅ Comprehensive validation (7 layers)
- ✅ Fully autonomous (GitHub issue → merged PR, zero human review)

**Decision Tree Score:** 6/6 → System (Enterprise-Grade)

**Additional System Characteristics:**
- Git worktree isolation (parallel execution)
- State-driven orchestration (resumes after failures)
- Automatic failure resolution (self-correcting)
- Quality gates (won't ship unless confidence >= 90%)
- Complete observability (logs, metrics, audit trails)

---

## Part 5: Infrastructure Comparison Table

| Infrastructure Component | Script | System |
|-------------------------|--------|--------|
| **Directory Structure** | Single file or flat structure | `adws/`, `adw_modules/`, `.claude/`, `specs/` |
| **State Management** | None or in-memory only | `adw_state.json`, `tasks.md`, SQLite database |
| **Templates** | Hardcoded prompts | Version-controlled in `.claude/commands/` |
| **Triggers** | Manual execution | `adw_triggers/` (cron, webhook, hooks) |
| **Orchestration** | Sequential logic in one file | Multi-phase workflows with state persistence |
| **Validation** | Print statements | Test suites, validation layers, confidence scoring |
| **Failure Handling** | Exit on error | Retry logic, progressive resolution, escalation |
| **Observability** | Console logs | Structured logging, metrics, dashboards, audit trails |
| **Governance** | None | Specs, quality gates, authority levels, business alignment |
| **Composition** | Standalone | Specialist agents, composable primitives, ADW chains |

---

## Part 6: Capabilities Comparison

### What Scripts Can Do
- ✅ Execute a specific task once
- ✅ Automate repetitive manual work
- ✅ Chain a few commands together
- ✅ Provide basic error handling
- ✅ Run deterministically (same input → same output)

### What Scripts CANNOT Do
- ❌ Operate autonomously 24/7
- ❌ Solve entire problem classes
- ❌ Improve over time
- ❌ Self-correct failures
- ❌ Compose into larger orchestrations
- ❌ Maintain state across executions
- ❌ Respond to events automatically

### What Systems Can Do
- ✅ Everything scripts can do, PLUS:
- ✅ Operate autonomously without human intervention
- ✅ Solve entire problem classes systematically
- ✅ Improve with each execution (learning)
- ✅ Self-correct through feedback loops
- ✅ Compose into complex orchestrations
- ✅ Maintain persistent state and audit trails
- ✅ Respond to events (webhooks, cron, hooks)
- ✅ Coordinate multiple specialist agents
- ✅ Enforce quality gates and governance
- ✅ Scale to parallel execution (git worktrees)

---

## Part 7: Testing & Validation Comparison

### Script Testing
- **Approach:** Manual testing, ad hoc validation
- **Coverage:** Limited to happy path
- **Automation:** Minimal or none
- **Confidence:** Low (< 70%)
- **Failure Mode:** Crashes, human must debug

### System Testing
- **Approach:** Multi-layer validation hierarchy
- **Coverage:** 90%+ test coverage across all layers
- **Automation:** Fully automated test execution
- **Confidence:** High (90-95%+)
- **Failure Mode:** Automatic retry, progressive resolution, escalation

### The 7 Validation Layers (Systems Only)

```
Layer 1: Syntax & Compilation      (~5 sec)
Layer 2: Linting & Code Quality    (~15 sec)
Layer 3: Unit Testing              (~2 min, 90%+ coverage)
Layer 4: Integration Testing       (~5 min)
Layer 5: End-to-End Testing        (~10-20 min)
Layer 6: Security Testing          (~5 min)
Layer 7: Review & Acceptance       (~15 min, human or automated)
```

**Scripts:** Typically only have Layer 1-2 (syntax, basic quality)
**Systems:** Have all 7 layers with automated progression

---

## Part 8: Autonomy Levels

### Autonomy Spectrum

```
Level 0: Manual Coding (No Agents)
├─ Human writes code directly
└─ 1x leverage

Level 1: Script (Manual Agent Invocation)
├─ Human invokes agent for specific task
├─ Agent executes once
└─ 2-3x leverage

Level 2: Template-Based Script (Reusable Patterns)
├─ Human uses templates for common tasks
├─ Agent executes with template guidance
└─ 5x leverage

Level 3: Autonomous System (Event-Driven Execution)
├─ System monitors for events
├─ Agent executes automatically
├─ Human reviews results
└─ 10-15x leverage

Level 4: Self-Correcting System (Feedback Loops)
├─ System monitors and executes
├─ Agent self-corrects failures
├─ Human oversight minimal
└─ 20-30x leverage

Level 5: Zero-Touch System (Single Human Touchpoint)
├─ System operates end-to-end autonomously
├─ Human only provides initial prompt
├─ No review needed (confidence >= 90%)
└─ 40x+ leverage
```

**Scripts:** Level 1-2 (manual invocation, possibly templated)
**Systems:** Level 3-5 (autonomous, self-correcting, zero-touch)

---

## Part 9: Progression Path - Script to System

### Stage 1: Individual Script
**Starting Point:** Single-purpose script solving one problem

```python
# fix_bug.py
import subprocess
subprocess.run(["claude", "code", "--prompt", "Fix bug in line 47"])
```

**Characteristics:**
- Manual execution
- Hardcoded problem
- No reusability

---

### Stage 2: Templated Script
**Advancement:** Use templates for problem classes

```python
# fix_bug_templated.py
from pathlib import Path
import subprocess

def fix_bug(bug_description):
    template = Path(".claude/commands/bug-fix.md").read_text()
    prompt = template.format(bug=bug_description)
    subprocess.run(["claude", "code", "--prompt", prompt])

if __name__ == "__main__":
    fix_bug("Payment timeout in checkout")
```

**Characteristics:**
- Still manual execution
- Template enables reuse
- Solves bug class, not just one bug

**Progress:** Script → Script with System Elements

---

### Stage 3: Orchestrated Workflow
**Advancement:** Multi-phase workflow with some automation

```python
# adw_fix_bug_workflow.py
from pathlib import Path
import subprocess
import json

class BugFixWorkflow:
    def __init__(self):
        self.state_file = Path("adw_state.json")
    
    def execute_workflow(self, bug_description):
        # Phase 1: Plan
        plan = self.plan_fix(bug_description)
        
        # Phase 2: Implement
        implementation = self.implement_fix(plan)
        
        # Phase 3: Test
        tests = self.run_tests(implementation)
        
        # Save state
        self.save_state(plan, implementation, tests)
        
        return tests.passed
```

**Characteristics:**
- Still manual invocation
- State persistence added
- Multi-phase orchestration
- Beginning of system thinking

**Progress:** Hybrid → Early System

---

### Stage 4: Event-Driven System
**Advancement:** Autonomous operation with triggers

```python
# adw_bug_resolution_system.py
import time
from pathlib import Path

class BugResolutionSystem:
    def __init__(self):
        self.state_file = Path("bug_system_state.json")
        self.load_state()
    
    def monitor_continuously(self):
        """Cron trigger: Runs every minute"""
        while True:
            bugs = self.detect_new_bugs()  # Monitor GitHub issues
            for bug in bugs:
                self.execute_workflow(bug)
            time.sleep(60)
    
    def execute_workflow(self, bug):
        """Autonomous bug resolution"""
        plan = self.plan_fix(bug)
        implementation = self.implement_fix(plan)
        tests = self.run_tests(implementation)
        
        if tests.passed:
            self.create_pr(bug, implementation)
            self.update_state(bug, status="resolved")
        else:
            self.retry_with_enhanced_context(bug)

if __name__ == "__main__":
    system = BugResolutionSystem()
    system.monitor_continuously()  # Runs 24/7
```

**Characteristics:**
- Autonomous operation (cron trigger)
- Persistent state
- Self-monitoring
- Event-driven

**Progress:** Early System → Autonomous System

---

### Stage 5: Self-Correcting System
**Advancement:** Feedback loops and automatic failure resolution

```python
# adw_bug_resolution_system_v2.py (with feedback loops)
class SelfCorrectingBugSystem:
    def execute_workflow(self, bug):
        """Autonomous + self-correcting"""
        max_retries = 3
        
        for attempt in range(max_retries):
            plan = self.plan_fix(bug, context=self.get_enhanced_context(attempt))
            implementation = self.implement_fix(plan)
            tests = self.run_tests(implementation)
            
            if tests.passed:
                self.create_pr(bug, implementation)
                self.learn_from_success(bug, plan)
                return True
            else:
                self.analyze_failure(tests)
                # Progressive resolution: simple → complex
                if attempt < max_retries - 1:
                    continue  # Retry with enhanced context
                else:
                    self.escalate_to_human(bug, tests)
                    return False
    
    def learn_from_success(self, bug, plan):
        """System improves over time"""
        pattern = self.extract_pattern(bug, plan)
        self.state["successful_patterns"].append(pattern)
        self.save_state()
```

**Characteristics:**
- Autonomous operation
- Self-correction through retry
- Learning (improves over time)
- Progressive failure resolution

**Progress:** Autonomous System → Self-Correcting System

---

### Stage 6: Zero-Touch Enterprise System
**Advancement:** Single touchpoint, complete automation

```python
# adw_zte_bug_resolution.py (Zero-Touch Engineering)
class ZeroTouchBugSystem:
    def execute_zero_touch(self, issue_number):
        """GitHub issue → Merged PR without human review"""
        # Initialize isolated environment
        adw_id = self.generate_adw_id()
        worktree = self.create_worktree(adw_id)
        state = self.init_state(issue_number, adw_id)
        
        # SDLC phases
        phases = ["plan", "build", "test", "review", "document", "ship"]
        
        for phase in phases:
            success = self.execute_phase(phase, state, worktree)
            if not success:
                success = self.resolve_failure_autonomously(phase, state)
            
            if success:
                state["phases_completed"].append(phase)
                confidence = self.calculate_confidence(state)
                state["confidence"] = confidence
            else:
                self.escalate(phase, state)
                return False
        
        # Auto-ship if confidence >= 90%
        if state["confidence"] >= 0.90:
            self.auto_merge_pr(state)
            return True
        else:
            self.request_human_review(state)
            return False
```

**Characteristics:**
- Single human touchpoint (GitHub issue creation)
- Complete SDLC automation
- Quality gates (confidence scoring)
- Automatic shipping
- Git worktree isolation
- State-driven orchestration

**Progress:** Self-Correcting System → Zero-Touch System

---

## Part 10: "Build Systems That Build Systems"

### What Does This Mean in TAC?

**Definition:** Create meta-level infrastructure (agentic layer) that orchestrates AI agents to autonomously generate, test, and deploy code—rather than humans writing code directly.

### The System Hierarchy

```
Level 1: Manual coding (human writes code)
Level 2: AI-assisted coding (human writes with AI help)
Level 3: AI-generated systems (agent writes code, human oversees)
Level 4: Systems that build systems (agents orchestrate other agents)
         ↑ TAC FOCUS
```

### What "Systems That Build Systems" Requires

#### 1. Agentic Layer Infrastructure
```
.claude/commands/              # Templates (reusable prompts)
specs/                         # Plans (agent specifications)
adws/                          # Workflows (orchestration scripts)
```

This is the **minimum viable agentic layer**.

#### 2. Problem Class Thinking
- **DON'T:** Build script to fix this bug
- **DO:** Build system that fixes all bugs of this class

#### 3. Composable Primitives
- Specialized agents that coordinate
- Each agent: one purpose, focused context
- Chain agents: Plan → Build → Test → Review → Document → Ship

#### 4. Meta-Templates
- Templates that generate other templates
- Meta-prompts that improve prompts
- Systems that evolve themselves

#### 5. The 50% Rule (TAC-8)
> "Spend 50%+ of your engineering time building the agentic layer rather than the application layer."

**Why:** Agentic layer multiplies all future work exponentially.

---

## Part 11: Practical Classification Examples

### Example A: Database Migration Script

```python
# migrate_users_table.py
import psycopg2

conn = psycopg2.connect("dbname=myapp")
cur = conn.cursor()
cur.execute("ALTER TABLE users ADD COLUMN last_login TIMESTAMP")
conn.commit()
print("Migration complete")
```

**Classification: SCRIPT**
- No state persistence
- Manual invocation
- Solves one specific migration
- No template reuse
- No validation
- Not autonomous

**Score:** 0/6 → Script

---

### Example B: Migration System with Validation

```python
# adw_migration_system.py
from pathlib import Path
import json

class MigrationSystem:
    def __init__(self):
        self.state_file = Path("migrations/state.json")
        self.templates = Path(".claude/commands/")
        self.load_state()
    
    def monitor_migrations(self):
        """Event-driven: Detects new migration specs"""
        while True:
            pending = self.find_pending_migrations()
            for migration in pending:
                self.execute_migration_workflow(migration)
            time.sleep(60)
    
    def execute_migration_workflow(self, migration):
        """Autonomous migration with validation"""
        # Generate migration from template
        template = self.templates / "database-migration.md"
        plan = self.plan_migration(migration, template)
        
        # Execute with validation layers
        implementation = self.implement_migration(plan)
        tests = self.validate_migration(implementation)
        
        if tests.passed:
            self.apply_migration(implementation)
            self.update_state(migration, "completed")
        else:
            self.rollback_and_retry(migration)
```

**Classification: SYSTEM**
- ✅ Persistent state (tracks completed migrations)
- ✅ Event-driven (monitors for new migrations)
- ✅ Solves migration class (all database changes)
- ✅ Uses templates
- ✅ Automated validation
- ✅ Autonomous operation

**Score:** 6/6 → System

---

### Example C: Documentation Generator (One-off)

```bash
#!/bin/bash
# generate_docs.sh
claude code --prompt "Generate API documentation from code comments"
```

**Classification: SCRIPT**
- Shell script, manual invocation
- No state, no templates
- One-off execution

**Score:** 0/6 → Script

---

### Example D: Documentation System (Continuous)

```python
# adw_docs_system.py
class DocumentationSystem:
    def __init__(self):
        self.state_file = Path("docs/docs_state.json")
        self.template = Path(".claude/commands/api-docs.md")
    
    def monitor_code_changes(self):
        """Hook-based: Triggers on git commits"""
        # Integrated with .claude/hooks/post_commit.py
        pass
    
    def update_docs_automatically(self, changed_files):
        """Autonomous doc generation"""
        for file in changed_files:
            if self.is_api_file(file):
                docs = self.generate_docs(file, self.template)
                self.validate_docs(docs)
                self.update_docs_site(docs)
                self.state["last_updated"] = datetime.now()
```

**Classification: SYSTEM**
- ✅ Hook-based triggers (on git commit)
- ✅ State persistence
- ✅ Template-based
- ✅ Autonomous
- ✅ Continuous operation

**Score:** 5/6 → System

---

## Part 12: Summary - Quick Classification Guide

### Is It a Script?
- [ ] Manual invocation only?
- [ ] No state between runs?
- [ ] Solves one specific problem?
- [ ] Hardcoded logic, no templates?
- [ ] No automated testing?
- [ ] Cannot run autonomously?

**If 4+ checked → SCRIPT**

### Is It a System?
- [ ] Event-driven triggers (cron/webhook/hooks)?
- [ ] Persistent state (database/files)?
- [ ] Solves problem classes, not instances?
- [ ] Uses templates from `.claude/commands/`?
- [ ] Has automated validation layers?
- [ ] Can operate autonomously 24/7?

**If 4+ checked → SYSTEM**

---

## Part 13: Key Takeaways

1. **Scripts solve problems; systems solve problem classes**
   - Script: "Fix THIS payment bug"
   - System: "Fix ALL payment bugs autonomously"

2. **Scripts require humans; systems operate autonomously**
   - Script: Human invokes each time
   - System: Triggers automatically (cron/webhook/hooks)

3. **Scripts are forgotten; systems improve over time**
   - Script: No learning, no history
   - System: Persistent state, learns patterns, gets better

4. **Scripts are standalone; systems compose**
   - Script: One file, one purpose
   - System: Multi-layer architecture, specialist agents

5. **Scripts are fragile; systems are robust**
   - Script: Crashes on errors
   - System: Self-corrects through feedback loops

6. **Build systems, not scripts (TAC Core Principle)**
   - Focus on infrastructure that solves classes
   - Template your engineering
   - Invest 50%+ time on agentic layer
   - Think meta: systems that build systems

---

## Conclusion

**The fundamental distinction:**

- **Scripts** are tactical: solve immediate problems, manual execution, forgotten after use
- **Systems** are strategic: solve problem classes, autonomous operation, improve over time

**The TAC philosophy:**

> "Focus on building ADWs that solve classes of problems rather than individual issues. This approach scales your engineering efforts and creates reusable autonomous workflows."

**To become an irreplaceable engineer:**

Build systems that build systems. Spend 50%+ of your time on the agentic layer. Transform your codebase into a self-operating machine.

---

**References:**
- TAC Lesson 1: Hello Agentic Coding
- TAC Lesson 3: Template Your Engineering
- TAC Lesson 4: Stay Out The Loop (AFK Agents)
- TAC Lesson 7: Target Zero-Touch Engineering
- TAC Lesson 8: Prioritize Agentics
- TAC Working Applications: Todone, Observability, Agent Layer Primitives

