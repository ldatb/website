module "website_s3_bucket" {
    source = "./modules/aws-s3"

    domain_name = var.domain_name
    website_dir = var.website_dir
    html_index = var.html_index
    html_error = var.html_error
    tags = var.tags
}

module "website_dns_route53" {
    source = "./modules/aws-route53"

    domain_name = var.domain_name
    domain_bucket_zone_id = module.website_s3_bucket.domain_bucket_zone_id
    subdomain_bucket_zone_id = module.website_s3_bucket.subdomain_bucket_zone_id
    domain_website_domain = module.website_s3_bucket.domain_website_domain
    subdomain_website_domain = module.website_s3_bucket.subdomain_website_domain
}
