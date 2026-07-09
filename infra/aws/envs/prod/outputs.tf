output "bucket_name" {
  description = "S3 bucket name for the site."
  value       = module.llc_site.bucket_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID."
  value       = module.llc_site.cloudfront_distribution_id
}

output "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name."
  value       = module.llc_site.cloudfront_distribution_domain_name
}

output "site_url" {
  description = "Primary site URL."
  value       = module.llc_site.site_url
}

output "mail_mx_record_fqdn" {
  description = "FQDN for the mail MX record."
  value       = module.mail_dns.mx_record_fqdn
}