#####
# Standard versionned example
#####

module "logging_destination" {
  source = "../../"

  name = "tftestloggingdest${random_string.this.result}"
  acl  = "log-delivery-write"

  kms_key_create = false
  sse_config = [{
    sse_key = "S3"
  }]
  iam_policy_create           = true
  iam_policy_read_name        = "tftestloggingdestread${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tftestloggingdestfull${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  tags = {
    testTag = "tftest"
    module  = "standard"
  }
}

module "logging" {
  source = "../../"

  name = "tftestlogging${random_string.this.result}"

  iam_policy_create           = true
  iam_policy_read_name        = "tftestloggingread${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tftestloggingfull${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  logging = [{
    target_bucket = module.logging_destination.id
    target_prefix = "tftest"
  }]

  tags = {
    testTag = "tftest"
    module  = "standard"
  }
}
