#####
# S3 bucket
#####

output "disabled_id" {
  description = "The name of the bucket."
  value       = module.disable.id
}

output "disabled_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.disable.arn
}

output "disabled_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.disable.bucket_domain_name
}

output "disabled_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = module.disable.bucket_regional_domain_name
}

output "disabled_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.disable.hosted_zone_id
}

output "disabled_region" {
  description = "The AWS region this bucket resides in."
  value       = module.disable.region
}

#####
# KMS key
#####

output "disabled_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.disable.kms_key_arn
}

output "disabled_kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = module.disable.kms_key_id
}

output "disabled_kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.disable.kms_alias_arn
}

output "disabled_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = module.disable.kms_alias_target_key_arn
}

#####
# IAM policy
#####

output "disabled_iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = module.disable.iam_policy_read_only_id
}

output "disabled_iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = module.disable.iam_policy_read_only_arn
}

output "disabled_iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = module.disable.iam_policy_read_only_description
}

output "disabled_iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = module.disable.iam_policy_read_only_name
}

output "disabled_iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = module.disable.iam_policy_read_only_policy_document
}

output "disabled_iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = module.disable.iam_policy_full_id
}

output "disabled_iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = module.disable.iam_policy_full_arn
}

output "disabled_iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = module.disable.iam_policy_full_description
}

output "disabled_iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = module.disable.iam_policy_full_name
}

output "disabled_iam_policy_full_policy_document" {
  description = "The policy document"
  value       = module.disable.iam_policy_full_policy_document
}
