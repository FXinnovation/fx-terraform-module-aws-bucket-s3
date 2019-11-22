#####
# S3 bucket
#####
output "id" {
  description = "The name of the bucket."
  value       = "${element(concat(compact(concat(aws_s3_bucket.this.*.id, aws_s3_bucket.this_object_lock.*.id)), list("")), 0)}"
}

output "arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = "${element(concat(compact(concat(aws_s3_bucket.this.*.arn, aws_s3_bucket.this_object_lock.*.arn)), list("")), 0)}"
}

output "bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = "${element(concat(compact(concat(aws_s3_bucket.this.*.bucket_domain_name, aws_s3_bucket.this_object_lock.*.bucket_domain_name)), list("")), 0)}"
}

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value       = "${element(concat(compact(concat(aws_s3_bucket.this.*.bucket_regional_domain_name, aws_s3_bucket.this_object_lock.*.bucket_regional_domain_name)), list("")), 0)}"
}

output "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = "${element(concat(compact(concat(aws_s3_bucket.this.*.hosted_zone_id, aws_s3_bucket.this_object_lock.*.hosted_zone_id)), list("")), 0)}"
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = "${element(concat(compact(concat(aws_s3_bucket.this.*.region, aws_s3_bucket.this_object_lock.*.region)), list("")), 0)}"
}

#####
# KMS key
#####

output "kms_key_arns" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = "${element(concat(aws_kms_key.this.*.arn, list("")), 0)}"
}

output "kms_key_ids" {
  description = "Globally unique identifier for the key"
  value       = "${element(concat(aws_kms_key.this.*.key_id, list("")), 0)}"
}

output "kms_alias_arns" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = "${element(concat(aws_kms_alias.this.*.arn, list("")), 0)}"
}

output "kms_alias_target_key_arn" {
  description = "The Amazon Resource Name (ARN) of the target key identifier"
  value       = "${element(concat(aws_kms_alias.this.*.target_key_arn, list("")), 0)}"
}

#####
# IAM policy
#####

output "iam_policy_read_only_id" {
  description = "ID of the read only policy"
  value       = "${element(concat(aws_iam_policy.this_read.*.id, list("")), 0)}"
}

output "iam_policy_read_only_arn" {
  description = "ARN of the read only policy"
  value       = "${element(concat(aws_iam_policy.this_read.*.arn, list("")), 0)}"
}

output "iam_policy_read_only_description" {
  description = "The description of the read only policy"
  value       = "${element(concat(aws_iam_policy.this_read.*.description, list("")), 0)}"
}

output "iam_policy_read_only_name" {
  description = "The name of the read only policy"
  value       = "${element(concat(aws_iam_policy.this_read.*.name,  list("")), 0)}"
}

output "iam_policy_full_id" {
  description = "ID of the full right policy"
  value       = "${element(concat(aws_iam_policy.this_full.*.id, list("")), 0)}"
}

output "iam_policy_full_arn" {
  description = "ARN of the full right policy"
  value       = "${element(concat(aws_iam_policy.this_full.*.arn, list("")), 0)}"
}

output "iam_policy_full_description" {
  description = "The description of the full right policy"
  value       = "${element(concat(aws_iam_policy.this_full.*.description, list("")), 0)}"
}

output "iam_policy_full_name" {
  description = "The name of the full right policy"
  value       = "${element(concat(aws_iam_policy.this_full.*.name,  list("")), 0)}"
}
