#####
# External KMS and no policies example
#####

module "external_kms_no_policies" {
  source = "../../"

  name = "tftestextkms${random_string.this.result}"

  kms_key_create    = false
  kms_key_arn       = aws_kms_key.this.arn
  iam_policy_create = false

  tags = {
    testTag = "tftest"
  }
}

resource "aws_kms_key" "this" {
  tags = merge(
    {
      "Name" = "tftestextkms${random_string.this.result}"
    },
  )
}

resource "aws_kms_alias" "this" {
  name          = "alias/tftestextkms${random_string.this.result}"
  target_key_id = aws_kms_key.this.key_id
}
