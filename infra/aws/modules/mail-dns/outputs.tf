output "mx_record_fqdn" {
  description = "Fully qualified domain name for the MX record."
  value       = aws_route53_record.mx.fqdn
}