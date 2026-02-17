resource "aws_ecs_cluster" "this" {
  name = "${var.project}-cluster"

  service_connect_defaults {
    namespace = aws_service_discovery_private_dns_namespace.this.arn
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
