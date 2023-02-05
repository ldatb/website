output "api_invocation_url" {
    value = aws_api_gateway_deployment.api_v1_deployment.invoke_url
    description = "The invocation URL for the API"
}
