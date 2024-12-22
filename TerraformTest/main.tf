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

# Using the local_file data source to read the file
data "local_file" "example" {
    filename = "1.txt"
}

output "file_content" {
    value = data.local_file.example.content
}
