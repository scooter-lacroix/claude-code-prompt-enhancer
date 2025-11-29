#!/usr/bin/env python3
"""
Integration Manager for Optimized Prompt Enhancement System

Connects the optimized core with:
- Learning system analytics
- Plugin system
- Historical pattern tracking
- Performance monitoring
"""

import json
import logging
from pathlib import Path
from typing import Dict, Any, Optional
import datetime

logger = logging.getLogger(__name__)

class IntegrationManager:
    """Manages integration between optimized core and learning components"""

    def __init__(self):
        self.claude_dir = Path.home() / ".claude"
        self.learning_dir = self.claude_dir / "prompt-enhancer-learning"
        self.config_dir = self.claude_dir / "hooks" / "config"

    def load_patterns(self) -> Dict[str, Any]:
        """Load learning patterns from the learning system"""
        patterns_file = self.learning_dir / "patterns.json"
        try:
            with open(patterns_file, 'r') as f:
                return json.load(f)
        except Exception as e:
            logger.warning(f"Could not load patterns: {e}")
            return {}

    def load_success_metrics(self) -> Dict[str, Any]:
        """Load success metrics from the learning system"""
        metrics_file = self.learning_dir / "success_metrics.json"
        try:
            with open(metrics_file, 'r') as f:
                return json.load(f)
        except Exception as e:
            logger.warning(f"Could not load success metrics: {e}")
            return {}

    def get_config(self) -> Dict[str, Any]:
        """Load optimized configuration"""
        config_file = self.config_dir / "default_config.json"
        try:
            with open(config_file, 'r') as f:
                return json.load(f)
        except Exception as e:
            logger.error(f"Could not load config: {e}")
            return {}

    def enhance_with_learning(self, base_enhancement: str, prompt: str) -> str:
        """Enhance the base enhancement with learning insights"""
        patterns = self.load_patterns()
        metrics = self.load_success_metrics()

        # Add pattern-based insights
        if patterns:
            pattern_insights = self._analyze_patterns(patterns, prompt)
            if pattern_insights:
                base_enhancement += "\n\n🧠 LEARNING INSIGHTS:\n" + pattern_insights

        # Add success metrics
        if metrics:
            success_guidance = self._get_success_guidance(metrics)
            if success_guidance:
                base_enhancement += "\n\n📊 SUCCESS PATTERNS:\n" + success_guidance

        return base_enhancement

    def _analyze_patterns(self, patterns: Dict[str, Any], prompt: str) -> str:
        """Analyze prompt against known patterns"""
        insights = []
        prompt_lower = prompt.lower()

        for pattern_id, pattern_data in patterns.items():
            if pattern_data.get("pattern_regex"):
                import re
                try:
                    if re.search(pattern_data["pattern_regex"], prompt_lower, re.IGNORECASE):
                        confidence = pattern_data.get("confidence_threshold", 0.7)
                        success_rate = pattern_data.get("success_rate", 0.0)
                        insights.append(
                            f"• Pattern detected: {pattern_id} "
                            f"(confidence: {confidence:.1%}, success_rate: {success_rate:.1%})"
                        )
                except re.error:
                    continue

        return "\n".join(insights) if insights else ""

    def _get_success_guidance(self, metrics: Dict[str, Any]) -> str:
        """Extract guidance from success metrics"""
        guidance = []

        # Example metrics processing
        if "task_types" in metrics:
            for task_type, data in metrics["task_types"].items():
                if data.get("success_rate", 0) > 0.8:
                    guidance.append(f"• {task_type} tasks show high success rates with current approach")

        return "\n".join(guidance) if guidance else ""

    def record_interaction(self, prompt: str, enhancement: str,
                          user_feedback: Optional[str] = None):
        """Record interaction for learning"""
        try:
            interaction_data = {
                "timestamp": datetime.datetime.now().isoformat(),
                "prompt_length": len(prompt),
                "enhancement_length": len(enhancement),
                "user_feedback": user_feedback
            }

            # Store in learning system
            analytics_dir = self.learning_dir / "analytics"
            analytics_dir.mkdir(exist_ok=True)

            # Simple rolling log
            log_file = analytics_dir / "interactions.log"
            with open(log_file, 'a') as f:
                f.write(json.dumps(interaction_data) + "\n")

        except Exception as e:
            logger.warning(f"Could not record interaction: {e}")

# Global instance for easy access
integration_manager = IntegrationManager()