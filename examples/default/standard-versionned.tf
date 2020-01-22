#####
# Standard versionned example
#####

module "standard" {
  source = "../../"

  name = "tfteststandard${random_string.this.result}"

  kms_key_create              = true
  kms_key_name                = "tfteststandard${random_string.this.result}"
  kms_key_alias_name          = "tfteststandard${random_string.this.result}"
  iam_policy_create           = true
  iam_policy_read_name        = "tfteststandardread${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tfteststandardfull${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  versioning_config = [{
    enabled    = true
    mfa_delete = false
  }]

  tags = {
    testTag = "tftest"
    module  = "standard"
  }
}
