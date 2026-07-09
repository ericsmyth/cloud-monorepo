# mail-dns

Reusable Route53 mail DNS module.

This module currently manages MX records for a domain or subdomain and is intended to keep mail-provider DNS setup separate from the static site infrastructure.

## Current scope

- Route53 MX records

## Common use case

Use this module when a provider such as Google Workspace gives you MX record values that need to be added to a Route53 hosted zone.

## Inputs

- `hosted_zone_id`
- `domain_name`
- `record_name`
- `ttl`
- `mx_records`

## Example

```hcl
module "mail_dns" {
  source = "../../modules/mail-dns"

  hosted_zone_id = var.hosted_zone_id
  domain_name    = var.domain_name
  record_name    = ""
  ttl            = 300

  mx_records = [
    {
      priority = 1
      value    = "smtp.google.com"
    }
  ]
}
```
