variable "aws_region" {
  description = "AWS region for regional resources like S3."
  type        = string
}

variable "project_name" {
  description = "Short project name used for naming and tags."
  type        = string
}

variable "site_bucket_name" {
  description = "Explicit S3 bucket name for static site assets."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "prod"
}

variable "domain_name" {
  description = "Primary domain name for the site."
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID for the domain."
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of an ACM certificate in us-east-1."
  type        = string
}

variable "tags" {
  description = "Additional tags applied to resources."
  type        = map(string)
  default     = {}
}