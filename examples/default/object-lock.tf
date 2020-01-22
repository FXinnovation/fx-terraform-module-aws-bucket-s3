#####
# Object lock with policy example
#####

data "aws_iam_policy_document" "olwp" {
  statement {
    sid = "1"

    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::744480654312:root",
      ]
    }

    actions = [
      "s3:*",
    ]
    resources = [
      module.object_lock_with_policy.arn,
    ]
  }
}

module "object_lock_with_policy" {
  source = "../../"

  name                = "tftestolwp${random_string.this.result}"
  apply_bucket_policy = "true"
  bucket_policy_json  = data.aws_iam_policy_document.olwp.json

  object_lock_configuration = [{
    object_lock_enabled = "Enabled",
    rule_config = [{
      mode  = "COMPLIANCE",
      days  = 1,
      years = null
    }]
  }]

  lifecycle_rules = [{
    id                                     = "basic"
    enabled                                = true
    prefix                                 = ""
    tags                                   = {}
    abort_incomplete_multipart_upload_days = 0
    expiration_config = [
      {
        days                         = 1
        expired_object_delete_marker = false
      }
    ]
    noncurrent_version_expiration_config  = []
    transitions_config                    = []
    noncurrent_version_transitions_config = []
  }]

  kms_key_create              = true
  kms_key_name                = "tftestolwp${random_string.this.result}"
  kms_key_alias_name          = "tftestolwp${random_string.this.result}"
  iam_policy_create           = true
  iam_policy_read_name        = "tftestolwpread${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tftesolwpfull${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  tags = {
    testTag = "tftest"
  }
}
