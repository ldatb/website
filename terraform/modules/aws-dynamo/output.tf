output "db_name" {
    value = aws_dynamodb_table.db_table.name
    description = "The name for the DynamoDB"
}

output "db_arn" {
    value = aws_dynamodb_table.db_table.arn
    description = "The ARN for the DynamoDB"
}
