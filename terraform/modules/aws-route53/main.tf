data "aws_route53_zone" "registar_zone" {
    name = var.domain_name
    private_zone = false
}

resource "aws_route53_record" "domain_a_record" {
    zone_id = data.aws_route53_zone.registar_zone.zone_id

    name = var.domain_name
    type = "A"

    alias {
        name = var.domain_website_endpoint
        zone_id = var.domain_bucket_zone_id
        evaluate_target_health = false
    }
}

resource "aws_route53_record" "subdomain_a_record" {
    zone_id = data.aws_route53_zone.registar_zone.zone_id

    name = "www.${var.domain_name}"
    type = "A"

    alias {
        name = var.subdomain_website_endpoint
        zone_id = var.subdomain_bucket_zone_id
        evaluate_target_health = false
    }
}
