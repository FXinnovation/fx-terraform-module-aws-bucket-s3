module "static_website" {
  source = "../../"

  acl  = "public-read"
  name = "tftestwebsite${random_string.this.result}"

  kms_key_create              = true
  kms_key_name                = "tftestwebsite${random_string.this.result}"
  kms_key_alias_name          = "tftestwebsite${random_string.this.result}"
  iam_policy_create           = true
  iam_policy_read_name        = "tftestwebsiteread${random_string.this.result}"
  iam_policy_read_description = "tftest description"
  iam_policy_full_name        = "tftestwebsitefull${random_string.this.result}"
  iam_policy_full_description = "tftest description"

  static_website_config = [
    {
      index_document = "index.html"
      error_document = "error.html"
      routing_rules  = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
    }
  ]
}
