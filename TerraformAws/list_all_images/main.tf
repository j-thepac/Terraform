terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}


provider "aws" {
  region = "us-east-1"
}
# fetches metadata Eg: data.aws_ami.ubuntu
data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu-eks-pro/k8s_1.33/images/hvm-ssd-gp3/ubuntu-noble-24.04*"]
  }
}

output "result" {
  value = reverse(sort(data.aws_ami_ids.ubuntu.ids))
}


output "result2" {
  value = [
    for id in data.aws_ami_ids.ubuntu.ids :
    id
  ]
}