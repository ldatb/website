module "ssl_cert" {
    source = "./modules/aws-acm"

    domain_name = var.domain_name
    tags = var.tags
}

module "database" {
  source = "./modules/aws-dynamo"

  db_name = var.db_name
  tags    = var.tags
}

module "api_lambda" {
  source = "./modules/aws-lambda"

  domain_name = var.db_name
  db_name = module.database.db_name
  db_arn = module.database.db_arn
}

module "api_gateway" {
  source = "./modules/aws-api-gateway"

  domain_name = var.domain_name
  lambda_function_name = module.api_lambda.lambda_function_name
  lambda_arn = module.api_lambda.lamda_arn
  ssl_cert_arn = module.ssl_cert.ssl_cert_arn
}

module "s3_bucket" {
    source = "./modules/aws-s3"

    domain_name = var.domain_name
    html_index = var.html_index
    html_error = var.html_error
    css_file = var.css_file
    js_file = var.js_file
    tags = var.tags
}

module "cloudfront_dist" {
    source = "./modules/aws-cloudfront"

    domain_website_endpoint = module.s3_bucket.domain_website_endpoint
    subdomain_website_endpoint = module.s3_bucket.subdomain_website_endpoint
    domain_bucket_id = module.s3_bucket.domain_bucket_id
    subdomain_bucket_id = module.s3_bucket.subdomain_bucket_id
    ssl_cert_arn = module.ssl_cert.ssl_cert_arn
    html_index = var.html_index
    api_invoke_url = module.api_gateway.api_invocation_url
    domain_name = var.domain_name
    tags = var.tags
}

module "dns_route53" {
    source = "./modules/aws-route53"

    domain_name = var.domain_name
    domain_dist_name = module.cloudfront_dist.domain_dist_domain
    subdomain_dist_name = module.cloudfront_dist.subdomain_dist_domain
    domain_dist_zone_id = module.cloudfront_dist.domain_dist_zone_id
    subdomain_dist_zone_id = module.cloudfront_dist.subdomain_dist_zone_id
}
