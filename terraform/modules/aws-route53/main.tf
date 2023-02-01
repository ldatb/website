resource "aws_route53_zone" "main-zone" {
    name = var.domain_name
    comment = "Domain Zone"
}

resource "aws_route53_record" "domain-a-record" {
    zone_id = aws_route53_zone.main-zone.zone_id

    name = var.domain_name
    type = "A"

    alias {
        name = var.domain_website_domain
        zone_id = var.domain_bucket_zone_id
        evaluate_target_health = false
    }
}

resource "aws_route53_record" "subdomain-a-record" {
    zone_id = aws_route53_zone.main-zone.zone_id

    name = "www.${var.domain_name}"
    type = "A"

    alias {
        name = var.subdomain_website_domain
        zone_id = var.subdomain_bucket_zone_id
        evaluate_target_health = false
    }
}
