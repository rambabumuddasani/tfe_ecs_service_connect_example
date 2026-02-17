resource "aws_ecs_service" "product" {
  name                   = "product"
  cluster                = aws_ecs_cluster.this.id
  task_definition        = aws_ecs_task_definition.product.arn
  desired_count          = 1
  launch_type            = "FARGATE"
  enable_execute_command = true
  network_configuration {
    subnets         = aws_subnet.private[*].id
    security_groups = [aws_security_group.ecs.id]
  }

  service_connect_configuration {
    enabled   = true
    namespace = aws_service_discovery_private_dns_namespace.this.arn

    service {
      port_name      = "http"
      discovery_name = "product"

      client_alias {
        port     = 8080
        dns_name = "product"
      }
    }
  }
}


resource "aws_ecs_service" "experience" {
  name            = "experience"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.experience.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = aws_subnet.private[*].id
    security_groups = [aws_security_group.ecs.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.experience.arn
    container_name   = "experience" # MUST match task definition container name
    container_port   = 8080         # MUST match container port
  }


  service_connect_configuration {
    enabled   = true
    namespace = aws_service_discovery_private_dns_namespace.this.arn

    # service {
    #   port_name      = "http"
    #   discovery_name = "experience"

    #   client_alias {
    #     port     = 8080
    #     dns_name = "experience"
    #   }
    # }
  }

  depends_on = [aws_lb_listener.http]
}
