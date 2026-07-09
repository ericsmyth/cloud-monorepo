module "llc_site" {
  source = "../../modules/static-site"

  project_name        = var.project_name
  site_bucket_name    = var.site_bucket_name
  environment         = var.environment
  domain_name         = var.domain_name
  hosted_zone_id      = var.hosted_zone_id
  acm_certificate_arn = var.acm_certificate_arn

  default_root_object = "index.html"
  price_class         = "PriceClass_100"

  tags = var.tags
}

module "mail_dns" {
  source         = "../../modules/mail-dns"
  hosted_zone_id = var.hosted_zone_id
  domain_name    = var.domain_name
  record_name    = var.mail_record_name
  ttl            = var.mail_ttl
  mx_records     = var.mail_mx_records
}