// Pin the version
terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.101.0"
    }
  }
}


variable "HCP_CLIENT_SECRET" {
  type      = string
  sensitive = true
}

variable "HCP_CLIENT_ID" {
  type      = string
  sensitive = true
}
provider "hcp" {
  client_id     = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
}


data "hcp_vault_secrets_secret" "example" {
  app_name    = "sample-app"
  secret_name = "my_secret"
}

output "my_secret_value" {
  value     = data.hcp_vault_secrets_secret.example.secret_value
  sensitive = true
}