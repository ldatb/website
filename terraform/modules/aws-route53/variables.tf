variable "domain_name" {
    description = "The name to host the website"
    type = string
    default = "bucket.com"
}

variable "domain_dist_name" {
    description = "The endpoint to the domain distribution"
    type = string
    default = "domain-bucket"
}

variable "subdomain_dist_name" {
    description = "The endpoint to the subdomain distribution"
    type = string
    default = "subdomain-bucket"
}

variable "domain_dist_zone_id" {
    description = "The zone id for the domain distribution"
    type = string
    default = "domain-bucket-zone-id"
}

variable "subdomain_dist_zone_id" {
    description = "The zone id for the subdomain distribution"
    type = string
    default = "subdomain-bucket-zone-id"
}
