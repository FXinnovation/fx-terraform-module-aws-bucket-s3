2.0.0 / 2021-02-03
===============================

  * fix: (BREAKING) remove region from bucket definition (needed for aws provider > 3) and `variables.tf`
  * fix: permit aws provider > 3
  * fix: count on data resources (unbreak when the KMS key is used inside `sse_config`)
  * chore: bump pre-commit hooks to fix jenkins test

1.0.3 / 2020-05-06
==================

  * fix: null value when s3 bucket is not created

1.0.2 / 2020-03-21
==================

  * fix: wrong IAM polices when default bucket KMS key is used

1.0.1 / 2020-01-24
==================

  * fix: pre-commit failure due to version bumps

1.0.0 / 2020-01-22
==================

  * breaking: terraform 0.12 upgrade and new features

0.4.0 / 2019-12-02
==================

  * Merge branch 'feature/kms_policy' of fxinnovation-public/terraform-module-aws-bucket-s3 into master
  * fix/ typo
  * feat/ KMS key policy suport

0.3.0 / 2019-11-29
==================

  * Merge branch 'feature/missing_outputs_add_lifecycle' of fxinnovation-public/terraform-module-aws-bucket-s3 into master
  * fix/ typo
  * fix/ output + remove prefix
  * fix/ typo
  * fix/ outputs
  * tech/ changelog
  * feature/ add object_lock expiration time

0.2.0 / 2019-11-27
==================

  * Merge branch 'feature/add_object_lock_and_versioning' of fxinnovation-public/terraform-module-aws-bucket-s3 into master
  * fix/ typo
  * tech/ CHANGELOG
  * feature/ add versioning and object_lock

0.1.0 / 2019-11-20
==================

  * Merge branch 'feature/init' of fxinnovation-public/terraform-module-aws-bucket-s3 into master
  * fix/ output format
  * tech/ bump pre-commit version
  * fix/ stupid terraform 0.11
  * fix/ data source
  * fix/ bucket policy
  * fix/ tests
  * feature/ add disable test
  * fix/ descriptions
  * fix/ typo
  * fix/ var name
  * fix/ missing comma
  * fix/ pre-commit version
  * fix/ missing output and missing pre-commit
  * feature/ init
  * Initial commit
