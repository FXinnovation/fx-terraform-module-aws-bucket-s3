# terraform-module-aws-s3-bucket

Generic module create a S3 bucket, kms encrypted, with 2 base policies that allow read only and full right access.

Work *only* with terraform 0.11.x

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 2, < 4 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2, < 4 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acl | The canned ACL to apply. | `string` | `"private"` | no |
| apply\_bucket\_policy | Apply the policy 'bucket\_policy\_json' to the bucket | `string` | `"false"` | no |
| apply\_kms\_policy | Apply the policy `kms_key_policy_json` to the kms key. Valid only if toggle kms\_key\_create is set. | `string` | `"false"` | no |
| block\_public\_acls | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `false` | no |
| block\_public\_policy | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `false` | no |
| bucket\_policy\_json | A valid bucket policy JSON document if 'apply\_bucket\_policy' is enable. | `string` | `""` | no |
| bucket\_tags | Map of tags that will be added on the bucket object. | `map` | `{}` | no |
| cors\_rules | A data structure that configures CORS rules | <pre>list(object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    expose_headers  = list(string)<br>    max_age_seconds = number<br>  }))</pre> | `[]` | no |
| enabled | Enable this module | `bool` | `true` | no |
| force\_destroy | When set to true, will delete the bucket even if it is not empty. | `bool` | `false` | no |
| iam\_policy\_create | Create read only and read write policy to get an access to S3 bucket. | `bool` | `false` | no |
| iam\_policy\_full\_description | Description of the IAM full policy. | `string` | `""` | no |
| iam\_policy\_full\_name | Name of the IAM read write access to S3 bucket. | `string` | `""` | no |
| iam\_policy\_path | Path in which to create the policies. | `string` | `"/"` | no |
| iam\_policy\_read\_description | Description of the IAM read policy. | `string` | `""` | no |
| iam\_policy\_read\_name | Name of the IAM read only access to S3 bucket. | `string` | `""` | no |
| ignore\_public\_acls | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `false` | no |
| kms\_key\_alias\_name | Alias of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| kms\_key\_arn | ARN of the kms key if toggle kms\_key\_create is disable. | `string` | `""` | no |
| kms\_key\_create | Create a kms key for secure string parameters. | `bool` | `false` | no |
| kms\_key\_name | Name of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| kms\_key\_policy\_json | A valid policy JSON document. | `string` | `""` | no |
| kms\_tags | Tags that will be merged with variable tags for the kms key | `map` | `{}` | no |
| lifecycle\_rules | A data structure to create lifcycle rules | <pre>list(object({<br>    id                                     = string<br>    prefix                                 = string<br>    tags                                   = map(string)<br>    enabled                                = bool<br>    abort_incomplete_multipart_upload_days = number<br>    expiration_config = list(object({<br>      days                         = number<br>      expired_object_delete_marker = bool<br>    }))<br>    noncurrent_version_expiration_config = list(object({<br>      days = number<br>    }))<br>    transitions_config = list(object({<br>      days          = number<br>      storage_class = string<br>    }))<br>    noncurrent_version_transitions_config = list(object({<br>      days          = number<br>      storage_class = string<br>    }))<br>  }))</pre> | `[]` | no |
| logging | Configure logging on bucket object. | <pre>list(object({<br>    target_bucket = string<br>    target_prefix = string<br>  }))</pre> | `[]` | no |
| name | Name of the bucket to create. | `string` | n/a | yes |
| object\_lock\_configuration | Configure an object lock configuration on the bucket object. | <pre>list(object({<br>    object_lock_enabled = string<br>    rule_config = list(object({<br>      mode  = string<br>      days  = number<br>      years = number<br>    }))<br><br>  }))</pre> | `[]` | no |
| region | If specified, the AWS region this bucket should reside in. Otherwise, the region used by the caller. | `string` | `null` | no |
| request\_payer | Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester | `string` | `"BucketOwner"` | no |
| restrict\_public\_buckets | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `false` | no |
| sse\_config | Configures server side encryption for the bucket.  The sse\_key should either be set to S3 or a KMS Key ID | <pre>list(object({<br>    sse_key = string<br>  }))</pre> | `[]` | no |
| static\_website\_config | A data structure that configures the bucket to host a static website | `list(map(string))` | `[]` | no |
| tags | Global tags for resources | `map` | `{}` | no |
| versioning\_config | Configure versioning on bucket object.  Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| iam\_policy\_full\_arn | ARN of the full right policy |
| iam\_policy\_full\_description | The description of the full right policy |
| iam\_policy\_full\_id | ID of the full right policy |
| iam\_policy\_full\_name | The name of the full right policy |
| iam\_policy\_full\_policy\_document | The policy document |
| iam\_policy\_read\_only\_arn | ARN of the read only policy |
| iam\_policy\_read\_only\_description | The description of the read only policy |
| iam\_policy\_read\_only\_id | ID of the read only policy |
| iam\_policy\_read\_only\_name | The name of the read only policy |
| iam\_policy\_read\_only\_policy\_document | The policy document |
| id | The name of the bucket. |
| kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| kms\_key\_id | Globally unique identifier for the key |
| region | The AWS region this bucket resides in. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
