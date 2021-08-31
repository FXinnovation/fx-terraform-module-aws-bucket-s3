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
  description = "Name of the bucket to create."
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply."
  default     = "private"
}

variable "force_destroy" {
  description = "When set to true, will delete the bucket even if it is not empty."
  default     = false
}

variable "bucket_tags" {
  description = "Map of tags that will be added on the bucket object."
  default     = {}
}

variable "request_payer" {
  description = "Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester"
  default     = "BucketOwner"
}

variable "apply_bucket_policy" {
  description = "Apply the policy 'bucket_policy_json' to the bucket"
  default     = "false"
}

variable "bucket_policy_json" {
  description = "A valid bucket policy JSON document if 'apply_bucket_policy' is enable."
  default     = ""
}

variable "sse_config" {
  description = "Configures server side encryption for the bucket. The sse_key should either be set to S3 or a KMS Key ID. It is highly recommended to use server side encryption for good security practice."
  type = list(object({
    sse_key = string
  }))
  default = []
}

variable "versioning_config" {
  description = "Configure versioning on bucket object.  Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket"
  type        = list(map(string))
  default     = []
}

variable "static_website_config" {
  description = "A data structure that configures the bucket to host a static website"
  type        = list(map(string))
  default     = []
}

variable "cors_rules" {
  description = "A data structure that configures CORS rules"
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = []
}

variable "lifecycle_rules" {
  description = "A data structure to create lifcycle rules"
  type = list(object({
    id                                     = string
    prefix                                 = string
    tags                                   = map(string)
    enabled                                = bool
    abort_incomplete_multipart_upload_days = number
    expiration_config = list(object({
      days                         = number
      expired_object_delete_marker = bool
    }))
    noncurrent_version_expiration_config = list(object({
      days = number
    }))
    transitions_config = list(object({
      days          = number
      storage_class = string
    }))
    noncurrent_version_transitions_config = list(object({
      days          = number
      storage_class = string
    }))
  }))
  default = []
}

variable "logging" {
  description = "Configure logging on bucket object. It is highly recommended to use logging for good security practice."
  type = list(object({
    target_bucket = string
    target_prefix = string
  }))
  default = []
}

variable "object_lock_configuration" {
  description = "Configure an object lock configuration on the bucket object."
  type = list(object({
    object_lock_enabled = string
    rule_config = list(object({
      mode  = string
      days  = number
      years = number
    }))
  }))
  default = []
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = false
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

variable "kms_key_rotation_enabled" {
  description = "Choose whether key rotation is enabled. It is highly recommended to keep this value to true, for good security practice."
  type        = bool
  default     = true
}

variable "kms_tags" {
  description = "Tags that will be merged with variable tags for the kms key"
  default     = {}
}

variable "kms_key_alias_name" {
  description = "Alias of the kms key if toggle kms_key_create is set"
  default     = ""
}

variable "apply_kms_policy" {
  description = "Apply the policy `kms_key_policy_json` to the kms key. Valid only if toggle kms_key_create is set."
  default     = "false"
}

variable "kms_key_policy_json" {
  description = "A valid policy JSON document."
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
