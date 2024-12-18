terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

variable "key" {
  type      = string
  sensitive = true
}
provider "github" {
  token = var.key
  owner = "j-thepac"
}

resource "github_repository" "example" {
  name        = "my-new-repo"
  description = "This is my new GitHub repository created using Terraform"
  visibility  = "public"
}