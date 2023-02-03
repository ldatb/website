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

variable "db_name" {
    description = "The name for the DynamoDB"
    type = string
    default = "db"
}

variable "db_arn" {
    description = "The ARN for the DynamoDB"
    type = string
    default = "arn"
}
