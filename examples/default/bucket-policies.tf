module "policy" {
  source = "../../"

  name                = "tftestbp${random_string.this.result}"
  apply_bucket_policy = "true"
  bucket_policy_json  = data.aws_iam_policy_document.policy.json

  kms_key_create              = true
  kms_key_name                = "tftestbp${random_string.this.result}"
  kms_key_alias_name          = "tftestbp${random_string.this.result}"
  apply_kms_policy            = "true"
  kms_key_policy_json         = data.aws_iam_policy_document.kms.json
  iam_policy_create           = true
  iam_policy_read_name        = "tftestbpread${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tftestbpfull${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  tags = {
    testTag = "tftest"
  }
}
