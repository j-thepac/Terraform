/*

- Start Dockerplayground
- docker run -p 8200:8200 -e 'VAULT_DEV_ROOT_TOKEN_ID=dev-only-token' hashicorp/vault
(Save above in sh file and run sh file.sh)
- Open port and login with "dev-only-token"
- address:  Vault > Tools > APi Explorer
- token : dev-only-token

*/

provider "vault" {
  address = "http://ip172-18-0-31-ctt4rmqim2rg00aoo240-8200.direct.labs.play-with-docker.com/"
  skip_tls_verify = true
  token = "dev-only-token"
}

data "vault_generic_secret" "my_secret" {
  path = "secret/test"  
}

output "key" {
  value = data.vault_generic_secret.my_secret
  sensitive = true
}
