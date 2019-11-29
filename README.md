# terraform-module-aws-s3-bucket

Generic module create a S3 bucket, kms encrypted, with 2 base policies that allow read only and full right access.

Work *only* with terraform 0.11.x

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| apply\_bucket\_policy | Apply the policy 'bucket_policy_json' to the bucket | string | `"false"` | no |
| bucket\_policy\_json | A valid bucket policy JSON document if 'apply_bucket_policy' is enable. | string | `""` | no |
| enabled | Enable this module | string | `"true"` | no |
| iam\_policy\_create | Create read only and read write policy to get an access to S3 bucket. | string | `"false"` | no |
| iam\_policy\_full\_description | Description of the IAM full policy. | string | `""` | no |
| iam\_policy\_full\_name | Name of the IAM read write access to S3 bucket. | string | `""` | no |
| iam\_policy\_path | Path in which to create the policies. | string | `"/"` | no |
| iam\_policy\_read\_description | Description of the IAM read policy. | string | `""` | no |
| iam\_policy\_read\_name | Name of the IAM read only access to S3 bucket. | string | `""` | no |
| kms\_key\_alias\_name | Alias of the kms key if toggle kms_key_create is set | string | `""` | no |
| kms\_key\_arn | ARN of the kms key if toggle kms_key_create is disable. | string | `""` | no |
| kms\_key\_create | Create a kms key for secure string parameters. | string | `"false"` | no |
| kms\_key\_name | Name of the kms key if toggle kms_key_create is set | string | `""` | no |
| kms\_tags | Tags that will be merged with variable tags for the kms key | map | `{}` | no |
| name | The name of the bucket. | string | n/a | yes |
| object\_lock\_enabled | Enable object lock on this bucket | string | `"false"` | no |
| object\_lock\_expiration\_days | Specifies the number of days after object creation when the specific rule action takes effect. | string | `"1"` | no |
| object\_lock\_mode | The default Object Lock retention mode you want to apply to new objects placed in this bucket. Valid values are 'GOVERNANCE' and 'COMPLIANCE' | string | `"COMPLIANCE"` | no |
| object\_lock\_noncurrent\_version\_expiration\_days | Specifies the number of days an object is noncurrent object versions expire. | string | `"1"` | no |
| object\_lock\_retention\_days | The number of days that you want to specify for the default retention period. | string | `"1"` | no |
| tags | Global tags for resources | map | `{}` | no |
| versioning | Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket. | string | `"false"` | no |

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
| kms\_alias\_arns | The Amazon Resource Name (ARN) of the key alias |
| kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| kms\_key\_arns | The Amazon Resource Name (ARN) of the key |
| kms\_key\_ids | Globally unique identifier for the key |
| region | The AWS region this bucket resides in. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
