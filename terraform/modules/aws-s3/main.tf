# Domain bucket
resource "aws_s3_bucket" "domain_bucket" {
    bucket = var.domain_name
    tags = var.tags

    provisioner "local-exec" {
        command = "aws s3 cp --recursive ${var.website_dir} s3://${aws_s3_bucket.domain_bucket.id}/"
    }
}

resource "aws_s3_bucket_website_configuration" "domain_bucket_website" {
    bucket = aws_s3_bucket.domain_bucket.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
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
