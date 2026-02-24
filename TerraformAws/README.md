# Terraform 

## Azure vs Amazon
- EC2 instance = Azure Virtual Machine
- Azure:  Storage Account > Blob Container> Blobs (files)
- Amazon: S3 > Bucket >  Objects (files)

## Uses
- infrastructure on multiple cloud platforms.
- The human-readable configuration language 
- Terraform's state allows you to track resource changes
- You can commit your configurations to version control 
- Declarative language( define end state,system figures out the steps to reach it.)


## properties
- Once applied User can directly make changes to main.tf and apply again
-   extension .tf
- Access other state file using 
```data "dt"{
    config ={ path= ".../terraform.tfstate"}
}
```
    
## Command
```
    init
    fmt
    validate
    apply   
    terraform show  # Terraform state file in a human-readable form.
    terraform state # Manipulate state File
    terraform destroy
    terraform graph
    ls | grep -v "main.tf" | xargs rm -rf
```  
## terraform.tfstate
- Created after terraform apply
- Secure File
- Stores IDs and properties of resources to update or destroy 



## Install
```
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
```

## Create user

- USer Groups > Create Group > Add permission
- IAM > Create new USer 
    - Groups Tab add to above Group 
    - Security cred tab > create access key
- copy ID and New Acces key
- 
- Edit ~/.bashrc
    export AWS_ACCESS_KEY_ID="id"
    export AWS_SECRET_ACCESS_KEY="key"
## Verify
```
aws configure list
aws sts get-caller-identity
```