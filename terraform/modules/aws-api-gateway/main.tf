resource "aws_api_gateway_rest_api" "api_gateway" {
    name = "api.${var.domain_name}"
    endpoint_configuration {
        types = ["REGIONAL"]
    }
}

resource "aws_api_gateway_resource" "api_v1" {
    rest_api_id = aws_api_gateway_rest_api.api_gateway.id

    parent_id = aws_api_gateway_rest_api.api_gateway.root_resource_id
    path_part = "v1"
}

resource "aws_api_gateway_resource" "api_visitors" {
    rest_api_id = aws_api_gateway_rest_api.api_gateway.id

    parent_id = aws_api_gateway_resource.api_v1.id
    path_part = "visitors"
}

resource "aws_api_gateway_method" "api_visitors_method" {
    rest_api_id = aws_api_gateway_rest_api.api_gateway.id

    resource_id = aws_api_gateway_resource.api_visitors.id
    http_method = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "api_lambda" {
    rest_api_id = aws_api_gateway_rest_api.api_gateway.id

    resource_id = aws_api_gateway_resource.api_visitors.id
    http_method = aws_api_gateway_method.api_visitors_method.http_method

    integration_http_method = "POST"
    type = "AWS"
    uri = var.lambda_arn
}

resource "aws_api_gateway_method_response" "response_200" {
    rest_api_id = aws_api_gateway_rest_api.api_gateway.id
    resource_id = aws_api_gateway_resource.api_visitors.id
    http_method = aws_api_gateway_method.api_visitors_method.http_method
    status_code = "200"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Headers" = true,
        "method.response.header.Access-Control-Allow-Methods" = true,
        "method.response.header.Access-Control-Allow-Origin" = true
    }
}

resource "aws_api_gateway_integration_response" "api_lambda_response" {
    rest_api_id = aws_api_gateway_rest_api.api_gateway.id
    resource_id = aws_api_gateway_resource.api_visitors.id
    http_method = aws_api_gateway_method.api_visitors_method.http_method
    status_code = aws_api_gateway_method_response.response_200.status_code

    response_parameters = {
        "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,Authorization'",
        "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS'",
        "method.response.header.Access-Control-Allow-Origin" = "'*'"
    }

    depends_on = [
        aws_api_gateway_integration.api_lambda
    ]
}

resource "aws_lambda_permission" "lambda_permission" {
    function_name = var.lambda_function_name

    statement_id = "AllowLambdaAPIInvoke"
    action = "lambda:InvokeFunction"
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_api_gateway_rest_api.api_gateway.execution_arn}/*/*/*"
}

resource "aws_api_gateway_deployment" "api_deployment" {
    rest_api_id = aws_api_gateway_rest_api.api_gateway.id
    
    stage_name = "api"
    depends_on = [
        aws_api_gateway_integration.api_lambda,
        aws_api_gateway_integration_response.api_lambda_response
    ]
}
