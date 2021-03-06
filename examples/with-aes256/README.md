# Encryption with AES256 example

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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_external_kms_no_policies_no_kms_rotation"></a> [external\_kms\_no\_policies\_no\_kms\_rotation](#module\_external\_kms\_no\_policies\_no\_kms\_rotation) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Credentials: AWS access key. | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Credentials: AWS secret key. Pass this as a variable, never write password in the code. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
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
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
