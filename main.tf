#####
# S3 bucket
#####

resource "aws_s3_bucket" "this" {
  count = var.enabled ? 1 : 0

  bucket        = var.name
  acl           = var.acl
  force_destroy = var.force_destroy
  region        = var.region
  request_payer = var.request_payer

  dynamic "server_side_encryption_configuration" {
    for_each = var.sse_config

    content {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = server_side_encryption_configuration.value.sse_key == "S3" ? "AES256" : "aws:kms"
          kms_master_key_id = server_side_encryption_configuration.value.sse_key == "S3" ? "" : server_side_encryption_configuration.value.sse_key
        }
      }
    }
  }

  dynamic "versioning" {
    for_each = var.versioning_config

    content {
      enabled    = lookup(versioning.value, "enabled", false)
      mfa_delete = lookup(versioning.value, "mfa_delete", false)
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules

    content {
      id      = lifecycle_rule.value.id
      prefix  = lifecycle_rule.value.prefix
      tags    = lifecycle_rule.value.tags
      enabled = lifecycle_rule.value.enabled

      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days

      dynamic "expiration" {
        for_each = lifecycle_rule.value.expiration_config

        content {
          days                         = expiration.value.days
          expired_object_delete_marker = expiration.value.expired_object_delete_marker
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lifecycle_rule.value.noncurrent_version_expiration_config

        content {
          days = noncurrent_version_expiration.value.days
        }
      }

      dynamic "transition" {
        for_each = lifecycle_rule.value.transitions_config

        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lifecycle_rule.value.noncurrent_version_transitions_config

        content {
          days          = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }
    }
  }

  dynamic "website" {
    for_each = var.static_website_config

    content {
      index_document           = lookup(website.value, "index_document", null)
      error_document           = lookup(website.value, "error_document", null)
      redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
      routing_rules            = lookup(website.value, "routing_rules", null)
    }
  }

  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }

  dynamic "logging" {
    for_each = var.logging

    content {
      target_bucket = logging.value.target_bucket
      target_prefix = logging.value.target_prefix
    }
  }

  dynamic "object_lock_configuration" {
    for_each = var.object_lock_configuration

    content {
      object_lock_enabled = object_lock_configuration.value.object_lock_enabled

      dynamic "rule" {
        for_each = object_lock_configuration.value.rule_config

        content {
          default_retention {
            mode  = rule.value.mode
            days  = lookup(rule.value, "days", null)
            years = lookup(rule.value, "years", null)
          }
        }
      }
    }
  }

  tags = merge(
    {
      "Terraform" = "true",
      "Name"      = var.name
    },
    var.bucket_tags,
    var.tags,
  )
}

resource "aws_s3_bucket_policy" "this" {
  count = var.enabled && var.apply_bucket_policy ? 1 : 0

  bucket = element(concat(aws_s3_bucket.this.*.id, [""]), 0)
  policy = var.bucket_policy_json
}

resource "aws_s3_bucket_public_access_block" "this" {
  count = var.enabled ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  depends_on = [aws_s3_bucket.this, aws_s3_bucket_policy.this]
}

#####
# KMS key
#####

resource "aws_kms_key" "this" {
  count = var.enabled && var.kms_key_create ? 1 : 0

  description = "KMS Key for ${var.name} S3 encryption."
  policy      = var.kms_key_policy_json

  tags = merge(
    {
      "Terraform" = "true",
      "Name"      = var.kms_key_name
    },
    var.tags,
    var.kms_tags,
  )
}

resource "aws_kms_alias" "this" {
  count = var.enabled && var.kms_key_create ? 1 : 0

  name          = "alias/${var.kms_key_alias_name}"
  target_key_id = element(concat(aws_kms_key.this.*.key_id, [""]), 0)
}

#####
# IAM policy
#####

data "aws_iam_policy_document" "this_read_no_kms" {
  count = var.enabled && var.iam_policy_create && var.kms_key_arn == "" && ! var.kms_key_create ? 1 : 0

  statement {
    sid = "1"

    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
    ]

    resources = [
      element(concat(aws_s3_bucket.this.*.arn, [""]), 0),
      "${element(concat(aws_s3_bucket.this.*.arn, [""]), 0)}/*",
    ]
  }

  statement {
    sid = "2"

    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "this_read" {
  count = var.enabled && var.iam_policy_create && (var.kms_key_create || var.kms_key_arn != "") ? 1 : 0

  statement {
    sid = "1"

    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
    ]

    resources = [
      element(concat(aws_s3_bucket.this.*.arn, [""]), 0),
      "${element(concat(aws_s3_bucket.this.*.arn, [""]), 0)}/*",
    ]
  }

  statement {
    sid = "2"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
    ]

    resources = [
      var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, [""]), 0) : var.kms_key_arn,
    ]
  }

  statement {
    sid = "3"

    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = ["*"]
  }

  statement {
    sid = "4"

    effect = "Allow"

    actions = [
      "kms:ListAliases",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "this_full_no_kms" {
  count = var.enabled && var.iam_policy_create && var.kms_key_arn == "" && ! var.kms_key_create ? 1 : 0

  statement {
    sid = "1"

    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      element(concat(aws_s3_bucket.this.*.arn, [""]), 0),
      "${element(concat(aws_s3_bucket.this.*.arn, [""]), 0)}/*",
    ]
  }

  statement {
    sid = "2"

    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "this_full" {
  count = var.enabled && var.iam_policy_create && (var.kms_key_create || var.kms_key_arn != "") ? 1 : 0

  statement {
    sid = "1"

    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      element(concat(aws_s3_bucket.this.*.arn, [""]), 0),
      "${element(concat(aws_s3_bucket.this.*.arn, [""]), 0)}/*",
    ]
  }

  statement {
    sid = "2"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:GenerateDataKey",
    ]

    resources = [
      var.kms_key_create ? element(concat(aws_kms_key.this.*.arn, [""]), 0) : var.kms_key_arn,
    ]
  }

  statement {
    sid = "3"

    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = ["*"]
  }

  statement {
    sid = "4"

    effect = "Allow"

    actions = [
      "kms:ListAliases",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "this_read" {
  count = var.enabled && var.iam_policy_create ? 1 : 0

  name   = var.iam_policy_read_name
  path   = var.iam_policy_path
  policy = var.kms_key_create || var.kms_key_arn != "" ? data.aws_iam_policy_document.this_read[0].json : data.aws_iam_policy_document.this_read_no_kms[0].json

  description = var.iam_policy_read_description
}

resource "aws_iam_policy" "this_full" {
  count = var.enabled && var.iam_policy_create ? 1 : 0

  name   = var.iam_policy_full_name
  path   = var.iam_policy_path
  policy = var.kms_key_create || var.kms_key_arn != "" ? data.aws_iam_policy_document.this_full[0].json : data.aws_iam_policy_document.this_full_no_kms[0].json

  description = var.iam_policy_full_description
}
