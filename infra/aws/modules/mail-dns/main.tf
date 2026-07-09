resource "aws_route53_record" "mx" {
  zone_id = var.hosted_zone_id
  name    = local.mx_record_fqdn
  type    = "MX"
  ttl     = var.ttl

  records = local.normalized_mx_records
}