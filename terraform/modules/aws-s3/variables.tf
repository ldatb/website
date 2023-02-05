variable "tags" {
    description = "Tags"
    type = map(string)
    default = {}
}

variable "domain_name" {
    description = "The name to host the website"
    type = string
    default = "bucket.com"
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
