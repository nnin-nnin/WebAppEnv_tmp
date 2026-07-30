#!/usr/bin/env python3

import unittest

from codex_environment_runner import TokenUsage, UsageCollector, render_prompt


class TokenUsageTests(unittest.TestCase):
    def test_turn_completed_usage_is_recorded(self):
        collector = UsageCollector()
        collector.consume(
            {
                "type": "turn.completed",
                "usage": {
                    "input_tokens": 100,
                    "input_tokens_details": {"cached_tokens": 25},
                    "output_tokens": 40,
                    "output_tokens_details": {"reasoning_tokens": 10},
                    "total_tokens": 140,
                },
            }
        )

        usage, source = collector.final_usage()
        self.assertEqual(source, "turn.completed")
        self.assertEqual(usage.as_dict(), {
            "input_tokens": 100,
            "cached_input_tokens": 25,
            "output_tokens": 40,
            "reasoning_output_tokens": 10,
            "total_tokens": 140,
        })

    def test_legacy_token_count_uses_latest_total(self):
        collector = UsageCollector()
        collector.consume(
            {
                "type": "event_msg",
                "payload": {
                    "type": "token_count",
                    "info": {
                        "total_token_usage": {
                            "input_tokens": 200,
                            "output_tokens": 50,
                            "total_tokens": 250,
                        }
                    },
                },
            }
        )

        usage, source = collector.final_usage()
        self.assertEqual(source, "event_msg.token_count.total_token_usage")
        self.assertEqual(usage.total_tokens, 250)


class PromptTests(unittest.TestCase):
    def test_prompt_placeholders_are_replaced(self):
        rendered = render_prompt(
            "[APPLICATION] [VERSION] [ADMIN_USERNAME] [ADMIN_PASSWORD]",
            {
                "application": "Example",
                "version": "1.0",
                "source_repository": "repo",
                "commit": "abc",
                "image_name": "example",
                "host_port": "18080",
                "admin_username": "admin",
                "admin_password": "secret",
            },
        )
        self.assertEqual(rendered, "Example 1.0 admin secret")


if __name__ == "__main__":
    unittest.main()
