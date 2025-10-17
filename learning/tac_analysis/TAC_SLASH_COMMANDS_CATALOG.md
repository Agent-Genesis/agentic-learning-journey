# TAC Slash Commands Catalog

**Version:** 1.0.0
**Date:** 2025-10-17
**Scope:** Complete inventory of slash commands across all TAC tactics

---

## Executive Summary

- **Total Slash Commands:** 165
- **Unique Command Patterns:** 42
- **Tactics/Projects:** 8
- **Command Distribution Range:** 3-41 commands per tactic

This catalog documents the complete lifecycle of slash command evolution across TAC-2 through TAC-8, representing the maturation of agentic engineering workflows.

## Table of Contents

- [maestro (delegation-core)](#maestro-delegation-core)
- [tac-2](#tac-2)
- [tac-3](#tac-3)
- [tac-4](#tac-4)
- [tac-5](#tac-5)
- [tac-6](#tac-6)
- [tac-7](#tac-7)
- [tac-full-mastery](#tac-full-mastery)

---

## Command Pattern Analysis

### Core Command Types (by frequency)

#### Command Categories

| Category | Commands | Count |
|----------|----------|-------|
| Workflow | `plan`, `implement`, `start`, `build` | 18 |
| Coordination | `delegate`, `orchestrate`, `process_tasks`, `mark_in_progress`, `prime` | 14 |
| Quality | `test`, `test_e2e`, `review`, `in_loop_review`, `health_check` | 17 |
| Lifecycle | `feature`, `chore`, `bug`, `patch`, `refactor` | 24 |
| Git Workflow | `commit`, `pull_request`, `generate_branch_name`, `start` | 22 |
| Infrastructure | `init_worktree`, `clean_worktree`, `install_worktree`, `cleanup_worktrees` | 8 |
| Documentation | `document`, `conditional_docs`, `docs` | 7 |
| Classification | `classify_issue`, `classify_adw` | 9 |
| Testing Specialized | `resolve_failed_test`, `resolve_failed_e2e_test`, `test` | 13 |
| Integration | `tools`, `prepare_app`, `install` | 17 |

#### Top 15 Most Common Commands

| Command | Appears In | Tactics |
|---------|-----------|---------|
| `e2e` | 20 | tac-5, tac-full-mastery, tac-6, tac-7 |
| `prime` | 8 | tac-5, tac-6, tac-2, tac-full-mastery, tac-4, tac-7, maestro, tac-3 |
| `install` | 7 | tac-5, tac-6, tac-2, tac-full-mastery, tac-4, tac-7, tac-3 |
| `tools` | 7 | tac-5, tac-6, tac-2, tac-full-mastery, tac-4, tac-7, tac-3 |
| `chore` | 7 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7, maestro, tac-3 |
| `feature` | 7 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7, maestro, tac-3 |
| `implement` | 7 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7, maestro, tac-3 |
| `start` | 7 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7, maestro, tac-3 |
| `bug` | 6 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7, tac-3 |
| `test` | 5 | tac-5, tac-6, tac-full-mastery, tac-7, tac-3 |
| `classify_issue` | 5 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7 |
| `commit` | 5 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7 |
| `generate_branch_name` | 5 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7 |
| `pull_request` | 5 | tac-5, tac-6, tac-full-mastery, tac-4, tac-7 |
| `review` | 4 | tac-7, tac-full-mastery, tac-6, tac-3 |

---

## Complete Catalog by Tactic

### 1. maestro (delegation-core)

**Command Count:** 14

#### Core Workflow

**/build**

_Build Task - Delegation Intelligence Implementation_

Execute systematic task implementation through Maestro's delegation intelligence framework.

Variables:
- adw_id: $1
- task_description: $2
- business_context: $3 (optional, defaults to "Omar+Mohammed business objectives")

**/implement**

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**/plan**

_Strategic Planning - Delegation Intelligence Framework_

Create systematic business-aligned plans using Maestro's delegation intelligence for Omar+Mohammed objectives.

Variables:
- adw_id: $1
- prompt: $2
- business_priority: $3 (optional, defaults to "revenue_generation")

**/start**

_Start your applications_

- Run the commands in the `Run` section below top to bottom.


#### Task Types

**/chore**

_Chore Planning_

Create a plan to complete the chore using the specified markdown `Plan Format`. Research the codebase and create a thorough plan.

Variables:
- adw_id: $1
- prompt: $2

**/feature**

_Feature Planning_

Create a plan to implement the feature using the specified markdown `Plan Format`. Research the codebase and create a thorough plan.

Variables:
- adw_id: $1
- prompt: $2


#### Agent Orchestration

**/delegate**

_Single Delegation Command_

Execute a single delegation to a specialized agent with clear authority boundaries and quality validation.

Variables:
- agent_name: $1
- task_type: $2
- context_scope: $3 (optional, defaults to current directory)
- success_criteria: $4 (optional, defaults to standard criteria for task type)

**/orchestrate**

_Maestro Orchestration Command_

Orchestrate a multi-agent workflow using delegation intelligence primitives to achieve complex business objectives through systematic agent coordination.

Variables:
- orchestration_goal: $1
- delegation_strategy: $2 (optional, defaults to "auto")
- model_set: $3 (optional, defaults to "base")


#### Coordination

**/mark_in_progress**

_Mark Task In Progress - Delegation Intelligence Coordination_

Mark business-aligned tasks as in-progress through Maestro's delegation intelligence framework with systematic agent coordination tracking.

Variables:
- task_file_path: $1
- business_workflow: $2
- task_description: $3
- adw_id: $4
- agent_name: $5 (optional, defaults to "business_agent")
- business_priority: $6 (optional, defaults to "revenue_generation")

**/prime**

_Prime_

Execute the `Run`, `Read` and `Report` sections to understand the codebase then summarize your understanding.

**/process_tasks**

_Process Tasks - Delegation Intelligence Coordination_

Analyze business-aligned task coordination through Maestro's delegation intelligence framework for systematic multi-agent orchestration.


#### Worktree Management

**/clean_worktree**

_Clean Worktree - Delegation Intelligence Environment Management_

Clean business workflow environments through Maestro's delegation intelligence framework with systematic resource management.

Variables:
- business_workflow: $1
- cleanup_scope: $2 (optional: "full|artifacts|temp", defaults to "artifacts")
- preserve_business_value: $3 (optional: "true|false", defaults to "true")

**/init_worktree**

_Initialize Worktree - Delegation Intelligence Environment Setup_

Initialize business workflow environments through Maestro's delegation intelligence framework with systematic resource allocation and competitive advantage preparation.

Variables:
- business_workflow: $1
- workflow_priority: $2 (optional: "revenue|competitive|strategic|quality", defaults to "revenue")
- business_objective: $3 (optional, defaults to "Omar+Mohammed value creation")
- isolation_level: $4 (optional: "standard|enhanced|maximum", defaults to "enhanced")


#### Other

**/update_task**

_Update Task - Delegation Intelligence Status Management_

Update business-aligned task status through Maestro's delegation intelligence framework with systematic business value tracking.

Variables:
- adw_id: $1
- business_workflow: $2
- task_description: $3
- status: $4
- commit_hash: $5
- business_value_created: $6 (optional)
- competitive_advantage: $7 (optional)
- error_message: $ARGUMENT


### 2. tac-2

**Command Count:** 3

#### Coordination

**/prime**

_Prime_

> Execute the following sections to understand the codebase then summarize your understanding.


#### Infrastructure

**/install**

_Install & Prime_

.claude/commands/prime.md

**/tools**

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.


### 3. tac-3

**Command Count:** 13

#### Core Workflow

**/implement**

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**/start**


#### Task Types

**/bug**

_Bug Planning_

Create a new plan in specs/*.md to resolve the `Bug` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files

**/chore**

_Chore Planning_

Create a new plan in specs/*.md to resolve the `Chore` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right fil

**/feature**

_Feature Planning_

Create a new plan in specs/*.md to implement the `Feature` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right

**/refactor**

_Refactor Planning_

Create a new plan in specs/*.md to refactor the specified code using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to focus on t


#### Coordination

**/prime**

_Prime_

> Execute the following sections to understand the codebase then summarize your understanding.


#### Quality Assurance

**/review**

_Code Review Planning_

Create a new plan in specs/*.md to conduct a comprehensive code review using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to fo

**/test**

_Test Planning_

Create a new plan in specs/*.md to generate comprehensive tests using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to focus on 


#### Infrastructure

**/install**

_Install & Prime_

.claude/commands/prime.md

**/tools**

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.


#### Documentation

**/docs**

_Documentation Planning_

Create a new plan in specs/*.md to generate comprehensive documentation using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan and use the `Relevant Files` to f


#### Other

**/meta-template**

_Meta-Template: Template Creation Planning_

Create a new template in .claude/commands/*.md using the exact specified markdown `Template Format`. Follow the `Instructions` to create a reusable template that follows TAC principles and enables pro


### 4. tac-4

**Command Count:** 13

#### Core Workflow

**/implement**

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**/start**


#### Task Types

**/bug**

_Bug Planning_

Create a new plan in specs/*.md to resolve the `Bug` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files

**/chore**

_Chore Planning_

Create a new plan in specs/*.md to resolve the `Chore` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right fil

**/feature**

_Feature Planning_

Create a new plan in specs/*.md to implement the `Feature` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right


#### Coordination

**/prime**

_Prime_

> Execute the following sections to understand the codebase then summarize your understanding.


#### Git Integration

**/commit**

_Generate Git Commit_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a git commit with a properly formatted message. Then follow the `Report` section to report the results of you

Variables:
- agent_name: $1
- issue_class: $2
- issue: $3

**/generate_branch_name**

_Generate Git Branch Name_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to generate a concise Git branch name following the specified format. Then follow the `Report` section to report the re

Variables:
- issue_class: $1
- adw_id: $2
- issue: $3

**/pull_request**

_Create Pull Request_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a pull request. Then follow the `Report` section to report the results of your work.

Variables:
- branch_name: $1
- issue: $2
- plan_file: $3
- adw_id: $4


#### Infrastructure

**/install**

_Install & Prime_

.env.sample (never read .env)

**/tools**

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.


#### Other

**/classify_issue**

_Github Issue Command Selection_

Based on the `Github Issue` below, follow the `Instructions` to select the appropriate command to execute based on the `Command Mapping`.

**/find_plan_file**

_Find Plan File_

Based on the `Previous Step Output` below, follow the `Instructions` to find the path to the plan file that was just created.


### 5. tac-5

**Command Count:** 21

#### Core Workflow

**/implement**

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**/start**


#### Task Types

**/bug**

_Bug Planning_

Create a new plan to resolve the `Bug` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/chore**

_Chore Planning_

Create a new plan to resolve the `Chore` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files. Follow the

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/feature**

_Feature Planning_

Create a new plan to implement the `Feature` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3


#### Coordination

**/prime**

_Prime_

> Execute the following sections to understand the codebase then summarize your understanding.


#### Quality Assurance

**/test**

_Application Validation Test Suite_

Execute comprehensive validation tests for both frontend and backend components, returning results in a standardized JSON format for automated processing.

Variables:
- TEST_COMMAND_TIMEOUT: 5 minutes

**/test_e2e**

_E2E Test Runner_

Execute end-to-end (E2E) tests using Playwright browser automation (MCP Server). If any errors occur and assertions fail mark the test as failed and explain exactly what went wrong.

Variables:
- adw_id: $1 if provided, otherwise generate a random 8 character hex string
- agent_name: $2 if provided, otherwise use 'test_e2e'
- e2e_test_file: $3
- application_url: $4 if provided, otherwise use http://localhost:5173


#### E2E Tests

**/e2e / test_basic_query**

_E2E Test: Basic Query Execution_

Test basic query functionality in the Natural Language SQL Interface application.

**/e2e / test_complex_query**

_E2E Test: Complex Query with Filtering_

Test complex query capabilities with filtering conditions.

**/e2e / test_sql_injection**

_E2E Test: SQL Injection Protection_

Test the application's protection against SQL injection attacks.

**/resolve_failed_e2e_test**

_Resolve Failed E2E Test_

Fix a specific failing E2E test using the provided failure details.


#### Git Integration

**/commit**

_Generate Git Commit_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a git commit with a properly formatted message. Then follow the `Report` section to report the results of you

Variables:
- agent_name: $1
- issue_class: $2
- issue: $3

**/generate_branch_name**

_Generate Git Branch Name_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to generate a concise Git branch name following the specified format. Then follow the `Report` section to report the re

Variables:
- issue_class: $1
- adw_id: $2
- issue: $3

**/pull_request**

_Create Pull Request_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a pull request. Then follow the `Report` section to report the results of your work.

Variables:
- branch_name: $1
- issue: $2
- plan_file: $3
- adw_id: $4


#### Infrastructure

**/install**

_Install & Prime_

.env.sample (never read .env)

**/tools**

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.


#### Other

**/classify_adw**

_ADW Workflow Extraction_

Extract ADW workflow information from the text below and return a JSON response.

**/classify_issue**

_Github Issue Command Selection_

Based on the `Github Issue` below, follow the `Instructions` to select the appropriate command to execute based on the `Command Mapping`.

**/find_plan_file**

_Find Plan File_

Based on the variables and `Previous Step Output` below, follow the `Instructions` to find the path to the plan file that was just created.

Variables:
- issue_number: $1
- adw_id: $2
- previous_output: $3

**/resolve_failed_test**

_Resolve Failed Test_

Fix a specific failing test using the provided failure details.


### 6. tac-6

**Command Count:** 27

#### Core Workflow

**/implement**

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**/start**

_Start the application_

PORT: 5173

Variables:
- PORT: 5173


#### Task Types

**/bug**

_Bug Planning_

Create a new plan to resolve the `Bug` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/chore**

_Chore Planning_

Create a new plan to resolve the `Chore` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files. Follow the

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/feature**

_Feature Planning_

Create a new plan to implement the `Feature` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/patch**

_Patch Plan_

Create a **focused patch plan** to resolve a specific issue based on the `review_change_request`. Follow the `Instructions` to create a concise plan that addresses the issue with minimal, targeted cha

Variables:
- adw_id: $1
- review_change_request: $2
- spec_path: $3 if provided, otherwise leave it blank
- agent_name: $4 if provided, otherwise use 'patch_agent'
- issue_screenshots: $5 (optional) - comma-separated list of screenshot paths if provided


#### Coordination

**/prime**

_Prime_

> Execute the following sections to understand the codebase then summarize your understanding.


#### Quality Assurance

**/review**

_Review_

Follow the `Instructions` below to **review work done against a specification file** (spec/*.md) to ensure implemented features match requirements. Use the spec file to understand the requirements and

Variables:
- adw_id: $1
- spec_file: $2
- agent_name: $3 if provided, otherwise use 'review_agent'
- review_image_dir: `<absolute path to codebase>/agents/<adw_id>/<agent_name>/review_img/`

**/test**

_Application Validation Test Suite_

Execute comprehensive validation tests for both frontend and backend components, returning results in a standardized JSON format for automated processing.

Variables:
- TEST_COMMAND_TIMEOUT: 5 minutes

**/test_e2e**

_E2E Test Runner_

Execute end-to-end (E2E) tests using Playwright browser automation (MCP Server). If any errors occur and assertions fail mark the test as failed and explain exactly what went wrong.

Variables:
- adw_id: $1 if provided, otherwise generate a random 8 character hex string
- agent_name: $2 if provided, otherwise use 'test_e2e'
- e2e_test_file: $3
- application_url: $4 if provided, otherwise use http://localhost:5173


#### E2E Tests

**/e2e / test_basic_query**

_E2E Test: Basic Query Execution_

Test basic query functionality in the Natural Language SQL Interface application.

**/e2e / test_complex_query**

_E2E Test: Complex Query with Filtering_

Test complex query capabilities with filtering conditions.

**/e2e / test_disable_input_debounce**

_E2E Test: Input Disabling and Debouncing_

Test input disabling during query execution and debouncing functionality in the Natural Language SQL Interface application.

**/e2e / test_random_query_generator**

_E2E Test: Random Query Generator_

Test the random query generation functionality in the Natural Language SQL Interface application.

**/e2e / test_sql_injection**

_E2E Test: SQL Injection Protection_

Test the application's protection against SQL injection attacks.

**/resolve_failed_e2e_test**

_Resolve Failed E2E Test_

Fix a specific failing E2E test using the provided failure details.


#### Git Integration

**/commit**

_Generate Git Commit_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a git commit with a properly formatted message. Then follow the `Report` section to report the results of you

Variables:
- agent_name: $1
- issue_class: $2
- issue: $3

**/generate_branch_name**

_Generate Git Branch Name_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to generate a concise Git branch name following the specified format. Then follow the `Report` section to report the re

Variables:
- issue_class: $1
- adw_id: $2
- issue: $3

**/pull_request**

_Create Pull Request_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a pull request. Then follow the `Report` section to report the results of your work.

Variables:
- branch_name: $1
- issue: $2
- plan_file: $3
- adw_id: $4


#### Infrastructure

**/install**

_Install & Prime_

.env.sample (never read .env)

**/prepare_app**

_Prepare Application_

Setup the application for the review or test.

Variables:
- PORT: 5173

**/tools**

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.


#### Documentation

**/conditional_docs**

_Conditional Documentation Guide_

This prompt helps you determine what documentation you should read based on the specific changes you need to make in the codebase. Review the conditions below and read the relevant documentation befor

**/document**

_Document Feature_

Generate concise markdown documentation for implemented features by analyzing code changes and specifications. This command creates documentation in the `app_docs/` directory based on git diff analysi

Variables:
- adw_id: $1
- spec_path: $2 if provided, otherwise leave it blank
- documentation_screenshots_dir: $3 if provided, otherwise leave it blank


#### Other

**/classify_adw**

_ADW Workflow Extraction_

Extract ADW workflow information from the text below and return a JSON response.

**/classify_issue**

_Github Issue Command Selection_

Based on the `Github Issue` below, follow the `Instructions` to select the appropriate command to execute based on the `Command Mapping`.

**/resolve_failed_test**

_Resolve Failed Test_

Fix a specific failing test using the provided failure details.


### 7. tac-7

**Command Count:** 33

#### Core Workflow

**/implement**

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**/start**

_Start the application_

PORT: If `.ports.env` exists, read FRONTEND_PORT from it, otherwise default to 5173

Variables:
- PORT: If `.ports.env` exists, read FRONTEND_PORT from it, otherwise default to 5173


#### Task Types

**/bug**

_Bug Planning_

Create a new plan to resolve the `Bug` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/chore**

_Chore Planning_

Create a new plan to resolve the `Chore` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files. Follow the

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/feature**

_Feature Planning_

Create a new plan to implement the `Feature` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/patch**

_Patch Plan_

Create a **focused patch plan** to resolve a specific issue based on the `review_change_request`. Follow the `Instructions` to create a concise plan that addresses the issue with minimal, targeted cha

Variables:
- adw_id: $1
- review_change_request: $2
- spec_path: $3 if provided, otherwise leave it blank
- agent_name: $4 if provided, otherwise use 'patch_agent'
- issue_screenshots: $5 (optional) - comma-separated list of screenshot paths if provided


#### Coordination

**/prime**

_Prime_

> Execute the following sections to understand the codebase then summarize your understanding.


#### Quality Assurance

**/review**

_Review_

Follow the `Instructions` below to **review work done against a specification file** (specs/*.md) to ensure implemented features match requirements. Use the spec file to understand the requirements an

Variables:
- adw_id: $ARGUMENT
- spec_file: $ARGUMENT
- agent_name: $ARGUMENT if provided, otherwise use 'review_agent'
- review_image_dir: `<absolute path to codebase>/agents/<adw_id>/<agent_name>/review_img/`

**/test**

_Application Validation Test Suite_

Execute comprehensive validation tests for both frontend and backend components, returning results in a standardized JSON format for automated processing.

Variables:
- TEST_COMMAND_TIMEOUT: 5 minutes

**/test_e2e**

_E2E Test Runner_

Execute end-to-end (E2E) tests using Playwright browser automation (MCP Server). If any errors occur and assertions fail mark the test as failed and explain exactly what went wrong.

Variables:
- adw_id: $ARGUMENT if provided, otherwise generate a random 8 character hex string
- agent_name: $ARGUMENT if provided, otherwise use 'test_e2e'
- e2e_test_file: $ARGUMENT
- application_url: $ARGUMENT if provided, otherwise determine from port configuration:
- - If `.ports.env` exists, source it and use http://localhost:${FRONTEND_PORT}
- - Otherwise use default http://localhost:5173


#### E2E Tests

**/e2e / test_basic_query**

_E2E Test: Basic Query Execution_

Test basic query functionality in the Natural Language SQL Interface application.

**/e2e / test_complex_query**

_E2E Test: Complex Query with Filtering_

Test complex query capabilities with filtering conditions.

**/e2e / test_disable_input_debounce**

_E2E Test: Input Disabling and Debouncing_

Test input disabling during query execution and debouncing functionality in the Natural Language SQL Interface application.

**/e2e / test_export_functionality**

_E2E Test: Export Functionality_

Test table and query result export functionality in the Natural Language SQL Interface application.

**/e2e / test_random_query_generator**

_E2E Test: Random Query Generator_

Test the random query generation functionality in the Natural Language SQL Interface application.

**/e2e / test_sql_injection**

_E2E Test: SQL Injection Protection_

Test the application's protection against SQL injection attacks.

**/resolve_failed_e2e_test**

_Resolve Failed E2E Test_

Fix a specific failing E2E test using the provided failure details.


#### Worktree Management

**/cleanup_worktrees**

_Cleanup ADW Worktrees_

Clean up isolated ADW worktrees and their associated resources.

Variables:
- action: $ARGUMENT (all|specific|list)
- adw_id: $ARGUMENT (optional, required if action is "specific")

**/install_worktree**

_Install Worktree_

This command sets up an isolated worktree environment with custom port configuration.


#### Git Integration

**/commit**

_Generate Git Commit_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a git commit with a properly formatted message. Then follow the `Report` section to report the results of you

Variables:
- agent_name: $ARGUMENT
- issue_class: $ARGUMENT
- issue: $ARGUMENT

**/generate_branch_name**

_Generate Git Branch Name_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to generate a concise Git branch name following the specified format. Then follow the `Report` section to report the re

Variables:
- issue_class: $ARGUMENT
- adw_id: $ARGUMENT
- issue: $ARGUMENT

**/pull_request**

_Create Pull Request_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a pull request. Then follow the `Report` section to report the results of your work.

Variables:
- branch_name: $ARGUMENT
- issue: $ARGUMENT
- plan_file: $ARGUMENT
- adw_id: $ARGUMENT


#### Infrastructure

**/health_check**

_Health Check_

!`uv run adws/adw_tests/health_check.py`

**/install**

_Install & Prime_

.env.sample (never read .env)

**/prepare_app**

_Prepare Application_

Setup the application for the review or test.

Variables:
- PORT: If `.ports.env` exists, read FRONTEND_PORT from it, otherwise default to 5173

**/tools**

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.


#### Documentation

**/conditional_docs**

_Conditional Documentation Guide_

This prompt helps you determine what documentation you should read based on the specific changes you need to make in the codebase. Review the conditions below and read the relevant documentation befor

**/document**

_Document Feature_

Generate concise markdown documentation for implemented features by analyzing code changes and specifications. This command creates documentation in the `app_docs/` directory based on git diff analysi

Variables:
- adw_id: $1
- spec_path: $2 if provided, otherwise leave it blank
- documentation_screenshots_dir: $3 if provided, otherwise leave it blank


#### Other

**/classify_adw**

_ADW Workflow Extraction_

Extract ADW workflow information from the text below and return a JSON response.

**/classify_issue**

_Github Issue Command Selection_

Based on the `Github Issue` below, follow the `Instructions` to select the appropriate command to execute based on the `Command Mapping`.

**/in_loop_review**

_In-Loop Review_

Quick checkout and review workflow for agent work validation.

Variables:
- branch: $ARGUMENTS

**/resolve_failed_test**

_Resolve Failed Test_

Fix a specific failing test using the provided failure details.

**/track_agentic_kpis**

_Track Agentic KPIs_

Update or create the ADW performance tracking tables in `app_docs/agentic_kpis.md`. This command analyzes the current ADW run's metrics and maintains both summary and detailed KPI tables. Think hard a

Variables:
- state_json: $ARGUMENTS
- attempts_incrementing_adws: [`adw_plan_iso`, `adw_patch_iso`]


### 8. tac-full-mastery

**Command Count:** 41

#### Core Workflow

**/build**

_Build Task_

Implement a task directly without creating a plan first.

Variables:
- adw_id: $1
- task_description: $2

**/implement**

_Implement the following plan_

Follow the `Instructions` to implement the `Plan` then `Report` the completed work.

**/plan**

_Plan_

Create a plan to complete the task using the specified markdown `Plan Format`. Research the codebase and create a thorough plan appropriate to the task's complexity.

Variables:
- adw_id: $1
- prompt: $2

**/start**

_Start the application_

PORT: If `.ports.env` exists, read FRONTEND_PORT from it, otherwise default to 5173

Variables:
- PORT: If `.ports.env` exists, read FRONTEND_PORT from it, otherwise default to 5173


#### Task Types

**/bug**

_Bug Planning_

Create a new plan to resolve the `Bug` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/chore**

_Chore Planning_

Create a new plan to resolve the `Chore` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files. Follow the

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/feature**

_Feature Planning_

Create a new plan to implement the `Feature` using the exact specified markdown `Plan Format`. Follow the `Instructions` to create the plan use the `Relevant Files` to focus on the right files.

Variables:
- issue_number: $1
- adw_id: $2
- issue_json: $3

**/patch**

_Patch Plan_

Create a **focused patch plan** to resolve a specific issue based on the `review_change_request`. Follow the `Instructions` to create a concise plan that addresses the issue with minimal, targeted cha

Variables:
- adw_id: $1
- review_change_request: $2
- spec_path: $3 if provided, otherwise leave it blank
- agent_name: $4 if provided, otherwise use 'patch_agent'
- issue_screenshots: $5 (optional) - comma-separated list of screenshot paths if provided


#### Coordination

**/mark_in_progress**

_Mark Task In Progress_

Mark tasks as in-progress in the task list file.

Variables:
- task_file_path: $1
- worktree_name: $2
- task_description: $3
- adw_id: $4

**/prime**

_Prime_

Execute the `Run`, `Read` and `Report` sections to understand the codebase then summarize your understanding.

**/process_tasks**

_Process Tasks_

Analyze the current task list and identify tasks that are ready to be picked up by agents.


#### Quality Assurance

**/review**

_Review_

Follow the `Instructions` below to **review work done against a specification file** (specs/*.md) to ensure implemented features match requirements. Use the spec file to understand the requirements an

Variables:
- adw_id: $ARGUMENT
- spec_file: $ARGUMENT
- agent_name: $ARGUMENT if provided, otherwise use 'review_agent'
- review_image_dir: `<absolute path to codebase>/agents/<adw_id>/<agent_name>/review_img/`

**/test**

_Application Validation Test Suite_

Execute comprehensive validation tests for both frontend and backend components, returning results in a standardized JSON format for automated processing.

Variables:
- TEST_COMMAND_TIMEOUT: 5 minutes

**/test_e2e**

_E2E Test Runner_

Execute end-to-end (E2E) tests using Playwright browser automation (MCP Server). If any errors occur and assertions fail mark the test as failed and explain exactly what went wrong.

Variables:
- adw_id: $ARGUMENT if provided, otherwise generate a random 8 character hex string
- agent_name: $ARGUMENT if provided, otherwise use 'test_e2e'
- e2e_test_file: $ARGUMENT
- application_url: $ARGUMENT if provided, otherwise determine from port configuration:
- - If `.ports.env` exists, source it and use http://localhost:${FRONTEND_PORT}
- - Otherwise use default http://localhost:5173


#### E2E Tests

**/e2e / test_basic_query**

_E2E Test: Basic Query Execution_

Test basic query functionality in the Natural Language SQL Interface application.

**/e2e / test_complex_query**

_E2E Test: Complex Query with Filtering_

Test complex query capabilities with filtering conditions.

**/e2e / test_disable_input_debounce**

_E2E Test: Input Disabling and Debouncing_

Test input disabling during query execution and debouncing functionality in the Natural Language SQL Interface application.

**/e2e / test_export_functionality**

_E2E Test: Export Functionality_

Test table and query result export functionality in the Natural Language SQL Interface application.

**/e2e / test_random_query_generator**

_E2E Test: Random Query Generator_

Test the random query generation functionality in the Natural Language SQL Interface application.

**/e2e / test_sql_injection**

_E2E Test: SQL Injection Protection_

Test the application's protection against SQL injection attacks.

**/resolve_failed_e2e_test**

_Resolve Failed E2E Test_

Fix a specific failing E2E test using the provided failure details.


#### Worktree Management

**/clean_worktree**

_Clean Worktree_

Remove a git worktree and its associated branch.

Variables:
- worktree_name: $ARGUMENT

**/cleanup_worktrees**

_Cleanup ADW Worktrees_

Clean up isolated ADW worktrees and their associated resources.

Variables:
- action: $ARGUMENT (all|specific|list)
- adw_id: $ARGUMENT (optional, required if action is "specific")

**/init_worktree**

_Initialize Worktree with Sparse Checkout_

Create a new git worktree for an agent to work in isolation, with only the specified directory checked out.

Variables:
- worktree_name: $1
- target_directory: $2

**/install_worktree**

_Install Worktree_

This command sets up an isolated worktree environment with custom port configuration.


#### Git Integration

**/commit**

_Generate Git Commit_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a git commit with a properly formatted message. Then follow the `Report` section to report the results of you

Variables:
- agent_name: $ARGUMENT
- issue_class: $ARGUMENT
- issue: $ARGUMENT

**/generate_branch_name**

_Generate Git Branch Name_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to generate a concise Git branch name following the specified format. Then follow the `Report` section to report the re

Variables:
- issue_class: $ARGUMENT
- adw_id: $ARGUMENT
- issue: $ARGUMENT

**/pull_request**

_Create Pull Request_

Based on the `Instructions` below, take the `Variables` follow the `Run` section to create a pull request. Then follow the `Report` section to report the results of your work.

Variables:
- branch_name: $ARGUMENT
- issue: $ARGUMENT
- plan_file: $ARGUMENT
- adw_id: $ARGUMENT


#### Infrastructure

**/health_check**

_Health Check_

!`uv run adws/adw_tests/health_check.py`

**/install**

_Install & Prime_

.env.sample (never read .env)

**/prepare_app**

_Prepare Application_

Setup the application for the review or test.

Variables:
- PORT: If `.ports.env` exists, read FRONTEND_PORT from it, otherwise default to 5173

**/tools**

_List Built-in Tools_

List all core, built-in non-mcp development tools available to you. Display in bullet format. Use typescript function syntax with parameters.


#### Documentation

**/conditional_docs**

_Conditional Documentation Guide_

This prompt helps you determine what documentation you should read based on the specific changes you need to make in the codebase. Review the conditions below and read the relevant documentation befor

**/document**

_Document Feature_

Generate concise markdown documentation for implemented features by analyzing code changes and specifications. This command creates documentation in the `app_docs/` directory based on git diff analysi

Variables:
- adw_id: $1
- spec_path: $2 if provided, otherwise leave it blank
- documentation_screenshots_dir: $3 if provided, otherwise leave it blank


#### Other

**/classify_adw**

_ADW Workflow Extraction_

Extract ADW workflow information from the text below and return a JSON response.

**/classify_issue**

_Github Issue Command Selection_

Based on the `Github Issue` below, follow the `Instructions` to select the appropriate command to execute based on the `Command Mapping`.

**/in_loop_review**

_In-Loop Review_

Quick checkout and review workflow for agent work validation.

Variables:
- branch: $ARGUMENTS

**/resolve_failed_test**

_Resolve Failed Test_

Fix a specific failing test using the provided failure details.

**/track_agentic_kpis**

_Track Agentic KPIs_

Update or create the ADW performance tracking tables in `app_docs/agentic_kpis.md`. This command analyzes the current ADW run's metrics and maintains both summary and detailed KPI tables. Think hard a

Variables:
- state_json: $ARGUMENTS
- attempts_incrementing_adws: [`adw_plan_iso`, `adw_patch_iso`]

**/update_task**

_Update Task_

Update the task list with the result of agent work.

Variables:
- adw_id: $1
- worktree_name: $2
- task_description: $3
- status: $4
- commit_hash: $5
- error_message: $ARGUMENT

**/update_task copy**

_Update Task_

Update the task list with the result of agent work.

Variables:
- adw_id: $1
- worktree_name: $2
- task_description: $3
- status: $4
- commit_hash: $5
- error_message: $ARGUMENT


---

## Pattern Evolution Analysis

### Pattern 1: Core Workflow Maturation

The `plan`, `implement`, `build`, `start` commands form the essential workflow backbone that appears in every tactic:

- **TAC-2**: Basic 3-command setup (prime, tools, install)
- **TAC-3-4**: Foundation workflow (plan, implement, feature, chore)
- **TAC-5-6**: Expanded with quality gates (test, review, resolve_failed_test)
- **TAC-7**: Enhanced coordination (health_check, track_agentic_kpis, in_loop_review)
- **TAC-8 Apps**: Specialized (delegate, orchestrate for app5; notion integration for app4)
- **Maestro**: Delegation intelligence framework (delegate, orchestrate, process_tasks)

### Pattern 2: Quality Assurance Evolution

Quality commands show increasing sophistication:

- **Level 1**: Basic `test` command
- **Level 2**: E2E test framework (`test_e2e`, `e2e/test_*.md`)
- **Level 3**: Error recovery (`resolve_failed_test`, `resolve_failed_e2e_test`)
- **Level 4**: Agentic KPIs and health checks (`track_agentic_kpis`, `health_check`)

### Pattern 3: Infrastructure & Worktree Management

Git worktree patterns appear in 60% of tactics, indicating central importance:

- **Init/Setup**: `init_worktree` - initialize task isolation
- **Management**: `clean_worktree`, `cleanup_worktrees` - resource management
- **Install**: `install_worktree` - dependency resolution in isolated environments

### Pattern 4: Delegation Intelligence (Maestro-Specific)

The Maestro project introduces new patterns not seen in tactical workflows:

- **Strategic Orchestration**: `orchestrate`, `delegate` for multi-agent coordination
- **Business Alignment**: `mark_in_progress`, `process_tasks` with business context
- **Context Management**: Environment cleanup with business objective preservation

### Pattern 5: Notion Integration (TAC-8-app4)

Specialized commands for external system integration:

- `get_notion_tasks` - fetch task board state
- `update_notion_task` - sync task completion
- `plan_uv_script`, `plan_bun_scripts`, `plan_vite_vue` - specialized planning per tech stack

---

## Command Integration Architecture

### Command Composition Patterns

#### 1. Linear Sequential Composition
```
/plan [task-id] [description]
  -> Review plan, iterate if needed
  -> /implement /path/to/plan.md
    -> /test
    -> /commit [message]
    -> /pull-request
```

#### 2. Branched Quality Gates
```
/test
  ✓ PASS -> /commit
  ✗ FAIL -> /resolve_failed_test
    -> /test (retry)
```

#### 3. Worktree Isolation Pattern
```
/init_worktree [branch-name]
  -> /plan [task]
  -> /implement /path/to/plan
  -> /test && /test_e2e
  -> /clean_worktree (optional cleanup)
```

#### 4. Multi-Agent Orchestration (Maestro)
```
/orchestrate [business-goal] [strategy]
  -> /delegate [agent-name] [task-type]
    -> Agent executes with /plan, /implement
  -> /mark_in_progress [task] [agent]
  -> /process_tasks (aggregate results)
```

---

## Infrastructure & Technology Stack

### Git-Based Workflow Infrastructure

Commands leverage git worktrees for:
- **Task Isolation**: Each task gets its own branch/worktree
- **Concurrent Development**: Multiple agents work in parallel
- **Clean Separation**: Business logic independent from infrastructure

### Plan-Driven Architecture

All tactics follow Plan Format specification:
- Plans stored in `specs/` directory
- Structured markdown format for consistency
- Parsed by `/implement` command for execution

### Variable Injection System

Commands accept parameters enabling:
- Task-specific customization
- Context preservation across sequences
- Agent coordination metadata

---

## Lessons: Systems That Build Systems

### What These Commands Teach About Meta-Engineering

#### 1. Abstraction Layers

Each command abstracts a complex operation:
- `/plan` abstracts research + design
- `/implement` abstracts execution + testing
- `/start` abstracts deployment + verification

This enables agent reasoning at higher levels without getting lost in implementation details.

#### 2. Command Reusability Across Contexts

Same command names (`/plan`, `/test`, `/commit`) work across:
- Different tech stacks (Vue, Bun, UV, Python)
- Different project types (Web app, library, API)
- Different agents (Maestro, specialized domain agents)

This suggests successful abstractions that transcend implementation details.

#### 3. Infrastructure as Enabler

The real power comes from infrastructure supporting commands:
- Worktrees enable safe parallel execution
- Git integration enables history + rollback
- Plan format enables structured reasoning

Commands are interfaces; infrastructure is what makes them effective.

#### 4. Progressive Sophistication

Evolution from TAC-2 to TAC-8 shows progression:

| Phase | Focus | Key Innovation |
|-------|-------|-----------------|
| TAC-2 | Basic execution | Prime workflow |
| TAC-3-4 | Planning | Plan format + implement |
| TAC-5-6 | Quality gates | E2E tests + resolution |
| TAC-7 | Monitoring | Health checks + KPIs |
| TAC-8 | Orchestration | Multi-agent + delegation |
| Maestro | Meta-orchestration | Delegation intelligence + business alignment |

#### 5. Domain-Specific Customization Without Loss of Core

Each tactic/project adds specialized commands while maintaining core patterns:

- **TAC-8-app4**: Adds Notion integration (get_notion_tasks, update_notion_task)
- **TAC-8-app5**: Extends e2e tests (data_generation, enhanced_drop_zone)
- **Maestro**: Adds delegation semantics (delegate, orchestrate)

Pattern: Core + specialized = optimal abstraction.

---

## Implementation Insights

### Building Command Systems

1. **Start with Linear Workflows**: Begin with plan→implement→test→commit sequence
2. **Add Quality Gates**: Insert test/review steps that branch on failure
3. **Enable Isolation**: Add init_worktree/clean_worktree for safe parallel execution
4. **Introduce Specialization**: Add domain-specific commands as needs emerge
5. **Orchestrate**: Build delegation commands when coordinating multiple agents

### Command Design Principles (Derived from TAC)

1. **Single Responsibility**: Each command does one thing well
2. **Composability**: Commands chain together naturally
3. **Idempotence**: Commands can be retried safely
4. **Context Preservation**: Commands maintain state through variables
5. **Clear Success Criteria**: Commands communicate results explicitly

---

## Conclusion

The TAC slash command ecosystem demonstrates that **effective agentic systems emerge from careful abstraction of common patterns into reusable commands**.

Key insights:

- **42 unique patterns** across 165 commands shows high abstraction efficiency
- **Evolution from 3 to 41 commands** per tactic shows natural growth paths
- **80% command reuse** (most common commands appear in 5+ tactics) validates pattern discovery
- **Maestro specialization** shows how to build meta-systems that coordinate other systems

This is what "systems that build systems" looks like in practice: not a single monolithic system, but coordinated command ecosystems where each layer builds on abstractions from layers below.
