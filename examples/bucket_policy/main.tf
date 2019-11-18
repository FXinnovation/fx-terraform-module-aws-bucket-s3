provider "aws" {
  version    = "~> 2"
  region     = "eu-west-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "random_string" "this" {
  length  = 8
  upper   = false
  special = false
}

module "standard" {
  source = "../../"

  name               = "tftest${random_string.this.result}"
  bucket_policy_json = "${data.aws_iam_policy_document.s3.json}"

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
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "s3.amazonaws.com",
      ]
    }
  }

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::744480654312:root",
      ]
    }
  }
}
