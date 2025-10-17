# TAC Slash Commands - Quick Reference Index

**Fast lookup for all 165 commands organized by purpose**

## Core Workflow

### `/plan`

**In 2 tactic(s):** maestro, tac-full-mastery

_Plan_

Create a plan to complete the task using the specified markdown `Plan Format`. Research the codebase and create a thorough plan appropriate to the task's complexity.

**Locations:**
- tac-full-mastery/.claude/commands/plan.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/plan.md

### `/implement`

**In 7 tactic(s):** maestro, tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**Locations:**
- tac-3/.claude/commands/implement.md
- tac-4/.claude/commands/implement.md
- tac-5/.claude/commands/implement.md
- tac-6/.claude/commands/implement.md
- tac-7/.claude/commands/implement.md
- tac-full-mastery/.claude/commands/implement.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/implement.md

### `/build`

**In 2 tactic(s):** maestro, tac-full-mastery

_Build Task_

Implement a task directly without creating a plan first.

**Locations:**
- tac-full-mastery/.claude/commands/build.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/build.md

### `/start`

**In 7 tactic(s):** maestro, tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

**Locations:**
- tac-3/.claude/commands/start.md
- tac-4/.claude/commands/start.md
- tac-5/.claude/commands/start.md
- tac-6/.claude/commands/start.md
- tac-7/.claude/commands/start.md
- tac-full-mastery/.claude/commands/start.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/start.md

### `/prime`

**In 8 tactic(s):** maestro, tac-2, tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Prime_

> Execute the following sections to understand the codebase then summarize your understanding.

**Locations:**
- tac-2/.claude/commands/prime.md
- tac-3/.claude/commands/prime.md
- tac-4/.claude/commands/prime.md
- tac-5/.claude/commands/prime.md
- tac-6/.claude/commands/prime.md
- tac-7/.claude/commands/prime.md
- tac-full-mastery/.claude/commands/prime.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/prime.md

## Feature Development

### `/feature`

**In 7 tactic(s):** maestro, tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Feature Planning_

