# Configuration Reference Guide

## Table of Contents
- [Overview](#overview)
- [Configuration Structure](#configuration-structure)
- [Core Settings](#core-settings)
- [Enrichment Configuration](#enrichment-configuration)
- [Tree-of-Thought Settings](#tree-of-thought-settings)
- [Output Format Configuration](#output-format-configuration)
- [Uncertainty Handling](#uncertainty-handling)
- [Performance Settings](#performance-settings)
- [Learning System Configuration](#learning-system-configuration)
- [Bypass Mechanisms](#bypass-mechanisms)
- [Research Integration](#research-integration)
- [Question Handling](#question-handling)
- [Orchestrator Optimization](#orchestrator-optimization)
- [Environment Variables](#environment-variables)
- [Configuration Validation](#configuration-validation)
- [Advanced Configuration](#advanced-configuration)

## Overview

The Claude Code Prompt Enhancement System uses a comprehensive JSON-based configuration system that allows fine-grained control over every aspect of prompt enhancement. The configuration is designed to be both powerful and accessible, with sensible defaults that work well for most use cases while providing extensive customization options for advanced users.

### Configuration File Locations

```
Primary Configuration:
~/.claude/hooks/config/default_config.json

Override Locations (in order of precedence):
1. Environment variables
2. User config: ~/.claude/hooks/config/user_config.json
3. Project config: ./.claude-enhancer.json
4. Default config: ~/.claude/hooks/config/default_config.json
```

## Configuration Structure

### Root Configuration Schema

```json
{
  "version": "2.0.0",
  "description": "Configuration description",

  "enrichment": { ... },
  "tot_reflection": { ... },
  "output_format": { ... },
  "uncertainty_handling": { ... },
  "orchestrator_optimization": { ... },
  "bypass": { ... },
  "research": { ... },
  "questions": { ... },
  "performance": { ... },
  "learning": { ... }
}
```

## Core Settings

### Version Information

```json
{
  "version": "2.0.0",
  "description": "Optimized configuration with ToT + Reflection"
}
```

- **version**: Semantic version of the configuration schema
- **description**: Human-readable description of the configuration profile

## Enrichment Configuration

### Complete Enrichment Settings

```json
{
  "enrichment": {
    "enabled": true,
    "layers": {
      "design_guidance": true,
      "excellence_criteria": true,
      "tool_preferences": true,
      "workspace_methodology": true
    },
    "ultra_mode": {
      "enabled": true,
      "description": "Activates ToT + Reflection + Uncertainty + ReAct for extreme complexity",
      "trigger_complexity": "extreme",
      "trigger_keywords": [
        "orchestrate",
        "multi-agent",
        "research",
        "plan",
        "design system",
        "architecture",
        "evaluate alternatives",
        "decision matrix",
        "production",
        "mission-critical"
      ],
      "auto_activate_threshold": 2
    }
  }
}
```

#### Enrichment Layers

Each enrichment layer can be independently controlled:

**Design Guidance Layer**
- **Purpose**: Adds architectural and design pattern guidance
- **Impact**: Improves structural quality and consistency
- **Performance Cost**: Low (~5ms)

**Excellence Criteria Layer**
- **Purpose**: Enforces best practices and quality standards
- **Impact**: Reduces technical debt and improves maintainability
- **Performance Cost**: Medium (~10ms)

**Tool Preferences Layer**
- **Purpose**: Suggests optimal tools and technologies
- **Impact**: Improves tool selection and implementation efficiency
- **Performance Cost**: Low (~3ms)

**Workspace Methodology Layer**
- **Purpose**: Provides workflow and process guidance
- **Impact**: Improves development practices and team coordination
- **Performance Cost**: Medium (~8ms)

#### Ultra Mode Configuration

Ultra Mode provides maximum enhancement for extremely complex tasks:

**Trigger Complexity Levels:**
```json
"trigger_complexity": "extreme"  // Options: "low", "moderate", "high", "extreme"
```

**Auto-Activation Threshold:**
```json
"auto_activate_threshold": 2  // Number of trigger keywords required
```

**Performance Impact:**
- **CPU**: High (complex analysis and template generation)
- **Memory**: Medium (multiple approach generation)
- **Latency**: High (100-300ms additional processing time)

## Tree-of-Thought Settings

### Complete ToT Configuration

```json
{
  "tot_reflection": {
    "enabled": true,
    "description": "Tree-of-Thought + Mandatory Reflection (12-25% quality uplift)",
    "min_approaches": 2,
    "max_approaches": 3,
    "confidence_threshold": 8,
    "mandatory_critique": true,
    "quality_gate_minimum_score": 9,
    "require_assumption_audit": true,
    "require_plan_b": true
  }
}
```

#### ToT Parameters

**Approach Generation:**
- **min_approaches**: Minimum number of solution approaches to generate (1-5)
- **max_approaches**: Maximum number of solution approaches to generate (2-7)

**Quality Control:**
- **confidence_threshold**: Minimum confidence score for approach acceptance (1-10)
- **quality_gate_minimum_score**: Minimum score to pass quality gates (1-10)
- **mandatory_critique**: Forces self-critique for every approach

**Safety Measures:**
- **require_assumption_audit**: Requires explicit listing of assumptions
- **require_plan_b**: Forces consideration of alternative approaches

#### ToT Performance Impact

```
Approaches Generated    |    CPU Usage    |    Memory    |    Latency
------------------------|-----------------|--------------|-------------
2 approaches            |    Medium       |    Medium    |    50-100ms
3 approaches            |    High         |    High      |    100-200ms
4+ approaches           |    Very High    |    Very High |    200-400ms
```

## Output Format Configuration

### Output Structure Settings

```json
{
  "output_format": {
    "enforce_structure": true,
    "description": "Reduces malformed outputs by 15-30%",
    "require_explicit_sections": [
      "Approach Summary",
      "Implementation",
      "Testing Strategy",
      "Self-Critique"
    ],
    "json_validation": true,
    "tool_call_validation": true
  }
}
```

#### Section Enforcement

**Available Sections:**
- "Approach Summary" - High-level solution overview
- "Implementation" - Detailed implementation plan
- "Testing Strategy" - Testing and validation approach
- "Self-Critique" - Critical analysis of the solution
- "Requirements" - Explicit requirements listing
- "Assumptions" - Assumptions and constraints
- "Risks" - Risk assessment and mitigation
- "Performance Considerations" - Performance analysis

**Custom Sections:**
You can add custom sections to the required list:
```json
"require_explicit_sections": [
  "Approach Summary",
  "Implementation",
  "Testing Strategy",
  "Self-Critique",
  "Security Considerations",
  "Deployment Strategy"
]
```

## Uncertainty Handling

### Uncertainty Management Configuration

```json
{
  "uncertainty_handling": {
    "enabled": true,
    "require_explicit_assumptions": true,
    "require_plan_b_for_ambiguity": true,
    "risk_levels": ["low", "medium", "high"],
    "high_risk_requires_clarification": true
  }
}
```

#### Risk Level Configuration

**Risk Level Thresholds:**
- **Low**: Minimal impact, easily reversible decisions
- **Medium**: Moderate impact, requires some consideration
- **High**: Significant impact, requires thorough analysis

**High Risk Handling:**
When `high_risk_requires_clarification` is enabled, the system will:
- Flag high-risk assumptions
- Request clarification from users
- Suggest risk mitigation strategies
- Provide fallback options

## Performance Settings

### Performance Optimization Configuration

```json
{
  "performance": {
    "monitoring_enabled": true,
    "timeout_ms": 500,
    "log_level": "WARNING",
    "cache_templates": true,
    "max_concurrent_operations": 3,
    "memory_limit_mb": 256,
    "cpu_utilization_threshold": 80
  }
}
```

#### Performance Parameters

**Timeout Configuration:**
- **timeout_ms**: Maximum processing time per enhancement (100-2000ms)
- **monitoring_enabled**: Enable performance monitoring and metrics

**Resource Limits:**
- **max_concurrent_operations**: Maximum parallel enhancements (1-10)
- **memory_limit_mb**: Maximum memory usage (64-1024MB)
- **cpu_utilization_threshold**: CPU usage alert threshold (50-95%)

**Logging Levels:**
- **DEBUG**: Detailed logging for troubleshooting
- **INFO**: General operational information
- **WARNING**: Important events and warnings
- **ERROR**: Error conditions only
- **CRITICAL**: Critical errors only

#### Performance Tuning Guide

**For High Performance:**
```json
{
  "performance": {
    "timeout_ms": 200,
    "cache_templates": true,
    "max_concurrent_operations": 1,
    "log_level": "ERROR"
  }
}
```

**For High Quality:**
```json
{
  "performance": {
    "timeout_ms": 1000,
    "cache_templates": true,
    "max_concurrent_operations": 2,
    "log_level": "INFO"
  }
}
```

## Learning System Configuration

### Learning and Adaptation Settings

```json
{
  "learning": {
    "historical_learning_enabled": true,
    "adaptive_refinement_enabled": true,
    "performance_tracking_enabled": true,
    "cleanup_old_data_days": 30,
    "learning_rate": 0.1,
    "min_samples_for_adaptation": 10,
    "confidence_decay_days": 7
  }
}
```

#### Learning Parameters

**Historical Learning:**
- **enabled**: Enable collection and analysis of historical data
- **cleanup_old_data_days**: Automatic cleanup period (7-365 days)

**Adaptive Refinement:**
- **enabled**: Enable automatic configuration refinement
- **learning_rate**: Rate of adaptation (0.01-1.0)
- **min_samples_for_adaptation**: Minimum samples before adaptation (5-100)

**Confidence Management:**
- **confidence_decay_days**: Days before confidence scores decay (1-30)

## Bypass Mechanisms

### Bypass Configuration

```json
{
  "bypass": {
    "prefixes": ["*", "/", "#"],
    "patterns": [
      "^\\s*[!@]",
      "^\\s*(debug|test|simple)"
    ],
    "description": "Skip enrichment when user prefixes prompt with bypass character"
  }
}
```

#### Bypass Methods

**Prefix Bypass:**
Users can bypass enhancement by starting their prompt with:
- `*` - Asterisk bypass
- `/` - Slash bypass
- `#` - Hash bypass

**Pattern Bypass:**
Regular expression patterns that trigger bypass:
- `^\\s*[!@]` - Lines starting with ! or @
- `^\\s*(debug|test|simple)` - Lines starting with debug, test, or simple

**Custom Bypass Patterns:**
```json
"patterns": [
  "^\\s*quick:",
  "^\\s*bypass:",
  "^\\s*no-enhance:"
]
```

## Research Integration

### Research Configuration

```json
{
  "research": {
    "required_phase": true,
    "tools_preference": [
      "conversation_history",
      "codebase",
      "documentation",
      "web_search"
    ],
    "max_research_depth": 3
  }
}
```

#### Research Tools Priority

**Available Tools:**
- **conversation_history**: Analyze past interactions for context
- **codebase**: Search and analyze existing codebase
- **documentation**: Access project documentation
- **web_search**: Perform web searches for current information
- **file_system**: Analyze local file system
- **git_history**: Analyze git commit history

**Research Depth:**
- **max_research_depth**: Maximum recursion depth for research (1-5)

## Question Handling

### Question Generation Configuration

```json
{
  "questions": {
    "max_count": 6,
    "style": "specific_options",
    "require_research_first": true,
    "only_ask_critical_ambiguities": true
  }
}
```

#### Question Parameters

**Question Style Options:**
- **specific_options**: Multiple choice with specific options
- **open_ended**: Open-ended questions
- **clarifying**: Focused clarification questions
- **risk_assessment**: Questions about risks and assumptions

**Question Generation Logic:**
- **max_count**: Maximum questions to generate (1-20)
- **require_research_first**: Perform research before generating questions
- **only_ask_critical_ambiguities**: Only ask about critical ambiguities

## Orchestrator Optimization

### Orchestrator Configuration

```json
{
  "orchestrator_optimization": {
    "enabled": true,
    "description": "Specific optimizations for orchestration",
    "enforce_react_format": true,
    "enable_parallel_tool_use": true,
    "require_self_correction": true,
    "code_verification_with_execution": true
  }
}
```

#### Orchestration Features

**ReAct Format:**
- Reasoning and Acting format for structured responses
- Improves tool usage and decision-making clarity

**Parallel Tool Use:**
- Execute multiple tools simultaneously when possible
- Reduces overall response time

**Self-Correction:**
- Automatic detection and correction of reasoning errors
- Improves response accuracy and reliability

**Code Verification:**
- Execute generated code to verify correctness
- Reduces errors in generated code

## Environment Variables

### Supported Environment Variables

```bash
# Enable/Disable enhancement
CLAUDE_ENHANCER_ENABLED=true
CLAUDE_ENHANCER_DISABLED=false

# Configuration file path
CLAUDE_ENHANCER_CONFIG=/path/to/custom/config.json

# Performance settings
CLAUDE_ENHANCER_TIMEOUT_MS=500
CLAUDE_ENHANCER_LOG_LEVEL=WARNING

# Learning settings
CLAUDE_ENHANCER_LEARNING_ENABLED=true
CLAUDE_ENHANCER_LEARNING_PATH=/custom/learning/path

# Debug settings
CLAUDE_ENHANCER_DEBUG=false
CLAUDE_ENHANCER_DEBUG_FILE=/path/to/debug.log

# Cache settings
CLAUDE_ENHANCER_CACHE_ENABLED=true
CLAUDE_ENHANCER_CACHE_PATH=/custom/cache/path
```

### Environment Variable Precedence

Environment variables override configuration file settings:

1. Environment variables (highest precedence)
2. User config file
3. Project config file
4. Default config file (lowest precedence)

## Configuration Validation

### Validation Rules

The system validates all configurations using these rules:

#### Type Validation
```json
{
  "enabled": "boolean",
  "timeout_ms": "integer (100-2000)",
  "log_level": "enum [DEBUG, INFO, WARNING, ERROR, CRITICAL]",
  "trigger_keywords": "array of strings",
  "confidence_threshold": "number (0-10)"
}
```

#### Range Validation
```json
{
  "min_approaches": "min: 1, max: 5",
  "max_approaches": "min: 2, max: 7",
  "cleanup_old_data_days": "min: 1, max: 365",
  "learning_rate": "min: 0.01, max: 1.0"
}
```

#### Dependency Validation
Some settings depend on others:
```json
{
  "ultra_mode": {
    "depends_on": "enrichment.enabled",
    "requires": ["ultra_mode.trigger_keywords"]
  }
}
```

### Validation Commands

```bash
# Validate current configuration
claude-enhancer validate

# Validate specific configuration file
claude-enhancer validate --config /path/to/config.json

# Show configuration schema
claude-enhancer schema

# Test configuration with sample input
claude-enhancer test --config /path/to/config.json
```

## Advanced Configuration

### Profile-Based Configuration

Create configuration profiles for different use cases:

#### Development Profile
```json
{
  "profile": "development",
  "enrichment": {
    "enabled": true,
    "layers": {
      "design_guidance": true,
      "excellence_criteria": false,
      "tool_preferences": true,
      "workspace_methodology": true
    }
  },
  "performance": {
    "timeout_ms": 300,
    "log_level": "INFO"
  },
  "learning": {
    "adaptive_refinement_enabled": true
  }
}
```

#### Production Profile
```json
{
  "profile": "production",
  "enrichment": {
    "enabled": true,
    "ultra_mode": {
      "enabled": true,
      "auto_activate_threshold": 1
    }
  },
  "output_format": {
    "enforce_structure": true,
    "json_validation": true
  },
  "performance": {
    "timeout_ms": 1000,
    "monitoring_enabled": true,
    "log_level": "WARNING"
  }
}
```

#### Minimal Profile
```json
{
  "profile": "minimal",
  "enrichment": {
    "enabled": true,
    "layers": {
      "design_guidance": true,
      "excellence_criteria": false,
      "tool_preferences": false,
      "workspace_methodology": false
    },
    "ultra_mode": {
      "enabled": false
    }
  },
  "tot_reflection": {
    "enabled": false
  },
  "performance": {
    "timeout_ms": 100,
    "cache_templates": true
  }
}
```

### Dynamic Configuration

#### Runtime Configuration Updates

```python
import json
from pathlib import Path

def update_config(updates):
    config_path = Path.home() / '.claude/hooks/config/default_config.json'

    with open(config_path, 'r') as f:
        config = json.load(f)

    # Apply updates using dot notation
    for key, value in updates.items():
        keys = key.split('.')
        target = config
        for k in keys[:-1]:
            target = target.setdefault(k, {})
        target[keys[-1]] = value

    with open(config_path, 'w') as f:
        json.dump(config, f, indent=2)

# Example usage
update_config({
    'performance.timeout_ms': 800,
    'enrichment.ultra_mode.enabled': True,
    'learning.adaptive_refinement_enabled': False
})
```

#### Configuration Hot Reload

The system supports hot reloading of configuration changes:

```bash
# Enable hot reload mode
export CLAUDE_ENHANCER_HOT_RELOAD=true

# Configuration changes will be applied automatically
# without restarting the system
```

### Configuration Templates

#### Pre-built Configuration Templates

The system provides pre-built templates for common scenarios:

```bash
# List available templates
claude-enhancer templates list

# Apply a template
claude-enhancer templates apply security-focused

# Create custom template
claude-enhancer templates create my-profile --base development

# Export current configuration as template
claude-enhancer templates export my-config
```

#### Security-Focused Template
```json
{
  "template_name": "security-focused",
  "description": "Enhanced security analysis and validation",
  "enrichment": {
    "layers": {
      "design_guidance": true,
      "excellence_criteria": true,
      "tool_preferences": true,
      "workspace_methodology": true
    }
  },
  "uncertainty_handling": {
    "high_risk_requires_clarification": true
  },
  "output_format": {
    "require_explicit_sections": [
      "Security Analysis",
      "Risk Assessment",
      "Compliance Check",
      "Vulnerability Assessment"
    ]
  }
}
```

This comprehensive configuration reference provides all the information needed to customize the Claude Code Prompt Enhancement System for any use case or environment.

---

**Related Documentation:**
- [ARCHITECTURE.md](./ARCHITECTURE.md) - System architecture overview
- [TEMPLATES.md](./TEMPLATES.md) - Template system details
- [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) - Configuration troubleshooting
- [API_REFERENCE.md](./API_REFERENCE.md) - Configuration API reference