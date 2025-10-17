# TAC Quick Reference: Build Systems That Build Systems

## The Core Concept (TL;DR)

**"Build systems that build systems"** = Creating an **agentic layer** (meta-infrastructure with templates, prompts, workflows) that orchestrates AI agents to autonomously generate and maintain code - rather than humans writing code directly.

---

## Key Distinction: Scripts vs. Systems

| Aspect | Script | System |
|--------|--------|--------|
| **Lifespan** | One-off use | Reusable forever |
| **Problem Scope** | Individual problem | Entire problem CLASS |
| **Storage** | Forgotten after run | Version-controlled templates |
| **Improvement** | Static | Improves each iteration |
| **Execution** | Manual trigger | Autonomous + event-driven |
| **Example** | "Fix this payment bug" | "Fix ALL payment bugs" |

**TAC Principle:** "Avoid ad hoc prompts. Build reusable, version-controlled templates that get better with execution." - Lesson 4

---

## The Five Pillars of TAC

### 1. Stop Coding
Your hands are not the best tool for writing code. Agents are.

### 2. The Core Four
- Context (information)
- Model (Claude Opus)
- Prompt (instructions)
- **Tools** (execution) ← The game-changer

### 3. Commander of Compute
You orchestrate agents strategically instead of writing code tactically.

### 4. Agentic Layer
The meta-infrastructure that builds your application:
```
Strategic Layer (You)
     ↓
Agentic Layer (Agents) ← 50%+ of your effort here
     ↓
Application Layer (Product)
```

### 5. The 50%+ Rule
Invest more than half your time building agentic infrastructure, not direct coding.

---

## Minimum Viable Agentic Layer

Three components:

1. **Prompts** (`.claude/commands/`)
   - Reusable templates
   - Meta-prompts that generate prompts
   - Version-controlled

2. **Plans** (`.specs/`)
   - Agent-generated specifications
   - Validation commands
   - Success criteria

3. **Workflows** (ADWs in `adws/`)
   - Orchestration scripts
   - Chain multiple agents
   - Enable autonomous execution

---

## The 12 Leverage Points (Simplified)

**In-Agent (Always available):**
1. Context - What can agent see?
2. Model - Agent's brain
3. Prompt - Instructions
4. Tools - Capabilities

**Through-Agent (External multipliers):**
5. Documentation → 2x
6. Types → 2x
7. Architecture → 2x
8. Tests → 2x
9. Planning → 2x
10. ADWs → Composes them
11. KPIs → Measures them
12. One-Shot Success → Optimizes them

**Result:** Single point = 2x. All 12 = 16x+ improvement (exponential)

---

## Gateway Script Pattern

```python
#!/usr/bin/env python3
"""Gateway: Entry point to agentic system"""

def gateway_solve_problem_class():
    # Calls an AGENT (not application logic)
    # This is distinct from regular code
    invoke_agent(template, context)
```

**Key:** Gateway scripts call agents, not application code. This is how you orchestrate systems.

---

## Autonomy vs. Automation

**Automation:** Deterministic rules (if X then Y)
- Fixed workflows
- Scales linearly

**Autonomy:** Agent reasoning (agent decides)
- Adaptive workflows
- Scales exponentially

**TAC Model:** Combine both - deterministic orchestration + agentic reasoning

---

## The Agentic Layer Evolution

```
Week 1: Thin (few templates)  → 2x value
Week 2: Growing              → 10x value
Week 3: Substantial          → 100x value
Week 4+: Dense               → Parabolic returns
```

**Parabolic Curve:** "Put 10 minutes in, get 2 hours of value out." - Lesson 8

---

## The Single Guiding Question

> **"Am I investing enough time in my agentic layer?"**

This one question encompasses all TAC principles.

- If YES → Building sustainable leverage
- If NO → Operating below potential

---

## Programmable Agents

Claude Code is **programmable** - embed it in your workflows:

```python
# Invoke agent from Python/TypeScript/Shell
subprocess.run(["claude", "code", "--template", template, "--context", context])
```

This enables:
- Chaining agents (plan → implement → test)
- Event-driven triggers (GitHub webhooks)
- Feedback loops (test → fix → retest)
- Orchestration of multiple agents

---

## Three-Layer Command Hierarchy

```
STRATEGIC (You make decisions)
├─ Vision & business logic
├─ Architectural decisions
├─ Quality standards
└─ Problem identification

AGENTIC (Agents execute)
├─ Templates & meta-prompts
├─ Workflows & orchestration
├─ Self-correction & feedback
└─ Autonomous operation

APPLICATION (Delivered product)
├─ Generated code
├─ Infrastructure
├─ Documentation
└─ Operational systems
```

---

## TAC vs. AI Coding (Phase 1)

| Phase | Focus | Result | Time Investment |
|-------|-------|--------|-----------------|
| Phase 1: AI Coding | Generate code snippets | Code you still manage | ~90% direct coding |
| Phase 2: Agentic Coding | Build systems that build systems | Systems that self-manage | ~50% agentic layer |

---

## The Paradox of Irreplaceability

> **"To become irreplaceable, you must first replace yourself."**

1. Replace your coding with agents
2. Elevate to system architecture
3. Create unique value through orchestration
4. Build competitive moats through automation
5. Become irreplaceable through sophistication

---

## Applied to Knowledge Management

Your governance system should BE a system, not a script:

**Script (Wrong):**
- Manual doc updates
- Ad hoc governance changes
- One-time protocols

**System (Right):**
- Templated governance workflows
- Autonomous protocol updates
- Reusable governance patterns
- Self-validating systems

---

## Key TAC Quotes

1. **Core Mission:** "You take this compute and use it to build systems that build systems." - Lesson 1

2. **Problem Solving:** "Solve Problem Classes, Not Problems." - Tactic #3

3. **Templates:** "Build reusable templates that get better with each execution." - Lesson 4

4. **Agentic Layer:** "More than half your engineering time should be spent on the agentic layer." - Tactic #8

5. **Self-Operation:** "Transform your codebase into a self-operating machine." - Lesson 1

6. **Autonomy:** "Stay out the loop and let your product build itself." - Lesson 4

7. **Gateway Scripts:** "Gateway scripts are distinctly different - they call an agent, not application logic." - Lesson 8

8. **Leverage:** "The irreplaceable engineer operates on leverage others cannot match." - TAC Philosophy

---

## Next Steps for Implementation

1. **Identify problem classes** in your domain (what repeats?)
2. **Template solutions** for those classes
3. **Store templates** in version control
4. **Build orchestration scripts** (gateway scripts, ADWs)
5. **Add feedback loops** (validation, self-correction)
6. **Measure impact** (ROI, leverage multiplication)
7. **Invest 50%+ time** in the agentic layer
8. **Ask constantly:** "Am I investing enough in agentic layer?"

---

## Resources

Full Analysis: `TAC_BUILD_SYSTEMS_COMPREHENSIVE_ANALYSIS.md` (20KB)
- 12 detailed sections
- Code examples for each concept
- Applied examples for knowledge management
- Complete quote attribution

TAC Curriculum: `/home/omar/Projects/learning/tac/`
- Lessons 1-8: Complete coursework
- All implementations: Python + TypeScript
- Real-world examples: ADW systems, templates, workflows

---

*This quick reference synthesizes TAC's 8 tactics into the core principle that enables irreplaceability: building systems that build systems.*
