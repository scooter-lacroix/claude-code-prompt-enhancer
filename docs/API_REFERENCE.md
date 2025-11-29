# API Reference Documentation

## Table of Contents
- [Overview](#overview)
- [Core API Functions](#core-api-functions)
- [Enhancement Engine API](#enhancement-engine-api)
- [Template System API](#template-system-api)
- [Learning System API](#learning-system-api)
- [Configuration API](#configuration-api)
- [Utility Functions](#utility-functions)
- [Error Handling](#error-handling)
- [Examples and Usage](#examples-and-usage)
- [API Changelog](#api-changelog)

## Overview

The Claude Code Prompt Enhancement System provides a comprehensive API for programmatic access to all system functionality. This API reference covers all public functions, their parameters, return values, and usage examples.

### API Structure

```
Enhancement System API
├── Core Functions
│   ├── enhance_prompt()
│   ├── analyze_input()
│   └── select_template()
├── Template System
│   ├── TemplateEngine
│   ├── TemplateSelector
│   └── TemplateRenderer
├── Learning System
│   ├── LearningEngine
│   ├── PatternRecognizer
│   └── PerformanceMonitor
├── Configuration
│   ├── ConfigManager
│   └── ValidationEngine
└── Utilities
    ├── ErrorHandler
    ├── PerformanceProfiler
    └── DataValidator
```

## Core API Functions

### enhance_prompt()

The main function for enhancing user prompts.

```python
def enhance_prompt(
    prompt: str,
    context: Optional[Dict[str, Any]] = None,
    user_preferences: Optional[Dict[str, Any]] = None,
    force_template: Optional[str] = None
) -> Dict[str, Any]:
    """
    Enhance a user prompt with context-aware guidance and structure.

    Args:
        prompt (str): The original user prompt to enhance
        context (Optional[Dict[str, Any]]): Additional context information
            - 'working_directory' (str): Current working directory
            - 'recent_files' (List[str]): Recently accessed files
            - 'domain' (str): Detected domain (programming, design, etc.)
            - 'complexity_score' (int): Pre-calculated complexity (1-10)
        user_preferences (Optional[Dict[str, Any]]): User-specific preferences
            - 'preferred_language' (str): Programming language preference
            - 'template_preferences' (List[str]): Preferred template types
            - 'enhancement_level' (str): conservative, balanced, aggressive
        force_template (Optional[str]): Force specific template usage

    Returns:
        Dict[str, Any]: Enhancement result containing:
            - 'enhanced_prompt' (str): The enhanced prompt
            - 'template_used' (str): Name of template applied
            - 'complexity_score' (int): Calculated complexity score
            - 'enhancement_metadata' (Dict): Metadata about enhancement
            - 'processing_time_ms' (int): Time taken for enhancement
            - 'success' (bool): Whether enhancement was successful
            - 'error' (Optional[str]): Error message if failed

    Raises:
        ValueError: If prompt is empty or invalid
        EnhancementError: If enhancement process fails
        ConfigurationError: If system configuration is invalid

    Example:
        >>> result = enhance_prompt(
        ...     "Write a function to validate email addresses",
        ...     context={'domain': 'programming', 'complexity_score': 3},
        ...     user_preferences={'preferred_language': 'python'}
        ... )
        >>> print(result['enhanced_prompt'])
        >>> print(f"Template used: {result['template_used']}")
    """
```

### analyze_input()

Analyzes input prompt for complexity, keywords, and context.

```python
def analyze_input(
    prompt: str,
    include_context: bool = True,
    deep_analysis: bool = False
) -> Dict[str, Any]:
    """
    Analyze user input to extract insights for enhancement.

    Args:
        prompt (str): The user prompt to analyze
        include_context (bool): Whether to include contextual analysis
        deep_analysis (bool): Whether to perform deep analysis (slower)

    Returns:
        Dict[str, Any]: Analysis results containing:
            - 'complexity_score' (int): Complexity score (1-10)
            - 'detected_keywords' (List[str]): Technical keywords detected
            - 'domain' (str): Detected domain
            - 'task_type' (str): Type of task identified
            - 'file_references' (List[Dict]): Referenced files and their context
            - 'context_analysis' (Dict): Detailed context analysis
            - 'complexity_factors' (List[Dict]): Factors affecting complexity
            - 'processing_time_ms' (int): Analysis processing time

    Example:
        >>> analysis = analyze_input("Design a microservices architecture")
        >>> print(f"Complexity: {analysis['complexity_score']}")
        >>> print(f"Keywords: {analysis['detected_keywords']}")
    """
```

### select_template()

Selects the most appropriate template for given context.

```python
def select_template(
    context: Dict[str, Any],
    complexity_score: int,
    keywords: List[str],
    user_history: Optional[Dict[str, Any]] = None
) -> Dict[str, Any]:
    """
    Select the best template for given context and analysis.

    Args:
        context (Dict[str, Any]): Context information
            - 'user_input' (str): Original user input
            - 'domain' (str): Detected domain
            - 'task_type' (str): Type of task
        complexity_score (int): Complexity score (1-10)
        keywords (List[str]): Detected keywords
        user_history (Optional[Dict[str, Any]]): User's enhancement history

    Returns:
        Dict[str, Any]: Template selection result:
            - 'selected_template' (str): Name of selected template
            - 'template_version' (str): Template version
            - 'selection_score' (float): Confidence score (0-1)
            - 'alternative_templates' (List[Dict]): Alternative templates
            - 'selection_reason' (str): Reason for selection
            - 'expected_performance' (Dict): Expected performance metrics

    Example:
        >>> selection = select_template(context, 7, ['architecture', 'design'])
        >>> print(f"Selected: {selection['selected_template']}")
        >>> print(f"Confidence: {selection['selection_score']}")
    """
```

## Enhancement Engine API

### EnhancementEngine

Main class for prompt enhancement operations.

```python
class EnhancementEngine:
    """
    Core enhancement engine for processing and enhancing prompts.
    """

    def __init__(
        self,
        config_path: Optional[str] = None,
        learning_enabled: bool = True
    ):
        """
        Initialize the enhancement engine.

        Args:
            config_path (Optional[str]): Path to configuration file
            learning_enabled (bool): Enable learning system

        Raises:
            ConfigurationError: If configuration is invalid
            InitializationError: If engine fails to initialize
        """

    def enhance(
        self,
        prompt: str,
        context: Optional[Dict[str, Any]] = None,
        options: Optional[Dict[str, Any]] = None
    ) -> EnhancementResult:
        """
        Enhance a prompt using the full enhancement pipeline.

        Args:
            prompt (str): Prompt to enhance
            context (Optional[Dict[str, Any]]): Enhancement context
            options (Optional[Dict[str, Any]]): Enhancement options
                - 'force_template' (str): Force specific template
                - 'bypass_learning' (bool): Skip learning updates
                - 'performance_mode' (bool): Optimize for speed

        Returns:
            EnhancementResult: Result object with enhanced data

        Raises:
            EnhancementError: If enhancement fails
            ValidationError: If input validation fails
        """

    def analyze_complexity(
        self,
        prompt: str,
        context: Optional[Dict[str, Any]] = None
    ) -> ComplexityAnalysis:
        """
        Analyze prompt complexity using multiple factors.

        Returns:
            ComplexityAnalysis: Detailed complexity analysis
        """

    def get_performance_metrics(self) -> PerformanceMetrics:
        """
        Get current performance metrics for the engine.

        Returns:
            PerformanceMetrics: Current performance data
        """

    def reset_learning(self) -> None:
        """
        Reset learning system data.
        """

    def update_configuration(
        self,
        config_updates: Dict[str, Any]
    ) -> None:
        """
        Update engine configuration.

        Args:
            config_updates (Dict[str, Any]): Configuration updates
        """
```

### EnhancementResult

Result object for enhancement operations.

```python
@dataclass
class EnhancementResult:
    """
    Result object containing enhancement outcomes.
    """
    enhanced_prompt: str
    original_prompt: str
    template_used: str
    complexity_score: int
    processing_time_ms: int
    success: bool
    error: Optional[str] = None
    metadata: Optional[Dict[str, Any]] = field(default_factory=dict)
    quality_score: Optional[float] = None
    learning_data: Optional[Dict[str, Any]] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert result to dictionary format."""

    def to_json(self) -> str:
        """Convert result to JSON string."""

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'EnhancementResult':
        """Create result from dictionary."""
```

## Template System API

### TemplateEngine

Core template processing engine.

```python
class TemplateEngine:
    """
    Template processing and rendering engine.
    """

    def __init__(
        self,
        template_directory: str,
        cache_enabled: bool = True,
        cache_size: int = 100
    ):
        """
        Initialize template engine.

        Args:
            template_directory (str): Directory containing templates
            cache_enabled (bool): Enable template caching
            cache_size (int): Maximum cache size
        """

    def load_template(self, template_name: str) -> Template:
        """
        Load a template by name.

        Args:
            template_name (str): Name of template to load

        Returns:
            Template: Loaded template object

        Raises:
            TemplateNotFoundError: If template doesn't exist
            TemplateLoadError: If template fails to load
        """

    def render_template(
        self,
        template: Template,
        context: Dict[str, Any]
    ) -> str:
        """
        Render a template with given context.

        Args:
            template (Template): Template to render
            context (Dict[str, Any]): Context variables

        Returns:
            str: Rendered template content

        Raises:
            TemplateRenderError: If rendering fails
        """

    def list_templates(self) -> List[TemplateInfo]:
        """
        List all available templates.

        Returns:
            List[TemplateInfo]: Information about available templates
        """

    def validate_template(self, template: Template) -> ValidationResult:
        """
        Validate template syntax and structure.

        Args:
            template (Template): Template to validate

        Returns:
            ValidationResult: Validation results
        """
```

### TemplateSelector

Template selection and matching logic.

```python
class TemplateSelector:
    """
    Intelligent template selection based on context analysis.
    """

    def __init__(
        self,
        template_engine: TemplateEngine,
        learning_engine: Optional['LearningEngine'] = None
    ):

    def select_best_template(
        self,
        context: Dict[str, Any],
        complexity_score: int,
        keywords: List[str]
    ) -> SelectionResult:
        """
        Select the best template for given context.

        Args:
            context (Dict[str, Any]): Enhancement context
            complexity_score (int): Complexity score (1-10)
            keywords (List[str]): Detected keywords

        Returns:
            SelectionResult: Template selection result
        """

    def calculate_match_score(
        self,
        template: Template,
        context: Dict[str, Any]
    ) -> float:
        """
        Calculate match score for template against context.

        Returns:
            float: Match score (0-1)
        """

    def get_alternative_templates(
        self,
        selected_template: Template,
        context: Dict[str, Any]
    ) -> List[Template]:
        """
        Get alternative template suggestions.

        Returns:
            List[Template]: Alternative templates
        """
```

### Template

Template representation and methods.

```python
@dataclass
class Template:
    """
    Template representation with metadata and content.
    """
    name: str
    version: str
    category: str
    complexity_threshold: int
    trigger_keywords: List[str]
    content: str
    metadata: Dict[str, Any]
    created_at: datetime
    updated_at: datetime

    def render(
        self,
        context: Dict[str, Any],
        engine: TemplateEngine
    ) -> str:
        """
        Render template with context.

        Args:
            context (Dict[str, Any]): Template context
            engine (TemplateEngine): Template engine instance

        Returns:
            str: Rendered content
        """

    def validate(self) -> ValidationResult:
        """
        Validate template structure and syntax.

        Returns:
            ValidationResult: Validation results
        """

    def matches_context(
        self,
        context: Dict[str, Any]
    ) -> bool:
        """
        Check if template matches given context.

        Args:
            context (Dict[str, Any]): Context to match against

        Returns:
            bool: Whether template matches context
        """

    def to_dict(self) -> Dict[str, Any]:
        """Convert template to dictionary."""

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'Template':
        """Create template from dictionary."""
```

## Learning System API

### LearningEngine

Core learning and adaptation system.

```python
class LearningEngine:
    """
    Learning system for continuous improvement and adaptation.
    """

    def __init__(
        self,
        data_directory: str,
        config: Dict[str, Any]
    ):
        """
        Initialize learning engine.

        Args:
            data_directory (str): Directory for learning data
            config (Dict[str, Any]): Learning configuration
        """

    def record_interaction(
        self,
        interaction_data: InteractionData
    ) -> None:
        """
        Record an interaction for learning.

        Args:
            interaction_data (InteractionData): Interaction data to record
        """

    def analyze_patterns(self) -> PatternAnalysis:
        """
        Analyze patterns in collected data.

        Returns:
            PatternAnalysis: Discovered patterns
        """

    def optimize_templates(self) -> OptimizationResult:
        """
        Optimize templates based on learning data.

        Returns:
            OptimizationResult: Optimization results
        """

    def predict_template_performance(
        self,
        template: Template,
        context: Dict[str, Any]
    ) -> PerformancePrediction:
        """
        Predict template performance in given context.

        Returns:
            PerformancePrediction: Performance prediction
        """

    def get_insights(
        self,
        time_range: Optional[str] = None
    ) -> LearningInsights:
        """
        Get learning insights and recommendations.

        Args:
            time_range (Optional[str]): Time range for insights

        Returns:
            LearningInsights: Current learning insights
        """

    def export_learning_data(
        self,
        format: str = 'json'
    ) -> str:
        """
        Export learning data in specified format.

        Args:
            format (str): Export format ('json', 'csv', 'parquet')

        Returns:
            str: Path to exported data file
        """
```

### PatternRecognizer

Pattern detection and analysis.

```python
class PatternRecognizer:
    """
    Advanced pattern recognition for learning system.
    """

    def __init__(self, config: Dict[str, Any]):

    def detect_usage_patterns(
        self,
        data: List[InteractionData]
    ) -> List[UsagePattern]:
        """
        Detect usage patterns in interaction data.

        Returns:
            List[UsagePattern]: Detected usage patterns
        """

    def detect_success_patterns(
        self,
        data: List[InteractionData]
    ) -> List[SuccessPattern]:
        """
        Detect patterns associated with successful outcomes.

        Returns:
            List[SuccessPattern]: Success patterns
        """

    def detect_anomalies(
        self,
        data: List[InteractionData],
        threshold: float = 2.0
    ) -> List[Anomaly]:
        """
        Detect anomalies in the data.

        Args:
            data (List[InteractionData]): Data to analyze
            threshold (float): Anomaly detection threshold

        Returns:
            List[Anomaly]: Detected anomalies
        """

    def predict_future_patterns(
        self,
        historical_data: List[InteractionData]
    ) -> PredictionResults:
        """
        Predict future patterns based on historical data.

        Returns:
            PredictionResults: Pattern predictions
        """
```

## Configuration API

### ConfigManager

Configuration management and validation.

```python
class ConfigManager:
    """
    Configuration manager for the enhancement system.
    """

    def __init__(
        self,
        config_path: Optional[str] = None,
        auto_reload: bool = True
    ):
        """
        Initialize configuration manager.

        Args:
            config_path (Optional[str]): Path to configuration file
            auto_reload (bool): Enable automatic configuration reloading
        """

    def load_config(
        self,
        config_path: str
    ) -> Dict[str, Any]:
        """
        Load configuration from file.

        Args:
            config_path (str): Path to configuration file

        Returns:
            Dict[str, Any]: Loaded configuration

        Raises:
            ConfigurationError: If configuration is invalid
        """

    def get_config_value(
        self,
        key: str,
        default: Any = None
    ) -> Any:
        """
        Get configuration value by key.

        Args:
            key (str): Configuration key (supports dot notation)
            default (Any): Default value if key not found

        Returns:
            Any: Configuration value

        Example:
            timeout = config_manager.get_config_value(
                'performance.timeout_ms',
                default=500
            )
        """

    def update_config_value(
        self,
        key: str,
        value: Any
    ) -> None:
        """
        Update configuration value.

        Args:
            key (str): Configuration key
            value (Any): New value
        """

    def validate_config(
        self,
        config: Dict[str, Any]
    ) -> ValidationResult:
        """
        Validate configuration structure and values.

        Args:
            config (Dict[str, Any]): Configuration to validate

        Returns:
            ValidationResult: Validation results
        """

    def reload_config(self) -> None:
        """
        Reload configuration from file.
        """

    def save_config(
        self,
        config_path: Optional[str] = None
    ) -> None:
        """
        Save current configuration to file.

        Args:
            config_path (Optional[str]): Path to save configuration
        """
```

### ValidationEngine

Configuration and data validation.

```python
class ValidationEngine:
    """
    Validation engine for configurations and data.
    """

    def __init__(self, schema_path: str):

    def validate_config_schema(
        self,
        config: Dict[str, Any]
    ) -> ValidationResult:
        """
        Validate configuration against schema.

        Args:
            config (Dict[str, Any]): Configuration to validate

        Returns:
            ValidationResult: Schema validation results
        """

    def validate_input_data(
        self,
        data: Dict[str, Any],
        schema_name: str
    ) -> ValidationResult:
        """
        Validate input data against schema.

        Args:
            data (Dict[str, Any]): Data to validate
            schema_name (str): Name of validation schema

        Returns:
            ValidationResult: Data validation results
        """

    def validate_template(
        self,
        template: Template
    ) -> ValidationResult:
        """
        Validate template structure and content.

        Args:
            template (Template): Template to validate

        Returns:
            ValidationResult: Template validation results
        """

    def get_schema(
        self,
        schema_name: str
    ) -> Dict[str, Any]:
        """
        Get validation schema by name.

        Args:
            schema_name (str): Schema name

        Returns:
            Dict[str, Any]: Validation schema
        """
```

## Utility Functions

### ErrorHandler

Centralized error handling and logging.

```python
class ErrorHandler:
    """
    Error handling and logging utilities.
    """

    def __init__(
        self,
        log_level: str = 'WARNING',
        log_file: Optional[str] = None
    ):

    @staticmethod
    def handle_enhancement_error(
        error: Exception,
        context: Dict[str, Any]
    ) -> Dict[str, Any]:
        """
        Handle enhancement-related errors.

        Args:
            error (Exception): The error that occurred
            context (Dict[str, Any]): Context information

        Returns:
            Dict[str, Any]: Error handling result
        """

    @staticmethod
    def create_error_context(
        operation: str,
        input_data: Any,
        additional_context: Optional[Dict[str, Any]] = None
    ) -> Dict[str, Any]:
        """
        Create error context for logging.

        Args:
            operation (str): Operation that failed
            input_data (Any): Input data that caused error
            additional_context (Optional[Dict[str, Any]]): Additional context

        Returns:
            Dict[str, Any]: Error context
        """

    def log_error(
        self,
        error: Exception,
        context: Dict[str, Any],
        level: str = 'ERROR'
    ) -> None:
        """
        Log error with context.

        Args:
            error (Exception): Error to log
            context (Dict[str, Any]): Error context
            level (str): Log level
        """
```

### PerformanceProfiler

Performance monitoring and profiling.

```python
class PerformanceProfiler:
    """
    Performance monitoring and profiling utilities.
    """

    def __init__(self):
        self.metrics = defaultdict(list)

    @contextmanager
    def profile_operation(
        self,
        operation_name: str
    ):
        """
        Context manager for profiling operations.

        Args:
            operation_name (str): Name of operation being profiled

        Usage:
            with profiler.profile_operation('template_selection'):
                result = select_template(context)
        """

    def record_metric(
        self,
        metric_name: str,
        value: Union[int, float],
        tags: Optional[Dict[str, str]] = None
    ) -> None:
        """
        Record a performance metric.

        Args:
            metric_name (str): Name of metric
            value (Union[int, float]): Metric value
            tags (Optional[Dict[str, str]]): Additional tags
        """

    def get_metrics_summary(
        self,
        metric_name: str,
        time_range: Optional[str] = None
    ) -> MetricsSummary:
        """
        Get summary of metrics for given name.

        Args:
            metric_name (str): Name of metric
            time_range (Optional[str]): Time range for summary

        Returns:
            MetricsSummary: Metrics summary
        """

    def get_performance_report(self) -> PerformanceReport:
        """
        Generate comprehensive performance report.

        Returns:
            PerformanceReport: Performance report with all metrics
        """

    def reset_metrics(self) -> None:
        """
        Reset all collected metrics.
        """
```

### DataValidator

Data validation and sanitization utilities.

```python
class DataValidator:
    """
    Data validation and sanitization utilities.
    """

    @staticmethod
    def validate_prompt(prompt: str) -> ValidationResult:
        """
        Validate user prompt input.

        Args:
            prompt (str): Prompt to validate

        Returns:
            ValidationResult: Validation result
        """

    @staticmethod
    def sanitize_input(
        input_data: str,
        max_length: int = 10000
    ) -> str:
        """
        Sanitize user input data.

        Args:
            input_data (str): Input data to sanitize
            max_length (int): Maximum allowed length

        Returns:
            str: Sanitized input data
        """

    @staticmethod
    def validate_context(context: Dict[str, Any]) -> ValidationResult:
        """
        Validate enhancement context.

        Args:
            context (Dict[str, Any]): Context to validate

        Returns:
            ValidationResult: Validation result
        """

    @staticmethod
    def extract_file_references(
        prompt: str,
        working_directory: Optional[str] = None
    ) -> List[Dict[str, Any]]:
        """
        Extract and validate file references from prompt.

        Args:
            prompt (str): Prompt to analyze
            working_directory (Optional[str]): Base directory for relative paths

        Returns:
            List[Dict[str, Any]]: Validated file references
        """
```

## Error Handling

### Exception Hierarchy

```python
class EnhancementError(Exception):
    """Base exception for enhancement system errors."""

class ConfigurationError(EnhancementError):
    """Configuration-related errors."""

class TemplateError(EnhancementError):
    """Template-related errors."""

class LearningError(EnhancementError):
    """Learning system errors."""

class ValidationError(EnhancementError):
    """Data validation errors."""

class PerformanceError(EnhancementError):
    """Performance-related errors."""
```

### Error Response Format

```python
@dataclass
class ErrorResponse:
    """
    Standardized error response format.
    """
    error_code: str
    error_message: str
    error_type: str
    context: Optional[Dict[str, Any]] = None
    timestamp: datetime = field(default_factory=datetime.now)
    request_id: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert error response to dictionary."""

    @classmethod
    def from_exception(
        cls,
        exception: Exception,
        context: Optional[Dict[str, Any]] = None
    ) -> 'ErrorResponse':
        """Create error response from exception."""
```

## Examples and Usage

### Basic Enhancement Example

```python
from prompt_enhancer import enhance_prompt, analyze_input

# Basic prompt enhancement
prompt = "Write a function to validate email addresses"
result = enhance_prompt(
    prompt,
    context={'domain': 'programming', 'preferred_language': 'python'}
)

print(f"Enhanced Prompt:\n{result['enhanced_prompt']}")
print(f"Template Used: {result['template_used']}")
print(f"Complexity Score: {result['complexity_score']}")
print(f"Processing Time: {result['processing_time_ms']}ms")
```

### Advanced Enhancement with Custom Configuration

```python
from prompt_enhancer import EnhancementEngine
from prompt_enhancer.config import ConfigManager

# Load custom configuration
config_manager = ConfigManager('custom_config.json')
config = config_manager.load_config()

# Initialize enhancement engine
engine = EnhancementEngine(
    config_path='custom_config.json',
    learning_enabled=True
)

# Enhance with custom options
result = engine.enhance(
    prompt="Design a microservices architecture for e-commerce",
    context={
        'working_directory': '/home/user/ecommerce-project',
        'recent_files': ['api.py', 'models.py', 'services.py'],
        'team_size': 5,
        'performance_requirements': 'high'
    },
    options={
        'force_template': 'advanced_system_design',
        'performance_mode': False
    }
)

# Get detailed analysis
analysis = engine.analyze_complexity(
    result.original_prompt,
    context=result.metadata.get('context', {})
)

print(f"Complexity Analysis: {analysis.to_dict()}")
```

### Template System Example

```python
from prompt_enhancer.templates import TemplateEngine, TemplateSelector

# Initialize template engine
template_engine = TemplateEngine(
    template_directory='./templates',
    cache_enabled=True
)

# List available templates
templates = template_engine.list_templates()
for template_info in templates:
    print(f"Template: {template_info.name} (v{template_info.version})")

# Load and render template
template = template_engine.load_template('basic_programming')
context = {
    'user_input': 'Write a sorting function',
    'preferred_language': 'python',
    'complexity_score': 3
}

rendered = template_engine.render_template(template, context)
print(f"Rendered Template:\n{rendered}")
```

### Learning System Example

```python
from prompt_enhancer.learning import LearningEngine, InteractionData

# Initialize learning engine
learning_engine = LearningEngine(
    data_directory='./learning_data',
    config={'learning_rate': 0.1, 'adaptation_threshold': 0.05}
)

# Record interaction for learning
interaction = InteractionData(
    user_input="Write a REST API for user management",
    enhanced_prompt=result['enhanced_prompt'],
    template_used='standard_api_design',
    complexity_score=6,
    processing_time_ms=145,
    user_feedback={'satisfaction': 9, 'quality_score': 8.5},
    timestamp=datetime.now()
)

learning_engine.record_interaction(interaction)

# Analyze patterns
patterns = learning_engine.analyze_patterns()
print(f"Discovered Patterns: {len(patterns.usage_patterns)}")

# Get optimization suggestions
optimization = learning_engine.optimize_templates()
for suggestion in optimization.suggestions:
    print(f"Suggestion: {suggestion.description}")
    print(f"Impact: {suggestion.expected_improvement}")
```

### Performance Monitoring Example

```python
from prompt_enhancer.utils import PerformanceProfiler

# Initialize profiler
profiler = PerformanceProfiler()

# Profile enhancement operation
with profiler.profile_operation('full_enhancement'):
    result = enhance_prompt(
        "Create a comprehensive testing strategy",
        context={'project_type': 'web_application'}
    )

# Record custom metrics
profiler.record_metric('template_selection_score', 0.85)
profiler.record_metric('quality_improvement', 0.42)

# Get performance report
report = profiler.get_performance_report()
print(f"Average Enhancement Time: {report.avg_enhancement_time}ms")
print(f"Success Rate: {report.success_rate * 100}%")
print(f"Total Enhancements: {report.total_enhancements}")
```

### Error Handling Example

```python
from prompt_enhancer import EnhancementError
from prompt_enhancer.utils import ErrorHandler

# Initialize error handler
error_handler = ErrorHandler(log_level='INFO')

try:
    result = enhance_prompt("")  # Empty prompt
except EnhancementError as e:
    # Handle enhancement-specific errors
    error_context = ErrorHandler.create_error_context(
        operation='enhance_prompt',
        input_data=""
    )
    error_handler.log_error(e, error_context)

    # Return user-friendly error response
    error_response = ErrorResponse.from_exception(e, error_context)
    print(f"Error: {error_response.error_message}")
```

## API Changelog

### Version 2.0.0
- Added LearningEngine with pattern recognition
- Introduced TemplateSelector with intelligent matching
- Enhanced error handling with structured responses
- Added performance profiling utilities
- Improved configuration management
- Added comprehensive validation system

### Version 1.5.0
- Added deep analysis mode to analyze_input()
- Introduced template versioning
- Added context caching
- Enhanced learning system with predictive capabilities
- Added batch processing support

### Version 1.2.0
- Added performance monitoring
- Introduced template alternatives
- Enhanced configuration validation
- Added export/import functionality for learning data
- Improved error messages and debugging

### Version 1.0.0
- Initial release
- Core enhancement functionality
- Basic template system
- Simple configuration management
- Basic learning capabilities

This comprehensive API reference provides all the information needed to integrate with and extend the Claude Code Prompt Enhancement System programmatically.

---

**Related Documentation:**
- [ARCHITECTURE.md](./ARCHITECTURE.md) - System architecture overview
- [CONFIGURATION.md](./CONFIGURATION.md) - Configuration reference
- [TEMPLATES.md](./TEMPLATES.md) - Template system documentation
- [LEARNING_SYSTEM.md](./LEARNING_SYSTEM.md) - Learning system documentation