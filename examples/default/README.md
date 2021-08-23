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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.5 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_disable"></a> [disable](#module\_disable) | ../../ | n/a |
| <a name="module_external_kms_no_policies"></a> [external\_kms\_no\_policies](#module\_external\_kms\_no\_policies) | ../../ | n/a |
| <a name="module_external_kms_no_policies_no_kms_rotation"></a> [external\_kms\_no\_policies\_no\_kms\_rotation](#module\_external\_kms\_no\_policies\_no\_kms\_rotation) | ../../ | n/a |
| <a name="module_logging"></a> [logging](#module\_logging) | ../../ | n/a |
| <a name="module_logging_destination"></a> [logging\_destination](#module\_logging\_destination) | ../../ | n/a |
| <a name="module_object_lock_with_policy"></a> [object\_lock\_with\_policy](#module\_object\_lock\_with\_policy) | ../../ | n/a |
| <a name="module_policy"></a> [policy](#module\_policy) | ../../ | n/a |
| <a name="module_policy_no_kms_rotation"></a> [policy\_no\_kms\_rotation](#module\_policy\_no\_kms\_rotation) | ../../ | n/a |
| <a name="module_standard"></a> [standard](#module\_standard) | ../../ | n/a |
| <a name="module_static_website"></a> [static\_website](#module\_static\_website) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.olwp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_no_rotation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Credentials: AWS access key. | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bp_arn"></a> [bp\_arn](#output\_bp\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_bp_bucket_domain_name"></a> [bp\_bucket\_domain\_name](#output\_bp\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_bp_bucket_regional_domain_name"></a> [bp\_bucket\_regional\_domain\_name](#output\_bp\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_bp_hosted_zone_id"></a> [bp\_hosted\_zone\_id](#output\_bp\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_bp_iam_policy_full_arn"></a> [bp\_iam\_policy\_full\_arn](#output\_bp\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_bp_iam_policy_full_description"></a> [bp\_iam\_policy\_full\_description](#output\_bp\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_bp_iam_policy_full_id"></a> [bp\_iam\_policy\_full\_id](#output\_bp\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_bp_iam_policy_full_name"></a> [bp\_iam\_policy\_full\_name](#output\_bp\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_bp_iam_policy_full_policy_document"></a> [bp\_iam\_policy\_full\_policy\_document](#output\_bp\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_bp_iam_policy_read_only_arn"></a> [bp\_iam\_policy\_read\_only\_arn](#output\_bp\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_bp_iam_policy_read_only_description"></a> [bp\_iam\_policy\_read\_only\_description](#output\_bp\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_bp_iam_policy_read_only_id"></a> [bp\_iam\_policy\_read\_only\_id](#output\_bp\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_bp_iam_policy_read_only_name"></a> [bp\_iam\_policy\_read\_only\_name](#output\_bp\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_bp_iam_policy_read_only_policy_document"></a> [bp\_iam\_policy\_read\_only\_policy\_document](#output\_bp\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_bp_id"></a> [bp\_id](#output\_bp\_id) | The name of the bucket. |
| <a name="output_bp_kms_alias_arn"></a> [bp\_kms\_alias\_arn](#output\_bp\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_bp_kms_alias_target_key_arn"></a> [bp\_kms\_alias\_target\_key\_arn](#output\_bp\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_bp_kms_key_arn"></a> [bp\_kms\_key\_arn](#output\_bp\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_bp_kms_key_id"></a> [bp\_kms\_key\_id](#output\_bp\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_bp_no_rotation_arn"></a> [bp\_no\_rotation\_arn](#output\_bp\_no\_rotation\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_bp_no_rotation_bucket_domain_name"></a> [bp\_no\_rotation\_bucket\_domain\_name](#output\_bp\_no\_rotation\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_bp_no_rotation_bucket_regional_domain_name"></a> [bp\_no\_rotation\_bucket\_regional\_domain\_name](#output\_bp\_no\_rotation\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_bp_no_rotation_hosted_zone_id"></a> [bp\_no\_rotation\_hosted\_zone\_id](#output\_bp\_no\_rotation\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_bp_no_rotation_iam_policy_full_arn"></a> [bp\_no\_rotation\_iam\_policy\_full\_arn](#output\_bp\_no\_rotation\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_bp_no_rotation_iam_policy_full_description"></a> [bp\_no\_rotation\_iam\_policy\_full\_description](#output\_bp\_no\_rotation\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_bp_no_rotation_iam_policy_full_id"></a> [bp\_no\_rotation\_iam\_policy\_full\_id](#output\_bp\_no\_rotation\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_bp_no_rotation_iam_policy_full_name"></a> [bp\_no\_rotation\_iam\_policy\_full\_name](#output\_bp\_no\_rotation\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_bp_no_rotation_iam_policy_full_policy_document"></a> [bp\_no\_rotation\_iam\_policy\_full\_policy\_document](#output\_bp\_no\_rotation\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_bp_no_rotation_iam_policy_read_only_arn"></a> [bp\_no\_rotation\_iam\_policy\_read\_only\_arn](#output\_bp\_no\_rotation\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_bp_no_rotation_iam_policy_read_only_description"></a> [bp\_no\_rotation\_iam\_policy\_read\_only\_description](#output\_bp\_no\_rotation\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_bp_no_rotation_iam_policy_read_only_id"></a> [bp\_no\_rotation\_iam\_policy\_read\_only\_id](#output\_bp\_no\_rotation\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_bp_no_rotation_iam_policy_read_only_name"></a> [bp\_no\_rotation\_iam\_policy\_read\_only\_name](#output\_bp\_no\_rotation\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_bp_no_rotation_iam_policy_read_only_policy_document"></a> [bp\_no\_rotation\_iam\_policy\_read\_only\_policy\_document](#output\_bp\_no\_rotation\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_bp_no_rotation_id"></a> [bp\_no\_rotation\_id](#output\_bp\_no\_rotation\_id) | The name of the bucket. |
| <a name="output_bp_no_rotation_kms_alias_arn"></a> [bp\_no\_rotation\_kms\_alias\_arn](#output\_bp\_no\_rotation\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_bp_no_rotation_kms_alias_target_key_arn"></a> [bp\_no\_rotation\_kms\_alias\_target\_key\_arn](#output\_bp\_no\_rotation\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_bp_no_rotation_kms_key_arn"></a> [bp\_no\_rotation\_kms\_key\_arn](#output\_bp\_no\_rotation\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_bp_no_rotation_kms_key_id"></a> [bp\_no\_rotation\_kms\_key\_id](#output\_bp\_no\_rotation\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_bp_no_rotation_region"></a> [bp\_no\_rotation\_region](#output\_bp\_no\_rotation\_region) | The AWS region this bucket resides in. |
| <a name="output_bp_region"></a> [bp\_region](#output\_bp\_region) | The AWS region this bucket resides in. |
| <a name="output_disabled_arn"></a> [disabled\_arn](#output\_disabled\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_disabled_bucket_domain_name"></a> [disabled\_bucket\_domain\_name](#output\_disabled\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_disabled_bucket_regional_domain_name"></a> [disabled\_bucket\_regional\_domain\_name](#output\_disabled\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_disabled_hosted_zone_id"></a> [disabled\_hosted\_zone\_id](#output\_disabled\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_disabled_iam_policy_full_arn"></a> [disabled\_iam\_policy\_full\_arn](#output\_disabled\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_disabled_iam_policy_full_description"></a> [disabled\_iam\_policy\_full\_description](#output\_disabled\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_disabled_iam_policy_full_id"></a> [disabled\_iam\_policy\_full\_id](#output\_disabled\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_disabled_iam_policy_full_name"></a> [disabled\_iam\_policy\_full\_name](#output\_disabled\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_disabled_iam_policy_full_policy_document"></a> [disabled\_iam\_policy\_full\_policy\_document](#output\_disabled\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_disabled_iam_policy_read_only_arn"></a> [disabled\_iam\_policy\_read\_only\_arn](#output\_disabled\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_disabled_iam_policy_read_only_description"></a> [disabled\_iam\_policy\_read\_only\_description](#output\_disabled\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_disabled_iam_policy_read_only_id"></a> [disabled\_iam\_policy\_read\_only\_id](#output\_disabled\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_disabled_iam_policy_read_only_name"></a> [disabled\_iam\_policy\_read\_only\_name](#output\_disabled\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_disabled_iam_policy_read_only_policy_document"></a> [disabled\_iam\_policy\_read\_only\_policy\_document](#output\_disabled\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_disabled_id"></a> [disabled\_id](#output\_disabled\_id) | The name of the bucket. |
| <a name="output_disabled_kms_alias_arn"></a> [disabled\_kms\_alias\_arn](#output\_disabled\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_disabled_kms_alias_target_key_arn"></a> [disabled\_kms\_alias\_target\_key\_arn](#output\_disabled\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_disabled_kms_key_arn"></a> [disabled\_kms\_key\_arn](#output\_disabled\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_disabled_kms_key_id"></a> [disabled\_kms\_key\_id](#output\_disabled\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_disabled_region"></a> [disabled\_region](#output\_disabled\_region) | The AWS region this bucket resides in. |
| <a name="output_extkms_arn"></a> [extkms\_arn](#output\_extkms\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_extkms_bucket_domain_name"></a> [extkms\_bucket\_domain\_name](#output\_extkms\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_extkms_bucket_regional_domain_name"></a> [extkms\_bucket\_regional\_domain\_name](#output\_extkms\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_extkms_hosted_zone_id"></a> [extkms\_hosted\_zone\_id](#output\_extkms\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_extkms_iam_policy_full_arn"></a> [extkms\_iam\_policy\_full\_arn](#output\_extkms\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_extkms_iam_policy_full_description"></a> [extkms\_iam\_policy\_full\_description](#output\_extkms\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_extkms_iam_policy_full_id"></a> [extkms\_iam\_policy\_full\_id](#output\_extkms\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_extkms_iam_policy_full_name"></a> [extkms\_iam\_policy\_full\_name](#output\_extkms\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_extkms_iam_policy_full_policy_document"></a> [extkms\_iam\_policy\_full\_policy\_document](#output\_extkms\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_extkms_iam_policy_read_only_arn"></a> [extkms\_iam\_policy\_read\_only\_arn](#output\_extkms\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_extkms_iam_policy_read_only_description"></a> [extkms\_iam\_policy\_read\_only\_description](#output\_extkms\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_extkms_iam_policy_read_only_id"></a> [extkms\_iam\_policy\_read\_only\_id](#output\_extkms\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_extkms_iam_policy_read_only_name"></a> [extkms\_iam\_policy\_read\_only\_name](#output\_extkms\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_extkms_iam_policy_read_only_policy_document"></a> [extkms\_iam\_policy\_read\_only\_policy\_document](#output\_extkms\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_extkms_id"></a> [extkms\_id](#output\_extkms\_id) | The name of the bucket. |
| <a name="output_extkms_kms_alias_arn"></a> [extkms\_kms\_alias\_arn](#output\_extkms\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_extkms_kms_alias_target_key_arn"></a> [extkms\_kms\_alias\_target\_key\_arn](#output\_extkms\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_extkms_kms_key_arn"></a> [extkms\_kms\_key\_arn](#output\_extkms\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_extkms_kms_key_id"></a> [extkms\_kms\_key\_id](#output\_extkms\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_extkms_no_rotation_arn"></a> [extkms\_no\_rotation\_arn](#output\_extkms\_no\_rotation\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_extkms_no_rotation_bucket_domain_name"></a> [extkms\_no\_rotation\_bucket\_domain\_name](#output\_extkms\_no\_rotation\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_extkms_no_rotation_bucket_regional_domain_name"></a> [extkms\_no\_rotation\_bucket\_regional\_domain\_name](#output\_extkms\_no\_rotation\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_extkms_no_rotation_hosted_zone_id"></a> [extkms\_no\_rotation\_hosted\_zone\_id](#output\_extkms\_no\_rotation\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_extkms_no_rotation_iam_policy_full_arn"></a> [extkms\_no\_rotation\_iam\_policy\_full\_arn](#output\_extkms\_no\_rotation\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_extkms_no_rotation_iam_policy_full_description"></a> [extkms\_no\_rotation\_iam\_policy\_full\_description](#output\_extkms\_no\_rotation\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_extkms_no_rotation_iam_policy_full_id"></a> [extkms\_no\_rotation\_iam\_policy\_full\_id](#output\_extkms\_no\_rotation\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_extkms_no_rotation_iam_policy_full_name"></a> [extkms\_no\_rotation\_iam\_policy\_full\_name](#output\_extkms\_no\_rotation\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_extkms_no_rotation_iam_policy_full_policy_document"></a> [extkms\_no\_rotation\_iam\_policy\_full\_policy\_document](#output\_extkms\_no\_rotation\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_extkms_no_rotation_iam_policy_read_only_arn"></a> [extkms\_no\_rotation\_iam\_policy\_read\_only\_arn](#output\_extkms\_no\_rotation\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_extkms_no_rotation_iam_policy_read_only_description"></a> [extkms\_no\_rotation\_iam\_policy\_read\_only\_description](#output\_extkms\_no\_rotation\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_extkms_no_rotation_iam_policy_read_only_id"></a> [extkms\_no\_rotation\_iam\_policy\_read\_only\_id](#output\_extkms\_no\_rotation\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_extkms_no_rotation_iam_policy_read_only_name"></a> [extkms\_no\_rotation\_iam\_policy\_read\_only\_name](#output\_extkms\_no\_rotation\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_extkms_no_rotation_iam_policy_read_only_policy_document"></a> [extkms\_no\_rotation\_iam\_policy\_read\_only\_policy\_document](#output\_extkms\_no\_rotation\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_extkms_no_rotation_id"></a> [extkms\_no\_rotation\_id](#output\_extkms\_no\_rotation\_id) | The name of the bucket. |
| <a name="output_extkms_no_rotation_kms_alias_arn"></a> [extkms\_no\_rotation\_kms\_alias\_arn](#output\_extkms\_no\_rotation\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_extkms_no_rotation_kms_alias_target_key_arn"></a> [extkms\_no\_rotation\_kms\_alias\_target\_key\_arn](#output\_extkms\_no\_rotation\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_extkms_no_rotation_kms_key_arn"></a> [extkms\_no\_rotation\_kms\_key\_arn](#output\_extkms\_no\_rotation\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_extkms_no_rotation_kms_key_id"></a> [extkms\_no\_rotation\_kms\_key\_id](#output\_extkms\_no\_rotation\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_extkms_no_rotation_region"></a> [extkms\_no\_rotation\_region](#output\_extkms\_no\_rotation\_region) | The AWS region this bucket resides in. |
| <a name="output_extkms_region"></a> [extkms\_region](#output\_extkms\_region) | The AWS region this bucket resides in. |
| <a name="output_logging_arn"></a> [logging\_arn](#output\_logging\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_logging_bucket_domain_name"></a> [logging\_bucket\_domain\_name](#output\_logging\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_logging_bucket_regional_domain_name"></a> [logging\_bucket\_regional\_domain\_name](#output\_logging\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_logging_destination_arn"></a> [logging\_destination\_arn](#output\_logging\_destination\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_logging_destination_bucket_domain_name"></a> [logging\_destination\_bucket\_domain\_name](#output\_logging\_destination\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_logging_destination_bucket_regional_domain_name"></a> [logging\_destination\_bucket\_regional\_domain\_name](#output\_logging\_destination\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_logging_destination_hosted_zone_id"></a> [logging\_destination\_hosted\_zone\_id](#output\_logging\_destination\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_logging_destination_iam_policy_full_arn"></a> [logging\_destination\_iam\_policy\_full\_arn](#output\_logging\_destination\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_logging_destination_iam_policy_full_description"></a> [logging\_destination\_iam\_policy\_full\_description](#output\_logging\_destination\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_logging_destination_iam_policy_full_id"></a> [logging\_destination\_iam\_policy\_full\_id](#output\_logging\_destination\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_logging_destination_iam_policy_full_name"></a> [logging\_destination\_iam\_policy\_full\_name](#output\_logging\_destination\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_logging_destination_iam_policy_full_policy_document"></a> [logging\_destination\_iam\_policy\_full\_policy\_document](#output\_logging\_destination\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_logging_destination_iam_policy_read_only_arn"></a> [logging\_destination\_iam\_policy\_read\_only\_arn](#output\_logging\_destination\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_logging_destination_iam_policy_read_only_description"></a> [logging\_destination\_iam\_policy\_read\_only\_description](#output\_logging\_destination\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_logging_destination_iam_policy_read_only_id"></a> [logging\_destination\_iam\_policy\_read\_only\_id](#output\_logging\_destination\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_logging_destination_iam_policy_read_only_name"></a> [logging\_destination\_iam\_policy\_read\_only\_name](#output\_logging\_destination\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_logging_destination_iam_policy_read_only_policy_document"></a> [logging\_destination\_iam\_policy\_read\_only\_policy\_document](#output\_logging\_destination\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_logging_destination_id"></a> [logging\_destination\_id](#output\_logging\_destination\_id) | The name of the bucket. |
| <a name="output_logging_destination_kms_alias_arn"></a> [logging\_destination\_kms\_alias\_arn](#output\_logging\_destination\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_logging_destination_kms_alias_target_key_arn"></a> [logging\_destination\_kms\_alias\_target\_key\_arn](#output\_logging\_destination\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_logging_destination_kms_key_arn"></a> [logging\_destination\_kms\_key\_arn](#output\_logging\_destination\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_logging_destination_kms_key_id"></a> [logging\_destination\_kms\_key\_id](#output\_logging\_destination\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_logging_destination_region"></a> [logging\_destination\_region](#output\_logging\_destination\_region) | The AWS region this bucket resides in. |
| <a name="output_logging_hosted_zone_id"></a> [logging\_hosted\_zone\_id](#output\_logging\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_logging_iam_policy_full_arn"></a> [logging\_iam\_policy\_full\_arn](#output\_logging\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_logging_iam_policy_full_description"></a> [logging\_iam\_policy\_full\_description](#output\_logging\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_logging_iam_policy_full_id"></a> [logging\_iam\_policy\_full\_id](#output\_logging\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_logging_iam_policy_full_name"></a> [logging\_iam\_policy\_full\_name](#output\_logging\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_logging_iam_policy_full_policy_document"></a> [logging\_iam\_policy\_full\_policy\_document](#output\_logging\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_logging_iam_policy_read_only_arn"></a> [logging\_iam\_policy\_read\_only\_arn](#output\_logging\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_logging_iam_policy_read_only_description"></a> [logging\_iam\_policy\_read\_only\_description](#output\_logging\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_logging_iam_policy_read_only_id"></a> [logging\_iam\_policy\_read\_only\_id](#output\_logging\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_logging_iam_policy_read_only_name"></a> [logging\_iam\_policy\_read\_only\_name](#output\_logging\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_logging_iam_policy_read_only_policy_document"></a> [logging\_iam\_policy\_read\_only\_policy\_document](#output\_logging\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_logging_id"></a> [logging\_id](#output\_logging\_id) | The name of the bucket. |
| <a name="output_logging_kms_alias_arn"></a> [logging\_kms\_alias\_arn](#output\_logging\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_logging_kms_alias_target_key_arn"></a> [logging\_kms\_alias\_target\_key\_arn](#output\_logging\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_logging_kms_key_arn"></a> [logging\_kms\_key\_arn](#output\_logging\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_logging_kms_key_id"></a> [logging\_kms\_key\_id](#output\_logging\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_logging_region"></a> [logging\_region](#output\_logging\_region) | The AWS region this bucket resides in. |
| <a name="output_olwp_arn"></a> [olwp\_arn](#output\_olwp\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_olwp_bucket_domain_name"></a> [olwp\_bucket\_domain\_name](#output\_olwp\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_olwp_bucket_regional_domain_name"></a> [olwp\_bucket\_regional\_domain\_name](#output\_olwp\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_olwp_hosted_zone_id"></a> [olwp\_hosted\_zone\_id](#output\_olwp\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_olwp_iam_policy_full_arn"></a> [olwp\_iam\_policy\_full\_arn](#output\_olwp\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_olwp_iam_policy_full_description"></a> [olwp\_iam\_policy\_full\_description](#output\_olwp\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_olwp_iam_policy_full_id"></a> [olwp\_iam\_policy\_full\_id](#output\_olwp\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_olwp_iam_policy_full_name"></a> [olwp\_iam\_policy\_full\_name](#output\_olwp\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_olwp_iam_policy_full_policy_document"></a> [olwp\_iam\_policy\_full\_policy\_document](#output\_olwp\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_olwp_iam_policy_read_only_arn"></a> [olwp\_iam\_policy\_read\_only\_arn](#output\_olwp\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_olwp_iam_policy_read_only_description"></a> [olwp\_iam\_policy\_read\_only\_description](#output\_olwp\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_olwp_iam_policy_read_only_id"></a> [olwp\_iam\_policy\_read\_only\_id](#output\_olwp\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_olwp_iam_policy_read_only_name"></a> [olwp\_iam\_policy\_read\_only\_name](#output\_olwp\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_olwp_iam_policy_read_only_policy_document"></a> [olwp\_iam\_policy\_read\_only\_policy\_document](#output\_olwp\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_olwp_id"></a> [olwp\_id](#output\_olwp\_id) | The name of the bucket. |
| <a name="output_olwp_kms_alias_arn"></a> [olwp\_kms\_alias\_arn](#output\_olwp\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_olwp_kms_alias_target_key_arn"></a> [olwp\_kms\_alias\_target\_key\_arn](#output\_olwp\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_olwp_kms_key_arn"></a> [olwp\_kms\_key\_arn](#output\_olwp\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_olwp_kms_key_id"></a> [olwp\_kms\_key\_id](#output\_olwp\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_olwp_region"></a> [olwp\_region](#output\_olwp\_region) | The AWS region this bucket resides in. |
| <a name="output_standard_arn"></a> [standard\_arn](#output\_standard\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_standard_bucket_domain_name"></a> [standard\_bucket\_domain\_name](#output\_standard\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_standard_bucket_regional_domain_name"></a> [standard\_bucket\_regional\_domain\_name](#output\_standard\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_standard_hosted_zone_id"></a> [standard\_hosted\_zone\_id](#output\_standard\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_standard_iam_policy_full_arn"></a> [standard\_iam\_policy\_full\_arn](#output\_standard\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_standard_iam_policy_full_description"></a> [standard\_iam\_policy\_full\_description](#output\_standard\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_standard_iam_policy_full_id"></a> [standard\_iam\_policy\_full\_id](#output\_standard\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_standard_iam_policy_full_name"></a> [standard\_iam\_policy\_full\_name](#output\_standard\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_standard_iam_policy_full_policy_document"></a> [standard\_iam\_policy\_full\_policy\_document](#output\_standard\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_standard_iam_policy_read_only_arn"></a> [standard\_iam\_policy\_read\_only\_arn](#output\_standard\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_standard_iam_policy_read_only_description"></a> [standard\_iam\_policy\_read\_only\_description](#output\_standard\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_standard_iam_policy_read_only_id"></a> [standard\_iam\_policy\_read\_only\_id](#output\_standard\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_standard_iam_policy_read_only_name"></a> [standard\_iam\_policy\_read\_only\_name](#output\_standard\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_standard_iam_policy_read_only_policy_document"></a> [standard\_iam\_policy\_read\_only\_policy\_document](#output\_standard\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_standard_id"></a> [standard\_id](#output\_standard\_id) | The name of the bucket. |
| <a name="output_standard_kms_alias_arn"></a> [standard\_kms\_alias\_arn](#output\_standard\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_standard_kms_alias_target_key_arn"></a> [standard\_kms\_alias\_target\_key\_arn](#output\_standard\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_standard_kms_key_arn"></a> [standard\_kms\_key\_arn](#output\_standard\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_standard_kms_key_id"></a> [standard\_kms\_key\_id](#output\_standard\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_standard_region"></a> [standard\_region](#output\_standard\_region) | The AWS region this bucket resides in. |
| <a name="output_static_website_arn"></a> [static\_website\_arn](#output\_static\_website\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_static_website_bucket_domain_name"></a> [static\_website\_bucket\_domain\_name](#output\_static\_website\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_static_website_bucket_regional_domain_name"></a> [static\_website\_bucket\_regional\_domain\_name](#output\_static\_website\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_static_website_hosted_zone_id"></a> [static\_website\_hosted\_zone\_id](#output\_static\_website\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_static_website_iam_policy_full_arn"></a> [static\_website\_iam\_policy\_full\_arn](#output\_static\_website\_iam\_policy\_full\_arn) | ARN of the full right policy |
| <a name="output_static_website_iam_policy_full_description"></a> [static\_website\_iam\_policy\_full\_description](#output\_static\_website\_iam\_policy\_full\_description) | The description of the full right policy |
| <a name="output_static_website_iam_policy_full_id"></a> [static\_website\_iam\_policy\_full\_id](#output\_static\_website\_iam\_policy\_full\_id) | ID of the full right policy |
| <a name="output_static_website_iam_policy_full_name"></a> [static\_website\_iam\_policy\_full\_name](#output\_static\_website\_iam\_policy\_full\_name) | The name of the full right policy |
| <a name="output_static_website_iam_policy_full_policy_document"></a> [static\_website\_iam\_policy\_full\_policy\_document](#output\_static\_website\_iam\_policy\_full\_policy\_document) | The policy document |
| <a name="output_static_website_iam_policy_read_only_arn"></a> [static\_website\_iam\_policy\_read\_only\_arn](#output\_static\_website\_iam\_policy\_read\_only\_arn) | ARN of the read only policy |
| <a name="output_static_website_iam_policy_read_only_description"></a> [static\_website\_iam\_policy\_read\_only\_description](#output\_static\_website\_iam\_policy\_read\_only\_description) | The description of the read only policy |
| <a name="output_static_website_iam_policy_read_only_id"></a> [static\_website\_iam\_policy\_read\_only\_id](#output\_static\_website\_iam\_policy\_read\_only\_id) | ID of the read only policy |
| <a name="output_static_website_iam_policy_read_only_name"></a> [static\_website\_iam\_policy\_read\_only\_name](#output\_static\_website\_iam\_policy\_read\_only\_name) | The name of the read only policy |
| <a name="output_static_website_iam_policy_read_only_policy_document"></a> [static\_website\_iam\_policy\_read\_only\_policy\_document](#output\_static\_website\_iam\_policy\_read\_only\_policy\_document) | The policy document |
| <a name="output_static_website_id"></a> [static\_website\_id](#output\_static\_website\_id) | The name of the bucket. |
| <a name="output_static_website_kms_alias_arn"></a> [static\_website\_kms\_alias\_arn](#output\_static\_website\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_static_website_kms_alias_target_key_arn"></a> [static\_website\_kms\_alias\_target\_key\_arn](#output\_static\_website\_kms\_alias\_target\_key\_arn) | The Amazon Resource Name (ARN) of the target key identifier |
| <a name="output_static_website_kms_key_arn"></a> [static\_website\_kms\_key\_arn](#output\_static\_website\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_static_website_kms_key_id"></a> [static\_website\_kms\_key\_id](#output\_static\_website\_kms\_key\_id) | Globally unique identifier for the key |
| <a name="output_static_website_region"></a> [static\_website\_region](#output\_static\_website\_region) | The AWS region this bucket resides in. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
