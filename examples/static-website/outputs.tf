#####
# S3 bucket
#####

output "static_website_id" {
  description = "The name of the bucket."
  value       = module.static_website.id
}

output "static_website_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.static_website.arn
}

output "static_website_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.static_website.bucket_domain_name
}

output "static_website_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = module.static_website.bucket_regional_domain_name
}

output "static_website_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = module.static_website.hosted_zone_id
}

output "static_website_region" {
  description = "The AWS region this bucket resides in."
  value       = module.static_website.region
}

#####
# KMS key
#####

output "static_website_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.static_website.kms_key_arn
}

output "static_website_kms_key_id" {
  description = "Globally unique identifier for the key"
  value       = module.static_website.kms_key_id
}

output "static_website_kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.static_website.kms_alias_arn
}

output "static_website_kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = module.static_website.kms_alias_target_key_arn
}

#####
# IAM policy
#####

output "static_website_iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = module.static_website.iam_policy_read_only_id
}

output "static_website_iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = module.static_website.iam_policy_read_only_arn
}

output "static_website_iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = module.static_website.iam_policy_read_only_description
}

output "static_website_iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = module.static_website.iam_policy_read_only_name
}

output "static_website_iam_policy_read_only_policy_document" {
  description = "The policy document"
  value       = module.static_website.iam_policy_full_policy_document
}

output "static_website_iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = module.static_website.iam_policy_full_id
}

output "static_website_iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = module.static_website.iam_policy_full_arn
}

output "static_website_iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = module.static_website.iam_policy_full_description
}

output "static_website_iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = module.static_website.iam_policy_full_name
}

output "static_website_iam_policy_full_policy_document" {
  description = "The policy document"
  value       = module.static_website.iam_policy_full_policy_document
}
