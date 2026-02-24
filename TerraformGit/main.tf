# # terraform fmt -check
# # terraform init
# # terraform plan -no-color
# # terraform apply -no-color -auto-approve


terraform {
  required_providers {
    github={source= "integrations/github",version = "~>5.0"}
  }
}
provider "github"{ token = var.git_token}
variable "git_token"{}  #export TF_VAR_git_token="token"
locals{
d={"repo1"="my_desc1","repo2"="my_desc2"}
}
resource "github_repository" "my_git" {
 for_each = local.d
  name        = each.key
  description = each.value
  visibility = "public"
}

