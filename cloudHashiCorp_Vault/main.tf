/*

- Start Dockerplayground
- docker run -p 8200:8200 -e 'VAULT_DEV_ROOT_TOKEN_ID=dev-only-token' hashicorp/vault
- cli- vault read cubbyhole/test
*/


variable "HASHICORPTOKEN" {
  type      = string
  sensitive = true
}

provider "vault" {
  address = "http://ip172-18-0-34-ctt2j48l2o9000dpetqg-8200.direct.labs.play-with-docker.com/"
  skip_tls_verify = true
  token = var.HASHICORPTOKEN
}

data "vault_generic_secret" "my_secret" {
  path = "cubbyhole/test"
}