output "domain_bucket_id" {
    value = aws_s3_bucket.domain_bucket.id
    description = "The domain S3 Bucket's id"
}

output "domain_regional_domain" {
    value = aws_s3_bucket.domain_bucket.bucket_regional_domain_name
    description = "The regional domain name for the domain endpoint"
}

output "subdomain_bucket_id" {
    value = aws_s3_bucket.domain_bucket.id
    description = "The subdomain S3 Bucket's id"
}

output "subdomain_regional_domain" {
    value = aws_s3_bucket.subdomain_bucket.bucket_regional_domain_name
    description = "The regional domain name for the subdomain endpoint"
}
