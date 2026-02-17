variable "region" {
  default = "us-east-1"
}

variable "project" {
  default = "ecs-service-connect-demo"
}

variable "experience_image" {
  description = "ECR image URI for experience service"
  default     = "639713291731.dkr.ecr.us-east-1.amazonaws.com/experience:latest"
}

variable "product_image" {
  description = "ECR image URI for product service"
  default     = "639713291731.dkr.ecr.us-east-1.amazonaws.com/product:latest"
}
