#####
# S3 bucket
#####

output "standard_id" {
  description = "The name of the bucket."
  value       = module.standard.id
}

output "standard_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.standard.arn
}

output "standard_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.standard.bucket_domain_name
}

output "standard_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = module.standard.bucket_regional_domain_name
}

output "standard_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.standard.hosted_zone_id
}

output "standard_region" {
  description = "The AWS region this bucket resides in."
  value       = module.standard.region
}

#####
# KMS key
#####

output "standard_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.standard.kms_key_arn
}

output "standard_kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = module.standard.kms_key_id
}

output "standard_kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.standard.kms_alias_arn
}

output "standard_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = module.standard.kms_alias_target_key_arn
}

#####
# IAM policy
#####

output "standard_iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = module.standard.iam_policy_read_only_id
}

output "standard_iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = module.standard.iam_policy_read_only_arn
}

output "standard_iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = module.standard.iam_policy_read_only_description
}

output "standard_iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = module.standard.iam_policy_read_only_name
}

output "standard_iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = module.standard.iam_policy_full_policy_document
}

output "standard_iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = module.standard.iam_policy_full_id
}

output "standard_iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = module.standard.iam_policy_full_arn
}

output "standard_iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = module.standard.iam_policy_full_description
}

output "standard_iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = module.standard.iam_policy_full_name
}

output "standard_iam_policy_full_policy_document" {
  description = "The policy document"
  value       = module.standard.iam_policy_full_policy_document
}
