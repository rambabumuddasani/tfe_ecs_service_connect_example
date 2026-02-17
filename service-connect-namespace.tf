resource "aws_service_discovery_private_dns_namespace" "this" {
  name = "internal"
  vpc  = aws_vpc.this.id

  description = "Service Connect namespace"
}
