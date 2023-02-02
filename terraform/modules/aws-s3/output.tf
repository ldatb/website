output "domain_bucket_zone_id" {
    value = aws_s3_bucket.domain_bucket.hosted_zone_id
    description = "The domain S3 Bucket's zone id"
}

output "domain_website_endpoint" {
    value = aws_s3_bucket_website_configuration.domain_bucket_website.website_domain
    description = "The domain S3 Website's endpoint"
}

output "subdomain_bucket_zone_id" {
    value = aws_s3_bucket.subdomain_bucket.hosted_zone_id
    description = "The subdomain S3 Bucket's zone id"
}

output "subdomain_website_endpoint" {
    value = aws_s3_bucket_website_configuration.subdomain_bucket_website.website_domain
    description = "The subdomain S3 Website's endpoint"
}
