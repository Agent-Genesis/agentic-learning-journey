# Configuration Knowledge Management

**Version**: 1.0.0
**Purpose**: Preserve GLM Coding Plan configuration and MCP server knowledge
**Scope**: All Claude Code CLI configuration work for Omar El Mountassir

---

## 🚨 CRITICAL: GLM Coding Plan Setup

### Current Plan Details
- **Provider**: GLM (Z.AI)
- **Plan**: Coding Max ($180/quarter after 1st quarter at $90)
- **Reason**: 50% cheaper than Anthropic's Pro plan
- **Configuration**: Properly configured in `~/.claude/settings.json`

### Key Limitations & Implications
- **Native Claude Code tools don't work** (Web Search, etc.)
- **Requires MCP servers** for full functionality
- **Different model behavior** than native Anthropic models
- **MCP-dependent workflow** for missing native functionality

---

## 🔧 MCP Server Configuration

### Current MCP Setup (.mcp.json)
```json
{
  "mcpServers": {
    "sequential-thinking": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "web-search-prime": {
      "type": "http",
      "url": "https://api.z.ai/api/mcp/web_search_prime/mcp",
      "headers": {
        "Authorization": "223459309de64b908ae9acf7a85dc5e2.wS6s75G6YITNYGJo"
      }
    },
    "zai-mcp-server": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@z_ai/mcp-server"],
      "env": {
        "Z_AI_API_KEY": "223459309de64b908ae9acf7a85dc5e2.wS6s75G6YITNYGJo",
        "Z_AI_MODE": "ZAI"
      }
    }
  }
}
```

### MCP Server Functions
1. **sequential-thinking**: Enhanced cognitive analysis (already tested ✅)
2. **web-search-prime**: Web search functionality (replaces native Claude web search)
3. **zai-mcp-server**: Vision and image analysis capabilities

---

## 📋 Configuration Workflows

### MANDATORY: Configuration Consultation Protocol

**When working on ANY Claude Code CLI configuration:**

1. **READ THIS FILE FIRST** - Always consult CONFIGURATION_KNOWLEDGE.md
2. **IDENTIFY PLAN TYPE** - Confirm we're using GLM Coding Plan
3. **USE MCP ALTERNATIVES** - Never assume native Claude tools work
4. **VERIFY MCP FUNCTIONALITY** - Test relevant MCP servers before use
5. **DOCUMENT CHANGES** - Update this file for any configuration changes

### Native Tool Replacements

| Native Claude Tool | MCP Alternative | Status |
|-------------------|-----------------|---------|
| Web Search | web-search-prime | Test needed |
| Image Analysis | zai-mcp-server | Test needed |
| Sequential Thinking | sequential-thinking | ✅ Working |

---

## 🧪 MCP Server Testing

### Test Results Repository

#### sequential-thinking
- **Status**: ✅ WORKING
- **Test Date**: Current session
- **Capabilities**: Analytical reasoning, multi-step analysis
- **Usage**: `mcp__sequential-thinking__sequentialthinking`

#### web-search-prime
- **Status**: ✅ WORKING
- **Test Date**: Current session
- **Capabilities**: Web search functionality replacing native Claude web search
- **Usage**: `mcp__web-search-prime__webSearchPrime`
- **Test Results**: Successfully retrieved 5 relevant results about GLM Coding Plan

#### zai-mcp-server
- **Status**: ⚠️ PARTIAL (Image analysis requires proper image format)
- **Test Date**: Current session
- **Capabilities**: Vision and image analysis
- **Usage**: `mcp__zai-mcp-server__analyze_image`
- **Note**: Requires proper image input format, placeholder URLs don't work

---

## 🔗 Important Resources

### GLM/Z.AI Documentation
- **Subscription**: https://z.ai/subscribe?_channel_track_key=6lShUDnv
- **Claude Integration**: https://docs.z.ai/devpack/tool/claude
- **Vision MCP Server**: https://docs.z.ai/devpack/mcp/vision-mcp-server
- **Search MCP Server**: https://docs.z.ai/devpack/mcp/search-mcp-server

### Key Configuration Files
- **MCP Config**: `.mcp.json` (project-specific)
- **Claude Settings**: `~/.claude/settings.json` (global GLM configuration)
- **Main Instructions**: `CLAUDE.md` (should reference this file for config work)

---

## ⚠️ Troubleshooting

### Common Issues & Solutions

1. **Native tools not working**
   - **Cause**: Using GLM Coding Plan instead of Anthropic Pro
   - **Solution**: Use MCP alternatives documented above

2. **MCP servers not responding**
   - **Check**: `.mcp.json` configuration
   - **Verify**: API keys are valid and current
   - **Test**: Use appropriate MCP tool calls

3. **Configuration conflicts**
   - **Always**: Consult this file first
   - **Never**: Assume native Claude functionality
   - **Verify**: Plan type and limitations

---

## 📝 Maintenance Log

### Version History
- **v1.0.0**: Initial creation with GLM Coding Plan documentation
- **Created**: Current session date
- **Author**: Claude Code with Sequential Thinking enhancement

