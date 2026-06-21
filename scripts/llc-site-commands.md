# Manual deployment straight to AWS. Need to setup GitHub CI/CD

# Sync real config into the Astro app
npm --prefix "./apps/llc-site" run sync-config

# Build the static site
npm --prefix "./apps/llc-site" run build

# Get Terraform outputs
BUCKET=$(terraform -chdir="./infra/aws/envs/prod" output -raw bucket_name)
DIST_ID=$(terraform -chdir="./infra/aws/envs/prod" output -raw cloudfront_distribution_id)

# Upload built files to S3
aws s3 sync "./apps/llc-site/dist/" "s3://${BUCKET}" --delete

# Invalidate CloudFront cache
aws cloudfront create-invalidation --distribution-id "$DIST_ID" --paths "/*"

# Restore the generic tracked config
npm --prefix "./apps/llc-site" run reset-config