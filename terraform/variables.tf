variable "tags" {
    description = "Tags"
    type = map(string)
    default = {
        Project ="ldatb-website"
        Env = "prod"
    }
}

variable "domain_name" {
    description = "The S3 Bucket name to host the website"
    type = string
    default = "ldatb.com"
}

variable "website_dir" {
    description = "Complete dir to the website files"
    type = string
    default = "~/Documents/personal/resume/webpage"
}

variable "html_index" {
    description = "The HTML Index file"
    type = string
    default = "index.html"
}

variable "html_error" {
    description = "The HTML Error 404 file"
    type = string
    default = "error.html"
}
