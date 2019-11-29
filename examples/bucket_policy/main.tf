provider "aws" {
  version    = "~> 2"
  region     = "eu-west-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"

  assume_role {
    role_arn     = "arn:aws:iam::700633540182:role/OrganizationAccountAccessRole"
    session_name = "FXTestSandbox"
  }
}

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

module "policy" {
  source = "../../"

  name                = "tftest${random_string.this.result}"
  apply_bucket_policy = "true"
  bucket_policy_json  = "${data.aws_iam_policy_document.s3.json}"

  kms_key_create              = true
  kms_key_name                = "tftestS3KmsKey${random_string.this.result}"
  kms_key_alias_name          = "tftestS3KeySsm${random_string.this.result}"
  iam_policy_create           = true
  iam_policy_read_name        = "tftestPolicyReadS3${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tftestPolicyFullS3${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  tags {
    testTag = "tftest"
  }
}

data "aws_iam_policy_document" "s3" {
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
      "${module.policy.arn}",
    ]
  }
}
