#####
# S3 bucket
#####

output "bp_id" {
  description = "The name of the bucket."
  value       = module.policy.id
}

output "bp_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.policy.arn
}

output "bp_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.policy.bucket_domain_name
}

output "bp_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = module.policy.bucket_regional_domain_name
}

output "bp_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.policy.hosted_zone_id
}

output "bp_region" {
  description = "The AWS region this bucket resides in."
  value       = module.policy.region
}


#####
# KMS key
#####

output "bp_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.policy.kms_key_arn
}

output "bp_kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = module.policy.kms_key_id
}

output "bp_kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.policy.kms_alias_arn
}

output "bp_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = module.policy.kms_alias_target_key_arn
}


#####
# IAM policy
#####

output "bp_iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = module.policy.iam_policy_read_only_id
}

output "bp_iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = module.policy.iam_policy_read_only_arn
}

output "bp_iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = module.policy.iam_policy_read_only_description
}

output "bp_iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = module.policy.iam_policy_read_only_name
}

output "bp_iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = module.policy.iam_policy_read_only_policy_document
}

output "bp_iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = module.policy.iam_policy_full_id
}

output "bp_iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = module.policy.iam_policy_full_arn
}

output "bp_iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = module.policy.iam_policy_full_description
}

output "bp_iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = module.policy.iam_policy_full_name
}

output "bp_iam_policy_full_policy_document" {
  description = "The policy document"
  value       = module.policy.iam_policy_full_policy_document
}
