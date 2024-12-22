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

output "file_content" {
    value = local_file.1.content
}

output "file_name" {
    value = local_file.1.filename
}
