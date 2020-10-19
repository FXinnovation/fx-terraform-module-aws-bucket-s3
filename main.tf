#####
# S3 bucket
#####

resource "aws_s3_bucket" "this" {
  count = "${var.enabled && !var.object_lock_enabled && !var.transition_enabled ? 1 : 0}"

  bucket        = "${var.name}"
  acl           = "private"
  force_destroy = "${var.force_destroy}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${var.kms_key_create ? element(concat(compact(concat(aws_kms_key.this.*.arn, aws_kms_key.this_policy.*.arn)), list("")), 0) : var.kms_key_arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = "${var.versioning}"
  }

  tags = "${merge(
    map("Terraform", "true"),
    map("Name", "${var.name}"),
    var.tags
  )}"
}

resource "aws_s3_bucket" "this_object_lock" {
  count = "${var.enabled && var.object_lock_enabled && !var.transition_enabled ? 1 : 0}"

  bucket        = "${var.name}"
  acl           = "private"
  force_destroy = "${var.force_destroy}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${var.kms_key_create ? element(concat(compact(concat(aws_kms_key.this.*.arn, aws_kms_key.this_policy.*.arn)), list("")), 0) : var.kms_key_arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = "true"
  }

  object_lock_configuration {
    object_lock_enabled = "Enabled"

    rule {
      default_retention {
        mode = "${var.object_lock_mode}"
        days = "${var.object_lock_retention_days}"
      }
    }
  }

  lifecycle_rule {
    enabled = true

    expiration {
      days = "${var.object_lock_expiration_days}"
    }

    noncurrent_version_expiration {
      days = "${var.object_lock_noncurrent_version_expiration_days}"
    }
  }

  tags = "${merge(
    map("Terraform", "true"),
    map("Name", "${var.name}"),
    var.tags
  )}"
}

resource "aws_s3_bucket" "this_transition_lock" {
  count = "${var.enabled && var.object_lock_enabled && var.transition_enabled ? 1 : 0}"

  bucket        = "${var.name}"
  acl           = "private"
  force_destroy = "${var.force_destroy}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${var.kms_key_create ? element(concat(compact(concat(aws_kms_key.this.*.arn, aws_kms_key.this_policy.*.arn)), list("")), 0) : var.kms_key_arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = "true"
  }

  object_lock_configuration {
    object_lock_enabled = "Enabled"

    rule {
      default_retention {
        mode = "${var.object_lock_mode}"
        days = "${var.object_lock_retention_days}"
      }
    }
  }

  lifecycle_rule {
    enabled = true

    transition {
      days          = "${var.transition_days}"
      storage_class = "${var.transition_storageclass}"
    }

    noncurrent_version_transition {
      days          = "${var.transition_noncurrent_version_days}"
      storage_class = "${var.transition_noncurrent_version_storageclass}"
    }

    expiration {
      days = "${var.object_lock_expiration_days}"
    }

    noncurrent_version_expiration {
      days = "${var.object_lock_noncurrent_version_expiration_days}"
    }
  }

  tags = "${merge(
    map("Terraform", "true"),
    map("Name", "${var.name}"),
    var.tags
  )}"
}

resource "aws_s3_bucket" "this_transition" {
  count = "${var.enabled && !var.object_lock_enabled && var.transition_enabled ? 1 : 0}"

  bucket        = "${var.name}"
  acl           = "private"
  force_destroy = "${var.force_destroy}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${var.kms_key_create ? element(concat(compact(concat(aws_kms_key.this.*.arn, aws_kms_key.this_policy.*.arn)), list("")), 0) : var.kms_key_arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = "true"
  }

  lifecycle_rule {
    enabled = true

    transition {
      days          = "${var.transition_days}"
      storage_class = "${var.transition_storageclass}"
    }

    noncurrent_version_transition {
      days          = "${var.transition_noncurrent_version_days}"
      storage_class = "${var.transition_noncurrent_version_storageclass}"
    }
  }

  tags = "${merge(
    map("Terraform", "true"),
    map("Name", "${var.name}"),
    var.tags
  )}"
}

