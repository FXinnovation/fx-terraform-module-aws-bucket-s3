data "aws_caller_identity" "current" {}

#####
# With kms and bucket policy
#####

data "aws_iam_policy_document" "policy" {
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
      module.policy.arn,
    ]
  }
}

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
