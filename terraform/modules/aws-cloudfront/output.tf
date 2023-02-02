output "domain_dist_domain" {
    value = aws_cloudfront_distribution.domain_distribution.domain_name
    description = "The Domain's CloudFront distribution domain name"
}

output "subdomain_dist_domain" {
    value = aws_cloudfront_distribution.subdomain_distribution.domain_name
    description = "The Subdomain's CloudFront distribution domain name"
}

output "domain_dist_zone_id" {
    value = aws_cloudfront_distribution.domain_distribution.hosted_zone_id
    description = "The Domain's CloudFront distribution zone id"
}

output "subdomain_dist_zone_id" {
    value = aws_cloudfront_distribution.subdomain_distribution.hosted_zone_id
    description = "The Subdomain's CloudFront distribution zone id"
}