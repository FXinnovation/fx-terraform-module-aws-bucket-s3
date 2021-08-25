data "aws_caller_identity" "current" {}

#####
# Randoms
#####

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}


#####
# IAM Policy for the S3 Bucket
#####

data "aws_iam_policy_document" "policy_no_rotation" {
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
      module.policy_no_kms_rotation.arn,
    ]
  }
}


#####
# IAM Policy for the KMS key
#####

data "aws_iam_policy_document" "kms" {
  statement {
    sid = "1"

    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        data.aws_caller_identity.current.arn,
      ]
    }

    actions = [
      "kms:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "2"

    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::203977111394:root",
      ]
    }

    actions = [
      "kms:Decrypt",
    ]

    resources = [
      "*",
    ]
  }
}


#####
# S3 with KMS and no rotation example
#####

module "policy_no_kms_rotation" {
  source = "../../"

  name                = "tftestbpnr${random_string.this.result}"
  apply_bucket_policy = "true"
  bucket_policy_json  = data.aws_iam_policy_document.policy_no_rotation.json

  kms_key_create              = true
  kms_key_name                = "tftestbpnr${random_string.this.result}"
  kms_key_alias_name          = "tftestbpnr${random_string.this.result}"
  kms_key_rotation_enabled    = false
  apply_kms_policy            = "true"
  kms_key_policy_json         = data.aws_iam_policy_document.kms.json
  iam_policy_create           = true
  iam_policy_read_name        = "tftestbpreadnr${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tftestbpfullnr${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  tags = {
    testTag = "tftest"
  }
}
