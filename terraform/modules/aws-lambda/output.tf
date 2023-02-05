output "lambda_function_name" {
    value = aws_lambda_function.lambda_visitors.function_name
    description = "The name of the lambda function"
}

output "lamda_arn" {
    value = aws_lambda_function.lambda_visitors.invoke_arn
    description = "The invoke ARN value for the lambda function"
}
