# S3 bucket with transition exemples

Create S3 bucket with object lock enabled, transitions, KMS key, and the policies. Also insert a bucket policy.

## Usage

To run this example, you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access\_key | Credentials: AWS access key. | string | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | string | n/a | yes |

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
| lock\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| lock\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| lock\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| lock\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| lock\_iam\_policy\_full\_arn | ARN of the full right policy |
| lock\_iam\_policy\_full\_description | The description of the full right policy |
| lock\_iam\_policy\_full\_id | ID of the full right policy |
| lock\_iam\_policy\_full\_name | The name of the full right policy |
| lock\_iam\_policy\_full\_policy\_document | The policy document |
| lock\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| lock\_iam\_policy\_read\_only\_description | The description of the read only policy |
| lock\_iam\_policy\_read\_only\_id | ID of the read only policy |
| lock\_iam\_policy\_read\_only\_name | The name of the read only policy |
| lock\_iam\_policy\_read\_only\_policy\_document | The policy document |
| lock\_id | The name of the bucket. |
| lock\_kms\_alias\_arns | The Amazon Resource Name (ARN) of the key alias |
| lock\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| lock\_kms\_key\_arns | The Amazon Resource Name (ARN) of the key |
| lock\_kms\_key\_ids | Globally unique identifier for the key |
| lock\_region | The AWS region this bucket resides in. |
| region | The AWS region this bucket resides in. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
