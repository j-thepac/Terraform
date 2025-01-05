- Start Dockerplayground

- docker run -p 8200:8200 -e 'VAULT_DEV_ROOT_TOKEN_ID=dev-only-token' hashicorp/vault
(Save above in sh file and run sh file.sh)

- Open port and login with "dev-only-token"

Modify the Terraform file 
    - address:  Vault > Tools > APi Explorer > Run any GET request and copy the Endpoint
    - token : dev-only-token