variable "domain_name" {
    description = "The name to host the website"
    type = string
    default = "bucket.com"
}

variable "domain_bucket_zone_id" {
    description = "The zone id for the domain bucket"
    type = string
    default = "domain-bucket-zone-id"
}

variable "subdomain_bucket_zone_id" {
    description = "The zone id for the subdomain bucket"
    type = string
    default = "subdomain-bucket-zone-id"
}

variable "domain_website_domain" {
    description = "The domain to the domain bucket"
    type = string
    default = "domain-bucket"
}

variable "subdomain_website_domain" {
    description = "The endpoint to the subdomain bucket"
    type = string
    default = "subdomain-bucket"
}