resource "aws_s3_bucket_policy" "this" {
  count = "${var.enabled && var.apply_bucket_policy ? 1 : 0}"

  bucket = "${element(
    compact(concat(
      aws_s3_bucket.this_object_lock.*.id,
      aws_s3_bucket.this.*.id,
      aws_s3_bucket.this_transition.*.id,
      aws_s3_bucket.this_transition_lock.*.id,
      list(""),
    )),
    0
  )}"

  policy = "${var.bucket_policy_json}"
}

#####
# KMS key
#####

resource "aws_kms_key" "this" {
  count = "${var.enabled && var.kms_key_create && !var.apply_kms_policy ? 1 : 0}"

  description = "KMS Key for ${var.name} S3 encryption."

  tags = "${merge(
    map("Terraform", "true"),
    map("Name", var.kms_key_name),
    var.tags,
    var.kms_tags
  )}"
}

resource "aws_kms_key" "this_policy" {
  count = "${var.enabled && var.kms_key_create && var.apply_kms_policy ? 1 : 0}"

  policy      = "${var.kms_key_policy_json}"
  description = "KMS Key for ${var.name} S3 encryption."

  tags = "${merge(
    map("Terraform", "true"),
    map("Name", var.kms_key_name),
    var.tags,
    var.kms_tags
  )}"
}

resource "aws_kms_alias" "this" {
  count = "${var.enabled && var.kms_key_create ? 1 : 0}"

  name          = "alias/${var.kms_key_alias_name}"
  target_key_id = "${element(compact(concat(aws_kms_key.this.*.key_id, aws_kms_key.this_policy.*.key_id)), 0)}"
}

#####
# IAM policy
#####

data "aws_iam_policy_document" "this_read" {
  count = "${var.enabled && var.iam_policy_create ? 1 : 0}"

  statement {
    sid = "1"

    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:List*",
    ]

    resources = [
      "${element(
        compact(concat(
          aws_s3_bucket.this_object_lock.*.arn,
          aws_s3_bucket.this.*.arn,
          aws_s3_bucket.this_transition.*.arn,
          aws_s3_bucket.this_transition_lock.*.arn,
          list(""),
        )),
        0
      )}",
      "${element(
        compact(concat(
          aws_s3_bucket.this_object_lock.*.arn,
          aws_s3_bucket.this.*.arn,
          aws_s3_bucket.this_transition.*.arn,
          aws_s3_bucket.this_transition_lock.*.arn,
          list(""),
        )),
        0
      )}/*",
    ]
  }

  statement {
    sid = "2"

    effect = "Allow"

    actions = [
      "kms:Decrypt",
    ]

    resources = [
      "${var.kms_key_create ? element(concat(compact(concat(aws_kms_key.this.*.arn, aws_kms_key.this_policy.*.arn)), list("")), 0) : var.kms_key_arn}",
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

data "aws_iam_policy_document" "this_full" {
  count = "${var.enabled && var.iam_policy_create ? 1 : 0}"

  statement {
    sid = "1"

    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      "${element(
        compact(concat(
          aws_s3_bucket.this_object_lock.*.arn,
          aws_s3_bucket.this.*.arn,
          aws_s3_bucket.this_transition.*.arn,
          aws_s3_bucket.this_transition_lock.*.arn,
          list(""),
        )),
        0
      )}",
      "${element(
        compact(concat(
          aws_s3_bucket.this_object_lock.*.arn,
          aws_s3_bucket.this.*.arn,
          aws_s3_bucket.this_transition.*.arn,
          aws_s3_bucket.this_transition_lock.*.arn,
          list(""),
        )),
        0
      )}/*",
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
      "${var.kms_key_create ? element(concat(compact(concat(aws_kms_key.this.*.arn, aws_kms_key.this_policy.*.arn)), list("")), 0) : var.kms_key_arn}",
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
  count = "${var.enabled && var.iam_policy_create ? 1 : 0}"

  name   = "${var.iam_policy_read_name}"
  path   = "${var.iam_policy_path}"
  policy = "${data.aws_iam_policy_document.this_read.json}"

  description = "${var.iam_policy_read_description}"
}

resource "aws_iam_policy" "this_full" {
  count = "${var.enabled && var.iam_policy_create ? 1 : 0}"

  name   = "${var.iam_policy_full_name}"
  path   = "${var.iam_policy_path}"
  policy = "${data.aws_iam_policy_document.this_full.json}"

  description = "${var.iam_policy_full_description}"
}
