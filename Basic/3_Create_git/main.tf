/*1.Import and Setup : Copy from Terraform Website */
provider "github" {
  token = var.terraform_git_token
}

/*2.Env variable  */
variable "terraform_git_token" {}
#$export TF_VAR_terraform_git_token="create token from git"


/*3.Config :  Copy from Terraform Website */
resource "github_repository" "my_git_resrc" {
  name        = var.git_repo_name
  description = local.git_description
  visibility = "public"
}

/*4.Input from CLI  */
variable "git_repo_name"{
}

/*5. local*/
locals{
git_description ="terraform_git_description"
}


# terraform init
# terraform validate
# terraform plan
# terraform apply
# terraform destroy