# Cloud Monorepo

Monorepo for cloud infrastructure projects, static sites, and supporting documentation.

This repository is organized to keep application code, deployment configuration, and infrastructure code easy to understand and easy to extend over time.

## Current scope

The current starter project includes:

- an Astro-based static site at `apps/llc-site`
- public site configuration under `config/llc-site`
- AWS Terraform infrastructure under `infra/aws`
- supporting project documentation under `docs`

## Repository structure

```text
cloud-monorepo/
├── .github/
│   └── workflows/
├── apps/
│   └── llc-site/
├── config/
│   └── llc-site/
├── docs/
├── infra/
│   └── aws/
│       ├── envs/
│       └── modules/
└── scripts/
```

## Apps

### `apps/llc-site`

Static Astro site for the LLC website.

Run it locally from the repository root:

```sh
npm --prefix "./apps/llc-site" install
npm --prefix "./apps/llc-site" run dev
```

Build it locally:

```sh
npm --prefix "./apps/llc-site" run build
```

Additional app details live in `apps/llc-site/README.md`.

## Config

Public site content for the Astro app is stored under:

```text
config/llc-site/
```

The production config is intended to be copied into:

```text
apps/llc-site/public/config.json
```

This keeps business content separate from the frontend implementation.

## Infrastructure

AWS infrastructure for the site is under:

```text
infra/aws/
```

Key locations:

- `infra/aws/modules/static-site` for the reusable static site module
- `infra/aws/envs/prod` for the production environment

The initial AWS design uses:

- S3 for static asset storage
- CloudFront for CDN and HTTPS delivery
- Origin Access Control for private S3 access
- Route53 for DNS
- ACM for the CloudFront certificate

## GitHub Actions Deploy

The LLC site can be deployed from GitHub Actions using:

```text
.github/workflows/deploy-llc-site.yml
```

The workflow expects these repository secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `LLC_SITE_CONFIG_JSON`

The workflow expects these repository variables:

- `AWS_REGION`
- `LLC_SITE_S3_BUCKET_NAME`
- `LLC_SITE_CLOUDFRONT_DISTRIBUTION_ID`

## Documentation

Project notes and architecture documents live in:

```text
docs/
```

Recommended additions over time:

- architecture overview
- deployment workflow
- technical decisions and trade-offs

