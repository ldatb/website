# Domain bucket
resource "aws_s3_bucket" "domain_bucket" {
    bucket = var.domain_name
    tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "domain_bucket_website" {
    bucket = aws_s3_bucket.domain_bucket.id

    index_document {
        suffix = var.html_index
    }

    error_document {
        key = var.html_error
    }
}

resource "aws_s3_bucket_public_access_block" "domain_bucket_access" {
    bucket = aws_s3_bucket.domain_bucket.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

data "aws_iam_policy_document" "domain_bucket_policy_data" {
    statement {
        sid ="PublicReadGetObject"
        effect = "Allow"
        principals {
            type = "*"
            identifiers = ["*"]

        }
        actions = [
            "s3:GetObject",
        ]
        resources = [
            "${aws_s3_bucket.domain_bucket.arn}/*"
        ]
    }
}

resource "aws_s3_bucket_policy" "domain_bucket_policy" {
    bucket = aws_s3_bucket.domain_bucket.id
    policy = data.aws_iam_policy_document.domain_bucket_policy_data.json
}


# Website files
resource "aws_s3_object" "index_page" {
    bucket = aws_s3_bucket.domain_bucket.id
    key = var.html_index
    source = "${path.module}/../../../webpage/${var.html_index}"
    content_type = "text/html"
}

resource "aws_s3_object" "error_page" {
    bucket = aws_s3_bucket.domain_bucket.id
    key = var.html_error
    source = "${path.module}/../../../webpage/${var.html_error}"
    content_type = "text/html"
}

resource "aws_s3_object" "css_file" {
    bucket = aws_s3_bucket.domain_bucket.id
    key = var.css_file
    source = "${path.module}/../../../webpage/${var.css_file}"
    content_type = "text/css"
}


# Subdomain bucket
resource "aws_s3_bucket" "subdomain_bucket" {
    bucket = "www.${var.domain_name}"
    tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "subdomain_bucket_website" {
    bucket = aws_s3_bucket.subdomain_bucket.id

    redirect_all_requests_to {
        host_name = var.domain_name
        protocol = "http"
    }
}
