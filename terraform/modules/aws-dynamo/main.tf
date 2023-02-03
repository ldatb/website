resource "aws_dynamodb_table" "db_table" {
    name = "db-${var.db_name}"

    billing_mode = "PAY_PER_REQUEST"
    hash_key = "key"

    attribute {
        name = "key"
        type = "S"
    }

    tags = var.tags
}

resource "aws_dynamodb_table_item" "db_table_item" {
    table_name = aws_dynamodb_table.db_table.name
    hash_key = aws_dynamodb_table.db_table.hash_key

    item = <<EOF
    {
        "key": {"S": "visitors"},
        "value": {"N": "0"}
    }
    EOF
}
