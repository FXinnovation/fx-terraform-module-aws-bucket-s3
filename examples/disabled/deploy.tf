#####
# Randoms
#####

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}


#####
# Disabled example
#####

module "disable" {
  source = "../../"

  enabled = "false"
  name    = ""
}
