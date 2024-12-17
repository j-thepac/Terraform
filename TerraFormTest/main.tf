/*
docker run -i -t hashicorp/terraform:latest plan

*/

# Terraform Interface for Docker
terraform {
  required_providers {
    docker = { source = "kreuzwerker/docker" }
  }
}

# Use Default Config for above docker
provider "docker" {}

# Download nginx Image
resource "docker_image" "nginx" {
  name = "nginx"
}

# Define a map of container configurations
locals {
  containers = {
    c1 = { external_port = 8001 },
    c2 = { external_port = 8002 }
  }
}

# Create Nginx containers using a map
resource "docker_container" "nginx" {
  for_each = local.containers

  image = docker_image.nginx.image_id
  name  = each.key  # Unique name for each container

  ports {
    internal = 80
    external = each.value.external_port  # Use the external port from the map
  }
}

# Outputs
output "container_names" {
  value = [for c in docker_container.nginx : c.name]
}
