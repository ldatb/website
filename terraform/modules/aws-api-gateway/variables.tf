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

variable "lambda_function_name" {
    description = "The name of the lambda function"
    type = string
    default = "function"
}

variable "lambda_arn" {
    description = "The ARN for the lambda function"
    type = string
    default = "arn"
}

variable "ssl_cert_arn" {
    description = "SSL Cert ARN"
    type = string
    default = "ssl"
}
