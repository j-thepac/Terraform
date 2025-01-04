// Pin the version
terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.101.0"
    }
  }
}

# Pa$$word123
// Configure the provider

variable "token" {
  type      = string
  sensitive = true
}

variable "id" {
  type      = string
  sensitive = true
}
provider "hcp" {
  client_id     = var.id
  client_secret = var.token
}


data "hcp_vault_secrets_secret" "example" {
  app_name    = "sample-app"
  secret_name = "my_secret"
}

output "my_secret_value" {
  value     = data.hcp_vault_secrets_secret.example.secret_value
  sensitive = true
}