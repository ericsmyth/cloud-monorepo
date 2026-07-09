variable "hosted_zone_id" {
  description = "Route53 hosted zone ID for domain."
  type        = string
}

variable "domain_name" {
  description = "Base domain name for mail DNS records."
  type        = string
}

variable "record_name" {
  description = "Subdomain label for the MX record. Use an empty string for the apex/root domain."
  type        = string
  default     = ""
}

variable "ttl" {
  description = "TTL for the MX record."
  type        = number
  default     = 300
}

variable "mx_records" {
  description = "List of MX records for the domain."
  type = list(object({
    priority = number
    value    = string
  }))
}