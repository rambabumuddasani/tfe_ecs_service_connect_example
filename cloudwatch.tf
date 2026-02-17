resource "aws_cloudwatch_log_group" "experience" {
  name              = "/ecs/experience"
  retention_in_days = 1
}

resource "aws_cloudwatch_log_group" "product" {
  name              = "/ecs/product"
  retention_in_days = 1
}
