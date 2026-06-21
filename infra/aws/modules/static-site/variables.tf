variable "project_name" {
  description = "Short project name for naming and tagging resources."
  type        = string
}

variable "environment" {
  description = "Deployment env name."
  type        = string
}

variable "domain_name" {
  description = "Primary domain name for the site, example.com."
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID for the domain."
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of ACM cert in us-east-1 for CloudFront."
  type        = string
}

variable "site_bucket_name" {
  description = "Optional explicit S3 bucket name for static site assets."
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Default root object served by CloudFront"
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_100"
}

variable "enable_ipv6" {
  description = "Whether to enable IPv6 for the CloudFront distribution."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags applied to resources."
  type        = map(string)
  default     = {}
}