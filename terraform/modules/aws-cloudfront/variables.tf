variable "tags" {
    description = "Tags"
    type = map(string)
    default = {}
}

variable "domain_name" {
    description = "The S3 Bucket name to host the website"
    type = string
    default = "ldatb.com"
}

variable "domain_bucket_id" {
    description = "The domain bucket id"
    type = string
    default = "domain.id"
}

variable "subdomain_bucket_id" {
    description = "The domain bucket id"
    type = string
    default = "subdomain.id"
}

variable "domain_website_endpoint" {
    description = "The domain's website endpoint"
    type = string
    default = "domain.regional"
}

variable "subdomain_website_endpoint" {
    description = "The regional domain of the subdomain endpoint"
    type = string
    default = "subdomain.regional"
}

variable "api_invoke_url" {
    description = "The invoke URL for the API"
    type = string
    default = "api.regional"
}

variable "html_index" {
    description = "The HTML Index file"
    type = string
    default = "index.html"
}

variable "ssl_cert_arn" {
    description = "SSL Cert ARN"
    type = string
    default = "ssl"
}
