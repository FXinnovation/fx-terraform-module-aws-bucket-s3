#####
# Global variables
####

variable "enabled" {
  description = "Enable this module"
  default     = true
}

variable "tags" {
  description = "Global tags for resources"
  default     = {}
}

#####
# S3 bucket
#####

variable "name" {
  description = "The name of the bucket."
  type        = "string"
}

variable "apply_bucket_policy" {
  description = "Apply the policy 'bucket_policy_json' to the bucket"
  default     = "false"
}

variable "bucket_policy_json" {
  description = "A valid bucket policy JSON document if 'apply_bucket_policy' is enable."
  default     = ""
}

variable "versioning" {
  description = "Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket."
  default     = "false"
}

variable "object_lock_enabled" {
  description = "Enable object lock on this bucket"
  default     = "false"
}

variable "object_lock_mode" {
  description = "The default Object Lock retention mode you want to apply to new objects placed in this bucket. Valid values are 'GOVERNANCE' and 'COMPLIANCE'"
  default     = "COMPLIANCE"
}

variable "object_lock_retention_days" {
  description = "The number of days that you want to specify for the default retention period."
  default     = "1"
}

#####
# KMS key
#####

variable "kms_key_create" {
  description = "Create a kms key for secure string parameters."
  default     = false
}

variable "kms_key_arn" {
  description = "ARN of the kms key if toggle kms_key_create is disable."
  default     = ""
}

variable "kms_key_name" {
  description = "Name of the kms key if toggle kms_key_create is set"
  default     = ""
}

variable "kms_tags" {
  description = "Tags that will be merged with variable tags for the kms key"
  default     = {}
}

variable "kms_key_alias_name" {
  description = "Alias of the kms key if toggle kms_key_create is set"
  default     = ""
}

####
# IAM Policy
#####

variable "iam_policy_create" {
  description = "Create read only and read write policy to get an access to S3 bucket."
  default     = false
}

variable "iam_policy_read_name" {
  description = "Name of the IAM read only access to S3 bucket."
  default     = ""
}

variable "iam_policy_read_description" {
  description = "Description of the IAM read policy."
  default     = ""
}

variable "iam_policy_full_name" {
  description = "Name of the IAM read write access to S3 bucket."
  default     = ""
}

variable "iam_policy_full_description" {
  description = "Description of the IAM full policy."
  default     = ""
}

variable "iam_policy_path" {
  description = "Path in which to create the policies."
  default     = "/"
}
