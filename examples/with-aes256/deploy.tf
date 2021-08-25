#####
# Randoms
#####

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}


#####
# External KMS and no policies example
#####

module "external_kms_no_policies_no_kms_rotation" {
  source = "../../"

  name = "tftestextkmsnr${random_string.this.result}"

  kms_key_create           = true
  kms_key_name             = "tftestextkmsnr${random_string.this.result}"
  kms_key_alias_name       = "tftestextkmsnr${random_string.this.result}"
  kms_key_rotation_enabled = false
  apply_kms_policy         = "false"
  iam_policy_create        = false

  tags = {
    testTag = "tftest"
  }
}
