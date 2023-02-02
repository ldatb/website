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
