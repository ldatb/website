module "website_s3_bucket" {
    source = "./modules/aws-s3"

    domain_name = var.domain_name
    html_index = var.html_index
    html_error = var.html_error
    css_file = var.css_file
    tags = var.tags
}

module "website_dns_route53" {
    source = "./modules/aws-route53"

    domain_name = var.domain_name
    domain_bucket_zone_id = module.website_s3_bucket.domain_bucket_zone_id
    subdomain_bucket_zone_id = module.website_s3_bucket.subdomain_bucket_zone_id
    domain_website_endpoint = module.website_s3_bucket.domain_website_endpoint
    subdomain_website_endpoint = module.website_s3_bucket.subdomain_website_endpoint
}
