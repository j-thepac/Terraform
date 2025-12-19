
# $export TF_VAR_terraform_git_token='123'
output "my_output" {value = var.terraform_git_token}
variable terraform_git_token{}