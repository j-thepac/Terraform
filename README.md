# Terraform

## Overview

1. Create multiple resources
2. Infrastructure as Code (IaC)
3. Sandbox: [https://developer.hashicorp.com/terraform/sandbox](https://developer.hashicorp.com/terraform/sandbox)
4. Terraform loads all `.tf` files in the same folder together

---

## HCL Syntax

### Comments

```hcl
/* multi-line comment */
# single-line comment
```

### Block Structure : 
```hcl
my_block {
  key1 = "value"      # string
  key2 = 3            # integer
  key3 = true         # boolean
  key4 = [1, 2, 3]    # list
  key5 = { k = "v" } # map
}
```
- Everything is a block
- Main Blocks are provider, resource , variable , output , locals 
  - Provider :
    - Download Libarary
    - Copy from Terraform Doc
    - Eg: provider "git_hub"{}
    - Can be in main.tf / providers.tf 
  - Resource
    - Config Library
    - Copy from Terraform Doc
    - should be in main.tf 
  - variable
    - Input values from user
    - variables.tf` or `main.tf`
    - Eg: variable "a"{default = 1}
    - Access by "var.a"
  - output
    -  print putput
    -  outputs.tf` or `main.tf`
    -  Eg: output "my_output" {value = var.a}
  - locals
    -  Interal Values 
    -  locals.tf` or `main.tf`
    -  eg locals{k="v"}
    -  Access by local.k
  - Others
    -   module {} : Functions
    -   terraform {} : Terraform Backend Settings 

---

## Variables, Locals, Outputs

### Variable

* Input from user
* Access using `var.name`
* Interpolation: `${var.name}`

```hcl
variable "a" {
  default = 1
}
```

* Pass via CLI :
```hcl
variable "a" {
  
} /* blank*/
```
```bash
terraform plan -var="a=1"
```

* Using tfvars file (`prod.tfvars`):

```hcl
a = 1
```

```bash
terraform plan -var-file="prod.tfvars"
```

* Using environment variable:

```bash
export TF_VAR_a=1
```

### Locals

* For internal usage

```hcl
locals {
  name    = "Deepak"
  message = "HI ${local.name}"
}
```

### Output

* Display values after apply

```hcl
output "my_output" {
  value = resource_name.attribute
}
```

---

## Condition (Using count)

```hcl
resource "local_file" "pet" {
  count    = fileexists("./pets.txt") ? 0 : 1
  filename = "./pets.txt"
  content  = "HI"
}
```

---

## Functions

* Built-in functions:

  * Numeric
  * String
  * List / Collection
  * DateTime
  * File
  * Conversion

---

## Resource Dependency

```hcl
resource "aws_instance" "a1" {
  key = "val"
}

resource "aws_instance" "a2" {
  key = aws_instance.a1.key
}
```
---
## 1. Example: Print Env 


```hcl
# $export TF_VAR_test_var="123"
#main.tf 
output { value =var.test_var}
variable test_var{}


# terraform init
# terraform validate
# terraform plan
# terraform apply
# terraform destroy

```

---

## 2. Example: Create Sample File
```hcl
# Create file main.tf and add below

resource "local_file" "pet" {
  filename = "./pets.txt"
  content  = "HI"
}
```

Commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy -target=local_file.pet
```
---
## 3. Example: Create GitHub Repository Single File 


```hcl

# create main.tf

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
```

