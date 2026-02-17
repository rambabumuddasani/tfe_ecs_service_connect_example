output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "execution_role_name" {
  value = aws_iam_role.ecs_execution.name
}

output "execution_role_policy" {
  value = aws_iam_role_policy_attachment.ecs_execution_policy.policy_arn
}

output "experience_service_name" {
  value = aws_ecs_service.experience.name
}

output "product_service_name" {
  value = aws_ecs_service.product.name
}

output "service_connect_namespace" {
  value = "internal"
}

output "service_connect_product_endpoint" {
  value = "http://product:8080"
}
