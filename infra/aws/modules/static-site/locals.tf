locals {
    normalized_domain = replace(var.domain_name, ".", "-")

    site_bucket_name = lower("${var.project_name}-${var.environment}-${local.normalized_domain}")

    common_tags = merge(
        {
            Project = var.project_name
            Environment = var.environment
            ManagedBy = "Terraform"
        },
        var.tags
    )
}