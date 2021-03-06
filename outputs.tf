#####
# S3 bucket
#####

output "id" {
  description = "The name of the bucket."
  value       = element(concat(aws_s3_bucket.this.*.id, [""]), 0)
}

output "arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = element(concat(aws_s3_bucket.this.*.arn, [""]), 0)
}

output "bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = element(concat(aws_s3_bucket.this.*.bucket_domain_name, [""]), 0)
}

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = element(concat(aws_s3_bucket.this.*.bucket_regional_domain_name, [""]), 0)
}

output "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = element(concat(aws_s3_bucket.this.*.hosted_zone_id, [""]), 0)
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = element(concat(aws_s3_bucket.this.*.region, [""]), 0)
}


#####
# KMS key
#####

output "kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = element(concat(aws_kms_key.this.*.arn, [""]), 0)
}

output "kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = element(concat(aws_kms_key.this.*.key_id, [""]), 0)
}

output "kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = element(concat(aws_kms_alias.this.*.arn, [""]), 0)
}

output "kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = element(concat(aws_kms_alias.this.*.target_key_arn, [""]), 0)
}


#####
# IAM policy
#####

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = element(concat(aws_iam_policy.this_read.*.id, [""]), 0)
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = element(concat(aws_iam_policy.this_read.*.arn, [""]), 0)
}

output "iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = element(concat(aws_iam_policy.this_read.*.description, [""]), 0)
}

output "iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = element(concat(aws_iam_policy.this_read.*.name, [""]), 0)
}

output "iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = element(concat(aws_iam_policy.this_read.*.policy, [""]), 0)
}

output "iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = element(concat(aws_iam_policy.this_full.*.id, [""]), 0)
}

output "iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = element(concat(aws_iam_policy.this_full.*.arn, [""]), 0)
}

output "iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = element(concat(aws_iam_policy.this_full.*.description, [""]), 0)
}

output "iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = element(concat(aws_iam_policy.this_full.*.name, [""]), 0)
}

output "iam_policy_full_policy_document" {
  description = "The policy document"
  value       = element(concat(aws_iam_policy.this_full.*.policy, [""]), 0)
}
