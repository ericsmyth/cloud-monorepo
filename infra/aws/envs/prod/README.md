# AWS Prod Environment

Terraform environment for the production AWS deployment of the LLC static site.

## Terraform state

This environment uses an S3 backend, but the backend bucket is intentionally bootstrapped outside of this Terraform configuration.

For this project, the recommended approach is:

1. Create the Terraform state bucket manually in AWS.
2. Initialize Terraform with backend configuration that points at that bucket.
3. Run `plan` and `apply` from this environment directory.

The Terraform state bucket should be separate from the static website bucket.

## Recommended manual state bucket settings

- Bucket name: `your-bucket-name`
- Region: `us-west-1`
- Versioning: enabled
- Block all public access: enabled
- Default encryption: enabled

## Backend init

From the repository root, initialize this environment with:

```sh
terraform -chdir="./infra/aws/envs/prod" init \
  -backend-config="bucket=your-tfstate-bucket-name" \
  -backend-config="key=infra/aws/prod/terraform.tfstate" \
  -backend-config="region=your-aws-region"
```

If you ever need to reconfigure the backend after changing settings, use:

```sh
terraform -chdir="./infra/aws/envs/prod" init -reconfigure \
  -backend-config="bucket=your-tfstate-bucket-name" \
  -backend-config="key=infra/aws/prod/terraform.tfstate" \
  -backend-config="region=your-aws-region"
```

## Variables

Populate your real environment values in:

```text
infra/aws/envs/prod/terraform.tfvars
```

The example file is:

```text
infra/aws/envs/prod/terraform.tfvars.example
```

## Common commands

From the repository root:

```sh
terraform -chdir="./infra/aws/envs/prod" fmt
terraform -chdir="./infra/aws/envs/prod" validate
terraform -chdir="./infra/aws/envs/prod" plan
terraform -chdir="./infra/aws/envs/prod" apply
```
