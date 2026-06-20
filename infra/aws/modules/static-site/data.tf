data "aws_cloudfront_cache_policy" "caching_optimized" {
    name = "Managed-CachingOptimized"
}

data "aws_iam_policy_document" "site_bucket_policy" {
    statement {
        sid = "AllowedCloudFrontReadAccess"
        effect = "Allow"
        
        principals {
          type = "Service"
          identifiers = ["cloudfront.amazonaws.com"]
        }

        actions = ["s3:GetObject"]

        resources = [
            "${aws_s3_bucket.site.arn}/*"
        ]

        condition {
            test = "StringEquals"
            variable = "AWS:SourceArn"
            values = [aws_cloudfront_distribution.site.arn]
        }
    }
}