#####
# S3 bucket
#####

output "olwp_id" {
  description = "The name of the bucket."
  value       = module.object_lock_with_policy.id
}

output "olwp_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.object_lock_with_policy.arn
}

output "olwp_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.object_lock_with_policy.bucket_domain_name
}

output "olwp_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = module.object_lock_with_policy.bucket_regional_domain_name
}

output "olwp_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.object_lock_with_policy.hosted_zone_id
}

output "olwp_region" {
  description = "The AWS region this bucket resides in."
  value       = module.object_lock_with_policy.region
}

#####
# KMS key
#####

output "olwp_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.object_lock_with_policy.kms_key_arn
}

output "olwp_kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = module.object_lock_with_policy.kms_key_id
}

output "olwp_kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.object_lock_with_policy.kms_alias_arn
}

output "olwp_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = module.object_lock_with_policy.kms_alias_target_key_arn
}

#####
# IAM policy
#####

output "olwp_iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = module.object_lock_with_policy.iam_policy_read_only_id
}

output "olwp_iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = module.object_lock_with_policy.iam_policy_read_only_arn
}

output "olwp_iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = module.object_lock_with_policy.iam_policy_read_only_description
}

output "olwp_iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = module.object_lock_with_policy.iam_policy_read_only_name
}

output "olwp_iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = module.object_lock_with_policy.iam_policy_read_only_policy_document
}

output "olwp_iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = module.object_lock_with_policy.iam_policy_full_id
}

output "olwp_iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = module.object_lock_with_policy.iam_policy_full_arn
}

output "olwp_iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = module.object_lock_with_policy.iam_policy_full_description
}

output "olwp_iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = module.object_lock_with_policy.iam_policy_full_name
}

output "olwp_iam_policy_full_policy_document" {
  description = "The policy document"
  value       = module.object_lock_with_policy.iam_policy_full_policy_document
}
