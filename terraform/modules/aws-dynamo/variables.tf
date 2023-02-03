variable "tags" {
    description = "Tags"
    type = map(string)
    default = {}
}

variable "db_name" {
    description = "The name of the database"
    type = string
    default = "db"
}
