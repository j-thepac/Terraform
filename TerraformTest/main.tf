#Hi
terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
        }
    }
}

resource "local_file" "hello" {
    content  = "hello world"
    filename = "1.txt"
}


# Read the contents of the existing file
locals {
    file_content = file("1.txt")
}

# Output the contents of the file
output "read_file_content" {
    value = local.file_content
}
