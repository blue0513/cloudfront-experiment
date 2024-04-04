terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

output "web_acl" {
  value = aws_wafv2_web_acl.web_acl.arn
}

resource "aws_wafv2_web_acl" "web_acl" {
  name  = "rate-based-rule"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name     = "rule"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        # Limit on requests per 5-minute period for a single originating IP address
        limit              = 100 # min: 100
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "dummy"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "dummy"
    sampled_requests_enabled   = false
  }
}
