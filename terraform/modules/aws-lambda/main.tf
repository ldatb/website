data "aws_iam_policy_document" "lambda_basic_policy_doc" {
    statement {
        actions = ["sts:AssumeRole"]
        effect = "Allow"
        principals {
            type = "Service"
            identifiers = ["lambda.amazonaws.com"]
        }
    }
}

resource "aws_iam_role" "lambda_iam" {
    name = "${var.domain_name}-lambda-iam"
    assume_role_policy = data.aws_iam_policy_document.lambda_basic_policy_doc.json
}

resource "aws_iam_policy" "lamda_dynamo_policy" {
    name = "${var.domain_name}-lambda-to-dynamodb"
    description = "Policy so Lambda function can communicate with DynamoDB"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = [
                    "dynamodb:DeleteItem",
                    "dynamodb:GetItem",
                    "dynamodb:PutItem",
                    "dynamodb:Scan",
                    "dynamodb:UpdateItem"         
                ]
                Resource = "${var.db_arn}"
            },
        ]
    })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
    role = aws_iam_role.lambda_iam.name
    policy_arn = aws_iam_policy.lamda_dynamo_policy.arn
}

resource "aws_lambda_function" "lambda_visitors" {
    function_name = "${var.domain_name}-handler"

    filename = "${path.module}/visitors.zip"
    handler = "index.handler"
    runtime = "nodejs18.x"

    role = aws_iam_role.lambda_iam.arn

    environment {
        variables = {
            DB_NAME = var.db_name
        }
    }
}
