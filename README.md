# Terraform

[Terraform Basics](https://gist.github.com/j-thepac/e837155bee50e3bcce04a64876ba35ac)

You can run each of the terraform scripts either locally (CLI)  or using GithubActions

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

Note : 
- In terraform if Resource code block is commented or removed from the script , the current resource will be deleetd or removed .

- Use TerraformTest to practise code