Create a new plan in specs/*.md to implement the `Feature` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right

**Locations:**
- tac-3/.claude/commands/feature.md
- tac-4/.claude/commands/feature.md
- tac-5/.claude/commands/feature.md
- tac-6/.claude/commands/feature.md
- tac-7/.claude/commands/feature.md
- tac-full-mastery/.claude/commands/feature.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/feature.md

### `/chore`

**In 7 tactic(s):** maestro, tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Chore Planning_

Create a new plan in specs/*.md to resolve the `Chore` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right fil

**Locations:**
- tac-3/.claude/commands/chore.md
- tac-4/.claude/commands/chore.md
- tac-5/.claude/commands/chore.md
- tac-6/.claude/commands/chore.md
- tac-7/.claude/commands/chore.md
- tac-full-mastery/.claude/commands/chore.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/chore.md

### `/bug`

**In 6 tactic(s):** tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Bug Planning_

Create a new plan in specs/*.md to resolve the `Bug` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files

**Locations:**
- tac-3/.claude/commands/bug.md
- tac-4/.claude/commands/bug.md
- tac-5/.claude/commands/bug.md
- tac-6/.claude/commands/bug.md
- tac-7/.claude/commands/bug.md
- tac-full-mastery/.claude/commands/bug.md

### `/patch`

**In 3 tactic(s):** tac-6, tac-7, tac-full-mastery

_Patch Plan_

Create a **focused patch plan** to resolve a specific issue based on the `review_change_request`. Follow the `Instructions` to create a concise plan that addresses the issue with minimal, targeted cha

**Locations:**
- tac-6/.claude/commands/patch.md
- tac-7/.claude/commands/patch.md
- tac-full-mastery/.claude/commands/patch.md

### `/refactor`

**In 1 tactic(s):** tac-3

_Refactor Planning_

Create a new plan in specs/*.md to refactor the specified code using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to focus on t

**Locations:**
- tac-3/.claude/commands/refactor.md

## Testing & Quality

### `/test`

**In 5 tactic(s):** tac-3, tac-5, tac-6, tac-7, tac-full-mastery

_Test Planning_

Create a new plan in specs/*.md to generate comprehensive tests using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to focus on 

**Locations:**
- tac-3/.claude/commands/test.md
- tac-5/.claude/commands/test.md
- tac-6/.claude/commands/test.md
- tac-7/.claude/commands/test.md
- tac-full-mastery/.claude/commands/test.md

### `/test_e2e`

**In 4 tactic(s):** tac-5, tac-6, tac-7, tac-full-mastery

_E2E Test Runner_

Execute end-to-end (E2E) tests using Playwright browser automation (MCP Server). If any errors occur and assertions fail mark the test as failed and explain exactly what went wrong.

**Locations:**
- tac-5/.claude/commands/test_e2e.md
- tac-6/.claude/commands/test_e2e.md
- tac-7/.claude/commands/test_e2e.md
- tac-full-mastery/.claude/commands/test_e2e.md

### `/review`

**In 4 tactic(s):** tac-3, tac-6, tac-7, tac-full-mastery

_Code Review Planning_

Create a new plan in specs/*.md to conduct a comprehensive code review using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to fo

**Locations:**
- tac-3/.claude/commands/review.md
- tac-6/.claude/commands/review.md
- tac-7/.claude/commands/review.md
- tac-full-mastery/.claude/commands/review.md

### `/in_loop_review`

**In 2 tactic(s):** tac-7, tac-full-mastery

_In-Loop Review_

Quick checkout and review workflow for agent work validation.

**Locations:**
- tac-7/.claude/commands/in_loop_review.md
- tac-full-mastery/.claude/commands/in_loop_review.md

### `/health_check`

**In 2 tactic(s):** tac-7, tac-full-mastery

_Health Check_

!`uv run adws/adw_tests/health_check.py`

**Locations:**
- tac-7/.claude/commands/health_check.md
- tac-full-mastery/.claude/commands/health_check.md

### `/resolve_failed_test`

**In 4 tactic(s):** tac-5, tac-6, tac-7, tac-full-mastery

_Resolve Failed Test_

Fix a specific failing test using the provided failure details.

**Locations:**
- tac-5/.claude/commands/resolve_failed_test.md
- tac-6/.claude/commands/resolve_failed_test.md
- tac-7/.claude/commands/resolve_failed_test.md
- tac-full-mastery/.claude/commands/resolve_failed_test.md

### `/resolve_failed_e2e_test`

**In 4 tactic(s):** tac-5, tac-6, tac-7, tac-full-mastery

_Resolve Failed E2E Test_

Fix a specific failing E2E test using the provided failure details.

**Locations:**
- tac-5/.claude/commands/resolve_failed_e2e_test.md
- tac-6/.claude/commands/resolve_failed_e2e_test.md
- tac-7/.claude/commands/resolve_failed_e2e_test.md
- tac-full-mastery/.claude/commands/resolve_failed_e2e_test.md

### `/track_agentic_kpis`

**In 2 tactic(s):** tac-7, tac-full-mastery

_Track Agentic KPIs_

Update or create the ADW performance tracking tables in `app_docs/agentic_kpis.md`. This command analyzes the current ADW run's metrics and maintains both summary and detailed KPI tables. Think hard a

**Locations:**
- tac-7/.claude/commands/track_agentic_kpis.md
- tac-full-mastery/.claude/commands/track_agentic_kpis.md

## Git Operations

### `/commit`

**In 5 tactic(s):** tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Generate Git Commit_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a git commit with a properly formatted message. Then follow the `Report` section to report the results of you

**Locations:**
- tac-4/.claude/commands/commit.md
- tac-5/.claude/commands/commit.md
- tac-6/.claude/commands/commit.md
- tac-7/.claude/commands/commit.md
- tac-full-mastery/.claude/commands/commit.md

### `/pull_request`

**In 5 tactic(s):** tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Create Pull Request_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a pull request. Then follow the `Report` section to report the results of your work.

**Locations:**
- tac-4/.claude/commands/pull_request.md
- tac-5/.claude/commands/pull_request.md
- tac-6/.claude/commands/pull_request.md
- tac-7/.claude/commands/pull_request.md
- tac-full-mastery/.claude/commands/pull_request.md

### `/generate_branch_name`

**In 5 tactic(s):** tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Generate Git Branch Name_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to generate a concise Git branch name following the specified format. Then follow the `Report` section to report the re

**Locations:**
- tac-4/.claude/commands/generate_branch_name.md
- tac-5/.claude/commands/generate_branch_name.md
- tac-6/.claude/commands/generate_branch_name.md
- tac-7/.claude/commands/generate_branch_name.md
- tac-full-mastery/.claude/commands/generate_branch_name.md

### `/classify_issue`

**In 5 tactic(s):** tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Github Issue Command Selection_

Based on the `Github Issue` below, follow the `Instructions` to select the appropriate command to execute based on the `Command Mapping`.

**Locations:**
- tac-4/.claude/commands/classify_issue.md
- tac-5/.claude/commands/classify_issue.md
- tac-6/.claude/commands/classify_issue.md
- tac-7/.claude/commands/classify_issue.md
- tac-full-mastery/.claude/commands/classify_issue.md

## Worktree Management

### `/init_worktree`

**In 2 tactic(s):** maestro, tac-full-mastery

_Initialize Worktree with Sparse Checkout_

Create a new git worktree for an agent to work in isolation, with only the specified directory checked out.

**Locations:**
- tac-full-mastery/.claude/commands/init_worktree.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/init_worktree.md

### `/clean_worktree`

**In 2 tactic(s):** maestro, tac-full-mastery

_Clean Worktree_

Remove a git worktree and its associated branch.

**Locations:**
- tac-full-mastery/.claude/commands/clean_worktree.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/clean_worktree.md

### `/install_worktree`

**In 2 tactic(s):** tac-7, tac-full-mastery

_Install Worktree_

This command sets up an isolated worktree environment with custom port configuration.

**Locations:**
- tac-7/.claude/commands/install_worktree.md
- tac-full-mastery/.claude/commands/install_worktree.md

### `/cleanup_worktrees`

**In 2 tactic(s):** tac-7, tac-full-mastery

_Cleanup ADW Worktrees_

Clean up isolated ADW worktrees and their associated resources.

**Locations:**
- tac-7/.claude/commands/cleanup_worktrees.md
- tac-full-mastery/.claude/commands/cleanup_worktrees.md

## Agent Orchestration

### `/delegate`

**In 1 tactic(s):** maestro

_Single Delegation Command_

Execute a single delegation to a specialized agent with clear authority boundaries and quality validation.

**Locations:**
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/delegate.md

### `/orchestrate`

**In 1 tactic(s):** maestro

_Maestro Orchestration Command_

Orchestrate a multi-agent workflow using delegation intelligence primitives to achieve complex business objectives through systematic agent coordination.

**Locations:**
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/orchestrate.md

### `/process_tasks`

**In 2 tactic(s):** maestro, tac-full-mastery

_Process Tasks_

Analyze the current task list and identify tasks that are ready to be picked up by agents.

**Locations:**
- tac-full-mastery/.claude/commands/process_tasks.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/process_tasks.md

### `/mark_in_progress`

**In 2 tactic(s):** maestro, tac-full-mastery

_Mark Task In Progress_

Mark tasks as in-progress in the task list file.

**Locations:**
- tac-full-mastery/.claude/commands/mark_in_progress.md
- project/system/apps/app1__agent_layer_primitives/infrastructure/core/delegation/maestro/.claude/commands/mark_in_progress.md

## Documentation

### `/document`

**In 3 tactic(s):** tac-6, tac-7, tac-full-mastery

_Document Feature_

Generate concise markdown documentation for implemented features by analyzing code changes and specifications. This command creates documentation in the `app_docs/` directory based on git diff analysi

**Locations:**
- tac-6/.claude/commands/document.md
- tac-7/.claude/commands/document.md
- tac-full-mastery/.claude/commands/document.md

### `/conditional_docs`

**In 3 tactic(s):** tac-6, tac-7, tac-full-mastery

_Conditional Documentation Guide_

This prompt helps you determine what documentation you should read based on the specific changes you need to make in the codebase. Review the conditions below and read the relevant documentation befor

**Locations:**
- tac-6/.claude/commands/conditional_docs.md
- tac-7/.claude/commands/conditional_docs.md
- tac-full-mastery/.claude/commands/conditional_docs.md

### `/docs`

**In 1 tactic(s):** tac-3

_Documentation Planning_

Create a new plan in specs/*.md to generate comprehensive documentation using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to f

**Locations:**
- tac-3/.claude/commands/docs.md

### `/meta-template`

**In 1 tactic(s):** tac-3

_Meta-Template: Template Creation Planning_

Create a new template in .claude/commands/*.md using the exact specified markdown `Template Format`. Follow the `Instructions` to create a reusable template that follows TAC principles and enables pro

**Locations:**
- tac-3/.claude/commands/meta-template.md

## Infrastructure

### `/install`

**In 7 tactic(s):** tac-2, tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_Install & Prime_

.claude/commands/prime.md

**Locations:**
- tac-2/.claude/commands/install.md
- tac-3/.claude/commands/install.md
- tac-4/.claude/commands/install.md
- tac-5/.claude/commands/install.md
- tac-6/.claude/commands/install.md
- tac-7/.claude/commands/install.md
- tac-full-mastery/.claude/commands/install.md

### `/tools`

**In 7 tactic(s):** tac-2, tac-3, tac-4, tac-5, tac-6, tac-7, tac-full-mastery

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.

**Locations:**
- tac-2/.claude/commands/tools.md
- tac-3/.claude/commands/tools.md
- tac-4/.claude/commands/tools.md
- tac-5/.claude/commands/tools.md
- tac-6/.claude/commands/tools.md
- tac-7/.claude/commands/tools.md
- tac-full-mastery/.claude/commands/tools.md

### `/prepare_app`

**In 3 tactic(s):** tac-6, tac-7, tac-full-mastery

_Prepare Application_

Setup the application for the review or test.

**Locations:**
- tac-6/.claude/commands/prepare_app.md
- tac-7/.claude/commands/prepare_app.md
- tac-full-mastery/.claude/commands/prepare_app.md

### `/classify_adw`

**In 4 tactic(s):** tac-5, tac-6, tac-7, tac-full-mastery

_ADW Workflow Extraction_

Extract ADW workflow information from the text below and return a JSON response.

**Locations:**
- tac-5/.claude/commands/classify_adw.md
- tac-6/.claude/commands/classify_adw.md
- tac-7/.claude/commands/classify_adw.md
- tac-full-mastery/.claude/commands/classify_adw.md

### `/find_plan_file`

**In 2 tactic(s):** tac-4, tac-5

_Find Plan File_

Based on the `Previous Step Output` below, follow the `Instructions` to find the path to the plan file that was just created.

**Locations:**
- tac-4/.claude/commands/find_plan_file.md
- tac-5/.claude/commands/find_plan_file.md

## Integration

## Tech-Specific Planning

## E2E Tests

### `/e2e`

**In 20 tactic(s):** tac-5, tac-6, tac-7, tac-full-mastery

_E2E Test: Basic Query Execution_

Test basic query functionality in the Natural Language SQL Interface application.

**Locations:**
- tac-5/.claude/commands/e2e/test_basic_query.md
- tac-5/.claude/commands/e2e/test_complex_query.md
- tac-5/.claude/commands/e2e/test_sql_injection.md
- tac-6/.claude/commands/e2e/test_basic_query.md
- tac-6/.claude/commands/e2e/test_complex_query.md
- tac-6/.claude/commands/e2e/test_disable_input_debounce.md
- tac-6/.claude/commands/e2e/test_random_query_generator.md
- tac-6/.claude/commands/e2e/test_sql_injection.md
- tac-7/.claude/commands/e2e/test_basic_query.md
- tac-7/.claude/commands/e2e/test_complex_query.md
- tac-7/.claude/commands/e2e/test_disable_input_debounce.md
- tac-7/.claude/commands/e2e/test_export_functionality.md
- tac-7/.claude/commands/e2e/test_random_query_generator.md
- tac-7/.claude/commands/e2e/test_sql_injection.md
- tac-full-mastery/.claude/commands/e2e/test_basic_query.md
- tac-full-mastery/.claude/commands/e2e/test_complex_query.md
- tac-full-mastery/.claude/commands/e2e/test_disable_input_debounce.md
- tac-full-mastery/.claude/commands/e2e/test_export_functionality.md
- tac-full-mastery/.claude/commands/e2e/test_random_query_generator.md
- tac-full-mastery/.claude/commands/e2e/test_sql_injection.md

## Additional Commands

### `/update_task`
**In 2 tactic(s):** maestro, tac-full-mastery

### `/update_task copy`
**In 1 tactic(s):** tac-full-mastery

---

## Statistics

**Total unique commands:** 42
**Total command instances:** 165
**Coverage analysis:**

- Ubiquitous (5+ tactics): 14 commands
- Common (3-4 tactics): 9 commands
- Moderate (2 tactics): 13 commands
- Tactical (1 tactic): 6 commands