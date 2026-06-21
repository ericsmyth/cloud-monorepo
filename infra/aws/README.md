# AWS Infrastructure

AWS infrastructure code for this monorepo.

## Layout

```text
infra/aws/
├── envs/
│   └── prod/
└── modules/
    └── static-site/
```

## Current scope

The current AWS implementation is focused on a low-cost static site deployment using:

- S3 for static asset storage
- CloudFront for CDN and HTTPS delivery
- Origin Access Control for private S3 access
- Route53 for DNS
- ACM for the CloudFront certificate

## Key locations

- `infra/aws/modules/static-site` contains the reusable AWS static-site module
- `infra/aws/envs/prod` contains the production environment configuration

See `infra/aws/envs/prod/README.md` for the backend and state-bucket setup workflow.
