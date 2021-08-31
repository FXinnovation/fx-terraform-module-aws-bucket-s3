# terraform-module-aws-s3-bucket

Generic module create a S3 bucket, kms encrypted, with 2 base policies that allow read only and full right access.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this_full](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.this_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.this_full](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this_full_kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this_read_kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply. | `string` | `"private"` | no |
| <a name="input_apply_bucket_policy"></a> [apply\_bucket\_policy](#input\_apply\_bucket\_policy) | Apply the policy 'bucket\_policy\_json' to the bucket | `string` | `"false"` | no |
| <a name="input_apply_kms_policy"></a> [apply\_kms\_policy](#input\_apply\_kms\_policy) | Apply the policy `kms_key_policy_json` to the kms key. Valid only if toggle kms\_key\_create is set. | `string` | `"false"` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `false` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `false` | no |
| <a name="input_bucket_policy_json"></a> [bucket\_policy\_json](#input\_bucket\_policy\_json) | A valid bucket policy JSON document if 'apply\_bucket\_policy' is enable. | `string` | `""` | no |
| <a name="input_bucket_tags"></a> [bucket\_tags](#input\_bucket\_tags) | Map of tags that will be added on the bucket object. | `map` | `{}` | no |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | A data structure that configures CORS rules | <pre>list(object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    expose_headers  = list(string)<br>    max_age_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable this module | `bool` | `true` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When set to true, will delete the bucket even if it is not empty. | `bool` | `false` | no |
| <a name="input_iam_policy_create"></a> [iam\_policy\_create](#input\_iam\_policy\_create) | Create read only and read write policy to get an access to S3 bucket. | `bool` | `false` | no |
| <a name="input_iam_policy_full_description"></a> [iam\_policy\_full\_description](#input\_iam\_policy\_full\_description) | Description of the IAM full policy. | `string` | `""` | no |
| <a name="input_iam_policy_full_name"></a> [iam\_policy\_full\_name](#input\_iam\_policy\_full\_name) | Name of the IAM read write access to S3 bucket. | `string` | `""` | no |
| <a name="input_iam_policy_path"></a> [iam\_policy\_path](#input\_iam\_policy\_path) | Path in which to create the policies. | `string` | `"/"` | no |
| <a name="input_iam_policy_read_description"></a> [iam\_policy\_read\_description](#input\_iam\_policy\_read\_description) | Description of the IAM read policy. | `string` | `""` | no |
| <a name="input_iam_policy_read_name"></a> [iam\_policy\_read\_name](#input\_iam\_policy\_read\_name) | Name of the IAM read only access to S3 bucket. | `string` | `""` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `false` | no |
| <a name="input_kms_key_alias_name"></a> [kms\_key\_alias\_name](#input\_kms\_key\_alias\_name) | Alias of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | ARN of the kms key if toggle kms\_key\_create is disable. | `string` | `""` | no |
| <a name="input_kms_key_create"></a> [kms\_key\_create](#input\_kms\_key\_create) | Create a kms key for secure string parameters. | `bool` | `false` | no |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name) | Name of the kms key if toggle kms\_key\_create is set | `string` | `""` | no |
| <a name="input_kms_key_policy_json"></a> [kms\_key\_policy\_json](#input\_kms\_key\_policy\_json) | A valid policy JSON document. | `string` | `""` | no |
| <a name="input_kms_key_rotation_enabled"></a> [kms\_key\_rotation\_enabled](#input\_kms\_key\_rotation\_enabled) | Choose whether key rotation is enabled. It is highly recommended to keep this value to true, for good security practice. | `bool` | `true` | no |
| <a name="input_kms_tags"></a> [kms\_tags](#input\_kms\_tags) | Tags that will be merged with variable tags for the kms key | `map` | `{}` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | A data structure to create lifcycle rules | <pre>list(object({<br>    id                                     = string<br>    prefix                                 = string<br>    tags                                   = map(string)<br>    enabled                                = bool<br>    abort_incomplete_multipart_upload_days = number<br>    expiration_config = list(object({<br>      days                         = number<br>      expired_object_delete_marker = bool<br>    }))<br>    noncurrent_version_expiration_config = list(object({<br>      days = number<br>    }))<br>    transitions_config = list(object({<br>      days          = number<br>      storage_class = string<br>    }))<br>    noncurrent_version_transitions_config = list(object({<br>      days          = number<br>      storage_class = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Configure logging on bucket object. It is highly recommended to use logging for good security practice. | <pre>list(object({<br>    target_bucket = string<br>    target_prefix = string<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the bucket to create. | `string` | n/a | yes |
| <a name="input_object_lock_configuration"></a> [object\_lock\_configuration](#input\_object\_lock\_configuration) | Configure an object lock configuration on the bucket object. | <pre>list(object({<br>    object_lock_enabled = string<br>    rule_config = list(object({<br>      mode  = string<br>      days  = number<br>      years = number<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_request_payer"></a> [request\_payer](#input\_request\_payer) | Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester | `string` | `"BucketOwner"` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `false` | no |
| <a name="input_sse_config"></a> [sse\_config](#input\_sse\_config) | Configures server side encryption for the bucket. The sse\_key should either be set to S3 or a KMS Key ID. It is highly recommended to use server side encryption for good security practice. | <pre>list(object({<br>    sse_key = string<br>  }))</pre> | `[]` | no |
| <a name="input_static_website_config"></a> [static\_website\_config](#input\_static\_website\_config) | A data structure that configures the bucket to host a static website | `list(map(string))` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Global tags for resources | `map` | `{}` | no |
| <a name="input_versioning_config"></a> [versioning\_config](#input\_versioning\_config) | Configure versioning on bucket object.  Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_iam_policy_full_arn"></a> [iam\_policy\_full\_arn](#output\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_iam_policy_full_description"></a> [iam\_policy\_full\_description](#output\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_iam_policy_full_id"></a> [iam\_policy\_full\_id](#output\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_iam_policy_full_name"></a> [iam\_policy\_full\_name](#output\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_iam_policy_full_policy_document"></a> [iam\_policy\_full\_policy\_document](#output\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_iam_policy_read_only_arn"></a> [iam\_policy\_read\_only\_arn](#output\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_iam_policy_read_only_description"></a> [iam\_policy\_read\_only\_description](#output\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_iam_policy_read_only_id"></a> [iam\_policy\_read\_only\_id](#output\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_iam_policy_read_only_name"></a> [iam\_policy\_read\_only\_name](#output\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_iam_policy_read_only_policy_document"></a> [iam\_policy\_read\_only\_policy\_document](#output\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_id"></a> [id](#output\_id) | The name of the bucket. |
| <a name="output_kms_alias_arn"></a> [kms\_alias\_arn](#output\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_kms_alias_target_key_arn"></a> [kms\_alias\_target\_key\_arn](#output\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_region"></a> [region](#output\_region) | The AWS region this bucket resides in. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
