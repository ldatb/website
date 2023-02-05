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

variable "db_name" {
    description = "The name of the database"
    type = string
    default = "ldatb-com"
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

variable "css_file" {
    description = "The CSS file"
    type = string
    default = "styles.css"
}

variable "js_file" {
    description = "The JavaScript file"
    type = string
    default = "visitors.js"
}
