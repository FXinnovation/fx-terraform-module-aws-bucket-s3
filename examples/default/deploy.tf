#####
# Providers
#####

provider "aws" {
  version    = "~> 2"
  region     = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key

  assume_role {
    role_arn     = "arn:aws:iam::700633540182:role/OrganizationAccountAccessRole"
    session_name = "FXTestSandbox"
  }
}

#####
# Randoms
#####

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}
