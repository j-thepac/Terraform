#write file 
resource "local_file" "hello" {
    content  = "hello world"
    filename = "./1.txt"
}

#Print
output "file_content" {
    value = "file Contents  = ${local_file.hello.content} "
}


# terraform init
# terraform validate
# terraform plan
# terraform apply
# terraform destroy