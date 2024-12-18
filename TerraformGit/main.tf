# terraform fmt -check
# terraform init
# terraform plan -no-color
# terraform apply -no-color -auto-approve


terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

variable "token" {
  type      = string
  sensitive = true
}
provider "github" {
  token = var.token
  owner = "j-thepac"
}

locals {
  repos = {
    c1 = { desc = "description1" },
    c2 = { desc = "description2" }
  }
}
resource "github_repository" "example" {
  for_each = local.repos

  name        = each.key
  description = each.value.desc
  visibility  = "public"
}