provider "http" {
  # Configuration options can be added here if needed
}

# Get Result from http Resource Above 
data "http" "example" {
  url = "https://api.github.com/repos/hashicorp/terraform"
}

output "response_body" {
  value = data.http.example.response_body
}