### Update Protocol
- **When**: Any configuration change occurs
- **What**: Update all relevant sections
- **How**: Test changes, then document results here

---

## 🏗️ SOFTWARE ENGINEERING PRINCIPLES (CRITICAL)

### 🚨 MANDATORY: File Organization Principles

**FOR ALL CLAUDE INSTANCES: These principles MUST be followed for ALL file creation and organization work.**

#### SOLID Principles Applied to File Organization

1. **Single Responsibility Principle (SRP)**
   - Each directory has ONE clear purpose
   - Each file serves ONE primary function
   - **Before creating any file/directory**: Ask "What is its single responsibility?"

2. **Open/Closed Principle (OCP)**
   - Structure is open for extension, closed for modification
   - New content types fit existing patterns without restructuring
   - **Before adding new content**: Check if it fits existing structure

3. **Liskov Substitution Principle (LSP)**
   - Consistent patterns throughout the project
   - Files of similar type follow same organizational rules
   - **Maintain consistency**: Similar content in similar locations

4. **Interface Segregation Principle (ISP)**
   - Clear boundaries between different concerns
   - Don't mix unrelated content in same directory
   - **Separate concerns**: Different content types in different directories

5. **Dependency Inversion Principle (DIP)**
   - High-level concepts independent of implementation details
   - Configuration files shouldn't depend on specific tools
   - **Maintain abstraction**: General concepts over specific implementations

#### Additional Critical Principles

6. **DRY (Don't Repeat Yourself)**
   - **ZERO TOLERANCE for duplication**
   - Each piece of information has ONE single source of truth
   - **Before creating content**: Search for existing similar content

7. **KISS (Keep It Simple, Stupid)**
   - Simple, predictable structure
   - Avoid over-engineering
   - **Flat hierarchy when possible**: Deep nesting only when necessary

8. **YAGNI (You Aren't Gonna Need It)**
   - Don't create structure for hypothetical future needs
   - Build for current requirements
   - **Remove unnecessary complexity**: If not needed now, don't create it

#### Clean Architecture Principles

9. **Domain-Driven Organization**
   - Organize by business domain, not technical implementation
   - **Content-based directories**: `tasks/`, `docs/`, `scripts/`, `config/`
   - **Not implementation-based**: `python/`, `markdown/`, `json/`

10. **Dependency Direction**
    - Clear hierarchy from abstract to concrete
    - **Source → Configuration → Generated Content**
    - **Never**: Generated content mixed with source

11. **Separation of Concerns**
    - **Source content**: Code, documentation, configuration
    - **Generated content**: Logs, build artifacts, temporary files
    - **NEVER mix**: Source and generated content in same directory

### 🚨 PRE-CREATION CHECKLIST (MANDATORY)

**Before creating ANY file or directory, Claude MUST:**

1. **Content Analysis**:
   - What type of content is this? (code, docs, config, generated)
   - What business domain does it belong to?
   - Is there existing content of this type?

2. **Duplication Check (DRY)**:
   - Search entire project for similar content
   - Check if this content already exists
   - **If found**: Update existing content, don't duplicate

3. **Single Responsibility Validation**:
   - What is the single purpose of this file/directory?
   - Does this purpose conflict with existing directories?
   - **If conflict**: Reorganize, don't create compromise

4. **Placement Decision**:
   - Based on content type and domain
   - Check existing directory structure
   - **Create directory ONLY** if clear need and no existing alternative

5. **Architecture Validation**:
   - Does this follow SOLID principles?
   - Does it maintain clean architecture?
   - **If no**: Reconsider approach

### 📁 APPROVED DIRECTORY STRUCTURE

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

**CRITICAL RULES:**
- **ONE location per content type** - no duplicates
- **Clear separation**: Source vs generated content
- **Single responsibility**: Each directory has one purpose
- **Consistent naming**: Follow established patterns

### 🚨 BEHAVIORAL CONSTRAINTS FOR CLAUDE

**Claude MUST NEVER:**
- Create files at root without consideration
- Duplicate existing content
- Mix different content types in same directory
- Create overly complex nested structures
- Ignore established patterns and conventions

**Claude MUST ALWAYS:**
- Use this checklist before file creation
- Search for existing content before creating new
- Consider single responsibility for organization
- Maintain clean architecture principles
- Update this knowledge when patterns evolve

---

## 🎯 Usage Guidelines

### For Claude Code Instances
1. **Configuration Work**: ALWAYS read this file first
2. **Tool Selection**: Use MCP alternatives, not native tools
3. **Problem Solving**: Check GLM limitations before troubleshooting
4. **Documentation**: Update this file with any changes

### For Omar El Mountassir
1. **Reference**: Direct Claude to this file for config work
2. **Updates**: Inform Claude of any plan changes or API updates
3. **Troubleshooting**: Use this file as first diagnostic step

---

**Authority**: Configuration Knowledge Management for GLM Coding Plan
**Maintained by**: Automatic updates during configuration work
**Critical Importance**: Preserve this knowledge to ensure proper Claude Code CLI functionality