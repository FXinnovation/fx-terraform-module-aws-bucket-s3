# S3 bucket example

**NOTE: This examples contains all of the different example use cases. This repository will serve as a test repository for a new pattern to lower ci build times.**

## Usage

To run this example, you need to execute:

```
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |
| random | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| disable | ../../ |  |
| external_kms_no_policies | ../../ |  |
| external_kms_no_policies_no_kms_rotation | ../../ |  |
| logging | ../../ |  |
| logging_destination | ../../ |  |
| object_lock_with_policy | ../../ |  |
| policy | ../../ |  |
| policy_no_kms_rotation | ../../ |  |
| standard | ../../ |  |
| static_website | ../../ |  |

## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_kms_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) |
| [aws_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_key | Credentials: AWS access key. | `string` | n/a | yes |
| secret\_key | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bp\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| bp\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| bp\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| bp\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| bp\_iam\_policy\_full\_arn | ARN of the full right policy |
| bp\_iam\_policy\_full\_description | The description of the full right policy |
| bp\_iam\_policy\_full\_id | ID of the full right policy |
| bp\_iam\_policy\_full\_name | The name of the full right policy |
| bp\_iam\_policy\_full\_policy\_document | The policy document |
| bp\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| bp\_iam\_policy\_read\_only\_description | The description of the read only policy |
| bp\_iam\_policy\_read\_only\_id | ID of the read only policy |
| bp\_iam\_policy\_read\_only\_name | The name of the read only policy |
| bp\_iam\_policy\_read\_only\_policy\_document | The policy document |
| bp\_id | The name of the bucket. |
| bp\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| bp\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| bp\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| bp\_kms\_key\_id | Globally unique identifier for the key |
| bp\_no\_rotation\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| bp\_no\_rotation\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| bp\_no\_rotation\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| bp\_no\_rotation\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| bp\_no\_rotation\_iam\_policy\_full\_arn | ARN of the full right policy |
| bp\_no\_rotation\_iam\_policy\_full\_description | The description of the full right policy |
| bp\_no\_rotation\_iam\_policy\_full\_id | ID of the full right policy |
| bp\_no\_rotation\_iam\_policy\_full\_name | The name of the full right policy |
| bp\_no\_rotation\_iam\_policy\_full\_policy\_document | The policy document |
| bp\_no\_rotation\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| bp\_no\_rotation\_iam\_policy\_read\_only\_description | The description of the read only policy |
| bp\_no\_rotation\_iam\_policy\_read\_only\_id | ID of the read only policy |
| bp\_no\_rotation\_iam\_policy\_read\_only\_name | The name of the read only policy |
| bp\_no\_rotation\_iam\_policy\_read\_only\_policy\_document | The policy document |
| bp\_no\_rotation\_id | The name of the bucket. |
| bp\_no\_rotation\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| bp\_no\_rotation\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| bp\_no\_rotation\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| bp\_no\_rotation\_kms\_key\_id | Globally unique identifier for the key |
| bp\_no\_rotation\_region | The AWS region this bucket resides in. |
| bp\_region | The AWS region this bucket resides in. |
| disabled\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| disabled\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| disabled\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| disabled\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| disabled\_iam\_policy\_full\_arn | ARN of the full right policy |
| disabled\_iam\_policy\_full\_description | The description of the full right policy |
| disabled\_iam\_policy\_full\_id | ID of the full right policy |
| disabled\_iam\_policy\_full\_name | The name of the full right policy |
| disabled\_iam\_policy\_full\_policy\_document | The policy document |
| disabled\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| disabled\_iam\_policy\_read\_only\_description | The description of the read only policy |
| disabled\_iam\_policy\_read\_only\_id | ID of the read only policy |
| disabled\_iam\_policy\_read\_only\_name | The name of the read only policy |
| disabled\_iam\_policy\_read\_only\_policy\_document | The policy document |
| disabled\_id | The name of the bucket. |
| disabled\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| disabled\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| disabled\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| disabled\_kms\_key\_id | Globally unique identifier for the key |
| disabled\_region | The AWS region this bucket resides in. |
| extkms\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| extkms\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| extkms\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| extkms\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| extkms\_iam\_policy\_full\_arn | ARN of the full right policy |
| extkms\_iam\_policy\_full\_description | The description of the full right policy |
| extkms\_iam\_policy\_full\_id | ID of the full right policy |
| extkms\_iam\_policy\_full\_name | The name of the full right policy |
| extkms\_iam\_policy\_full\_policy\_document | The policy document |
| extkms\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| extkms\_iam\_policy\_read\_only\_description | The description of the read only policy |
| extkms\_iam\_policy\_read\_only\_id | ID of the read only policy |
| extkms\_iam\_policy\_read\_only\_name | The name of the read only policy |
| extkms\_iam\_policy\_read\_only\_policy\_document | The policy document |
| extkms\_id | The name of the bucket. |
| extkms\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| extkms\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| extkms\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| extkms\_kms\_key\_id | Globally unique identifier for the key |
| extkms\_no\_rotation\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| extkms\_no\_rotation\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| extkms\_no\_rotation\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| extkms\_no\_rotation\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| extkms\_no\_rotation\_iam\_policy\_full\_arn | ARN of the full right policy |
| extkms\_no\_rotation\_iam\_policy\_full\_description | The description of the full right policy |
| extkms\_no\_rotation\_iam\_policy\_full\_id | ID of the full right policy |
| extkms\_no\_rotation\_iam\_policy\_full\_name | The name of the full right policy |
| extkms\_no\_rotation\_iam\_policy\_full\_policy\_document | The policy document |
| extkms\_no\_rotation\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| extkms\_no\_rotation\_iam\_policy\_read\_only\_description | The description of the read only policy |
| extkms\_no\_rotation\_iam\_policy\_read\_only\_id | ID of the read only policy |
| extkms\_no\_rotation\_iam\_policy\_read\_only\_name | The name of the read only policy |
| extkms\_no\_rotation\_iam\_policy\_read\_only\_policy\_document | The policy document |
| extkms\_no\_rotation\_id | The name of the bucket. |
| extkms\_no\_rotation\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| extkms\_no\_rotation\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| extkms\_no\_rotation\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| extkms\_no\_rotation\_kms\_key\_id | Globally unique identifier for the key |
| extkms\_no\_rotation\_region | The AWS region this bucket resides in. |
| extkms\_region | The AWS region this bucket resides in. |
| logging\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| logging\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| logging\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| logging\_destination\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| logging\_destination\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| logging\_destination\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| logging\_destination\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| logging\_destination\_iam\_policy\_full\_arn | ARN of the full right policy |
| logging\_destination\_iam\_policy\_full\_description | The description of the full right policy |
| logging\_destination\_iam\_policy\_full\_id | ID of the full right policy |
| logging\_destination\_iam\_policy\_full\_name | The name of the full right policy |
| logging\_destination\_iam\_policy\_full\_policy\_document | The policy document |
| logging\_destination\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| logging\_destination\_iam\_policy\_read\_only\_description | The description of the read only policy |
| logging\_destination\_iam\_policy\_read\_only\_id | ID of the read only policy |
| logging\_destination\_iam\_policy\_read\_only\_name | The name of the read only policy |
| logging\_destination\_iam\_policy\_read\_only\_policy\_document | The policy document |
| logging\_destination\_id | The name of the bucket. |
| logging\_destination\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| logging\_destination\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| logging\_destination\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| logging\_destination\_kms\_key\_id | Globally unique identifier for the key |
| logging\_destination\_region | The AWS region this bucket resides in. |
| logging\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| logging\_iam\_policy\_full\_arn | ARN of the full right policy |
| logging\_iam\_policy\_full\_description | The description of the full right policy |
| logging\_iam\_policy\_full\_id | ID of the full right policy |
| logging\_iam\_policy\_full\_name | The name of the full right policy |
| logging\_iam\_policy\_full\_policy\_document | The policy document |
| logging\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| logging\_iam\_policy\_read\_only\_description | The description of the read only policy |
| logging\_iam\_policy\_read\_only\_id | ID of the read only policy |
| logging\_iam\_policy\_read\_only\_name | The name of the read only policy |
| logging\_iam\_policy\_read\_only\_policy\_document | The policy document |
| logging\_id | The name of the bucket. |
| logging\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| logging\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| logging\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| logging\_kms\_key\_id | Globally unique identifier for the key |
| logging\_region | The AWS region this bucket resides in. |
| olwp\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| olwp\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| olwp\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| olwp\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| olwp\_iam\_policy\_full\_arn | ARN of the full right policy |
| olwp\_iam\_policy\_full\_description | The description of the full right policy |
| olwp\_iam\_policy\_full\_id | ID of the full right policy |
| olwp\_iam\_policy\_full\_name | The name of the full right policy |
| olwp\_iam\_policy\_full\_policy\_document | The policy document |
| olwp\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| olwp\_iam\_policy\_read\_only\_description | The description of the read only policy |
| olwp\_iam\_policy\_read\_only\_id | ID of the read only policy |
| olwp\_iam\_policy\_read\_only\_name | The name of the read only policy |
| olwp\_iam\_policy\_read\_only\_policy\_document | The policy document |
| olwp\_id | The name of the bucket. |
| olwp\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| olwp\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| olwp\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| olwp\_kms\_key\_id | Globally unique identifier for the key |
| olwp\_region | The AWS region this bucket resides in. |
| standard\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| standard\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| standard\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| standard\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| standard\_iam\_policy\_full\_arn | ARN of the full right policy |
| standard\_iam\_policy\_full\_description | The description of the full right policy |
| standard\_iam\_policy\_full\_id | ID of the full right policy |
| standard\_iam\_policy\_full\_name | The name of the full right policy |
| standard\_iam\_policy\_full\_policy\_document | The policy document |
| standard\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| standard\_iam\_policy\_read\_only\_description | The description of the read only policy |
| standard\_iam\_policy\_read\_only\_id | ID of the read only policy |
| standard\_iam\_policy\_read\_only\_name | The name of the read only policy |
| standard\_iam\_policy\_read\_only\_policy\_document | The policy document |
| standard\_id | The name of the bucket. |
| standard\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| standard\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| standard\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| standard\_kms\_key\_id | Globally unique identifier for the key |
| standard\_region | The AWS region this bucket resides in. |
| static\_website\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| static\_website\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| static\_website\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name. |
| static\_website\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| static\_website\_iam\_policy\_full\_arn | ARN of the full right policy |
| static\_website\_iam\_policy\_full\_description | The description of the full right policy |
| static\_website\_iam\_policy\_full\_id | ID of the full right policy |
| static\_website\_iam\_policy\_full\_name | The name of the full right policy |
| static\_website\_iam\_policy\_full\_policy\_document | The policy document |
| static\_website\_iam\_policy\_read\_only\_arn | ARN of the read only policy |
| static\_website\_iam\_policy\_read\_only\_description | The description of the read only policy |
| static\_website\_iam\_policy\_read\_only\_id | ID of the read only policy |
| static\_website\_iam\_policy\_read\_only\_name | The name of the read only policy |
| static\_website\_iam\_policy\_read\_only\_policy\_document | The policy document |
| static\_website\_id | The name of the bucket. |
| static\_website\_kms\_alias\_arn | The Amazon Resource Name (ARN) of the key alias |
| static\_website\_kms\_alias\_target\_key\_arn | The Amazon Resource Name (ARN) of the target key identifier |
| static\_website\_kms\_key\_arn | The Amazon Resource Name (ARN) of the key |
| static\_website\_kms\_key\_id | Globally unique identifier for the key |
| static\_website\_region | The AWS region this bucket resides in. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
