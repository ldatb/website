resource "aws_dynamodb_table" "db_table" {
    name = "db-${var.db_name}"

    billing_mode = "PAY_PER_REQUEST"
    hash_key = "visitors"

    attribute {
        name = "visitors"
        type = "N"
    }

    tags = var.tags
}

resource "aws_dynamodb_table_item" "db_table_item" {
    table_name = aws_dynamodb_table.db_table.name
    hash_key = aws_dynamodb_table.db_table.hash_key

    item = <<EOF
    {
        "visitors": {"N": "0"}
    }
    EOF
}
