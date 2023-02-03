output "lamda_arn" {
    value = aws_lambda_function.lambda_visitors.invoke_arn
    description = "The invoke ARN value for the lambda function"
}
