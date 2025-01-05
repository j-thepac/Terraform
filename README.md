# Terraform

[Terraform Basics](https://gist.github.com/j-thepac/e837155bee50e3bcce04a64876ba35ac)

Note : 
- In terraform if Resource code block is commented or removed from the script , the current resource will be deleetd or removed .
- Use TerraformTest to practise code
- Change existing main.tf > main.tf.bak and create new main.tf

You can run each of the terraform scripts either locally (CLI)  or using GithubActions

## ways to pass data to terrafrom
1. setting System env value from Git(TF_VAR_name) and accessing in Terraform (varibale name{}_)

        ```
        #gitfile.yml
        env:
        TF_VAR_TOKEN: ${{ secrets.token }}
        ```

        ```
        #main.tf
        variable "TOKEN" {
        type      = string
        sensitive = true
        }
        provider "xx" {
        token = var.TOKEN
        }
        ```
2. Passing arguements to terraform plan using switch

        ```
        terraform plan -no-color -var "id=${{ secrets.id }}"
        ```
3. TF_VARS file

        ```
        #git.yml
        terraform apply -var-file="terraform.tfvars"
        ```
        ```
        // terraform.tfvars
        hcp_client_id     = "your_client_id"
        ```

### Running Locally 
Pre-Req:
    For running locally, make sure u have installed :
- Docker
- Terraform

Locally:
- Cd to the folder 
- Run below commands 
    ```
     terraform fmt -check
     terraform init
     terraform plan -no-color 
     terraform apply -no-color -auto-approve
    ```

To Run using Github Actions:
- open current repo in Github Online
- Goto Actions
- Run relativen Actions 



