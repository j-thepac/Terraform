// Pin the version
terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.101.0"
    }
  }
}


variable "TOKEN" {
  type      = string
  sensitive = true
}

variable "ID" {
  type      = string
  sensitive = true
}
provider "hcp" {
  client_id     = var.ID
  client_secret = var.TOKEN
}


data "hcp_vault_secrets_secret" "example" {
  app_name    = "sample-app"
  secret_name = "my_secret"
}

output "my_secret_value" {
  value     = data.hcp_vault_secrets_secret.example.secret_value
  sensitive = true
}