#####
# S3 bucket
#####

output "logging_id" {
  description = "The name of the bucket."
  value       = module.logging.id
}

output "logging_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.logging.arn
}

output "logging_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.logging.bucket_domain_name
}

output "logging_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = module.logging.bucket_regional_domain_name
}

output "logging_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.logging.hosted_zone_id
}

output "logging_region" {
  description = "The AWS region this bucket resides in."
  value       = module.logging.region
}

output "logging_destination_id" {
  description = "The name of the bucket."
  value       = module.logging_destination.id
}

output "logging_destination_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.logging_destination.arn
}

output "logging_destination_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.logging_destination.bucket_domain_name
}

output "logging_destination_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = module.logging_destination.bucket_regional_domain_name
}

output "logging_destination_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.logging_destination.hosted_zone_id
}

output "logging_destination_region" {
  description = "The AWS region this bucket resides in."
  value       = module.logging_destination.region
}

#####
# KMS key
#####

output "logging_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.logging.kms_key_arn
}

output "logging_kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = module.logging.kms_key_id
}

output "logging_kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.logging.kms_alias_arn
}

output "logging_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = module.logging.kms_alias_target_key_arn
}

output "logging_destination_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.logging_destination.kms_key_arn
}

output "logging_destination_kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = module.logging_destination.kms_key_id
}

output "logging_destination_kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.logging_destination.kms_alias_arn
}

output "logging_destination_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = module.logging_destination.kms_alias_target_key_arn
}

#####
# IAM policy
#####

output "logging_iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = module.logging.iam_policy_read_only_id
}

output "logging_iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = module.logging.iam_policy_read_only_arn
}

output "logging_iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = module.logging.iam_policy_read_only_description
}

output "logging_iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = module.logging.iam_policy_read_only_name
}

output "logging_iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = module.logging.iam_policy_full_policy_document
}

output "logging_iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = module.logging.iam_policy_full_id
}

output "logging_iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = module.logging.iam_policy_full_arn
}

output "logging_iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = module.logging.iam_policy_full_description
}

output "logging_iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = module.logging.iam_policy_full_name
}

output "logging_iam_policy_full_policy_document" {
  description = "The policy document"
  value       = module.logging.iam_policy_full_policy_document
}

output "logging_destination_iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = module.logging_destination.iam_policy_read_only_id
}

output "logging_destination_iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = module.logging_destination.iam_policy_read_only_arn
}

output "logging_destination_iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = module.logging_destination.iam_policy_read_only_description
}

output "logging_destination_iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = module.logging_destination.iam_policy_read_only_name
}

output "logging_destination_iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = module.logging_destination.iam_policy_full_policy_document
}

output "logging_destination_iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = module.logging_destination.iam_policy_full_id
}

output "logging_destination_iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = module.logging_destination.iam_policy_full_arn
}

output "logging_destination_iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = module.logging_destination.iam_policy_full_description
}

output "logging_destination_iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = module.logging_destination.iam_policy_full_name
}

output "logging_destination_iam_policy_full_policy_document" {
  description = "The policy document"
  value       = module.logging_destination.iam_policy_full_policy_document
}
