module "website_s3_bucket" {
    source = "./modules/aws-s3"

    domain_name = var.domain_name
    html_index = var.html_index
    html_error = var.html_error
    css_file = var.css_file
    tags = var.tags
}

module "website_ssl_cert" {
    source = "./modules/aws-acm"

    domain_name = var.domain_name
    tags = var.tags
}

module "website_cloudfront_dist" {
    source = "./modules/aws-cloudfront"

    domain_website_endpoint = module.website_s3_bucket.domain_website_endpoint
    subdomain_website_endpoint = module.website_s3_bucket.subdomain_website_endpoint
    domain_bucket_id = module.website_s3_bucket.domain_bucket_id
    subdomain_bucket_id = module.website_s3_bucket.subdomain_bucket_id
    ssl_cert_arn = module.website_ssl_cert.ssl_cert_arn
    html_index = var.html_index
    domain_name = var.domain_name
    tags = var.tags
}

module "website_dns_route53" {
    source = "./modules/aws-route53"

    domain_name = var.domain_name
    domain_dist_name = module.website_cloudfront_dist.domain_dist_domain
    subdomain_dist_name = module.website_cloudfront_dist.subdomain_dist_domain
    domain_dist_zone_id = module.website_cloudfront_dist.domain_dist_zone_id
    subdomain_dist_zone_id = module.website_cloudfront_dist.subdomain_dist_zone_id
}
