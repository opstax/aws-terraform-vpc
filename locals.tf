locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = var.service_name
    Owner   = var.owner
  }
}
