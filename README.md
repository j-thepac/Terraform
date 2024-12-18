
You can run each of the terraform scripts either locally or using GithubActions

Pre-Req:
    For running locally, make sure u have installed :
    1. Docker
    2. Terraform

Locally:
    1. Cd to the folder 
    2.Run below commands 
    ```
     terraform fmt -check
     terraform init
     terraform plan -no-color
     terraform apply -no-color -auto-approve
    ```

To Run using Github Actions:
    1. open current repo in Github Online
    2. Goto Actions
    3. Run relativen Actions 

Note : In terraform if Resource code block is commented or removed from the script , the current resource will be deleetd or removed .

