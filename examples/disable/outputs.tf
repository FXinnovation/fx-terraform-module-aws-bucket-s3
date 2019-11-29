#####
# S3 bucket
#####

output "id" {
  description = "The name of the bucket."
  value       = "${module.disable.id}"
}

output "arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = "${module.disable.arn}"
}

output "bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = "${module.disable.bucket_domain_name}"
}

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = "${module.disable.bucket_regional_domain_name}"
}

output "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = "${module.disable.hosted_zone_id}"
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = "${module.disable.region}"
}

#####
# KMS key
#####

output "kms_key_arns" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = "${module.disable.kms_key_arns}"
}

output "kms_key_ids" {
  description = "Globally unique identifier for the key"
  value       = "${module.disable.kms_key_ids}"
}

output "kms_alias_arns" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = "${module.disable.kms_alias_arns}"
}

output "kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = "${module.disable.kms_alias_target_key_arn}"
}

#####
# IAM policy
#####

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = "${module.disable.iam_policy_read_only_id}"
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = "${module.disable.iam_policy_read_only_arn}"
}

output "iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = "${module.disable.iam_policy_read_only_description}"
}

output "iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = "${module.disable.iam_policy_read_only_name}"
}

output "iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = "${module.disable.iam_policy_read_only_policy_document}"
}

output "iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = "${module.disable.iam_policy_full_id}"
}

output "iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = "${module.disable.iam_policy_full_arn}"
}

output "iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = "${module.disable.iam_policy_full_description}"
}

output "iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = "${module.disable.iam_policy_full_name}"
}

output "iam_policy_full_policy_document" {
  description = "The policy document"
  value       = "${module.disable.iam_policy_full_policy_document}"
}
