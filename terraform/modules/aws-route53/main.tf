data "aws_route53_zone" "registar_zone" {
    name = var.domain_name
    private_zone = false
}

resource "aws_route53_record" "domain_a_record" {
    zone_id = data.aws_route53_zone.registar_zone.zone_id

    name = var.domain_name
    type = "A"

    alias {
        name = var.domain_dist_name
        zone_id = var.domain_dist_zone_id
        evaluate_target_health = false
    }
}

resource "aws_route53_record" "subdomain_a_record" {
    zone_id = data.aws_route53_zone.registar_zone.zone_id

    name = "www.${var.domain_name}"
    type = "A"

    alias {
        name = var.subdomain_dist_name
        zone_id = var.subdomain_dist_zone_id
        evaluate_target_health = false
    }
}

resource "aws_route53_record" "api_a_record" {
    zone_id = data.aws_route53_zone.registar_zone.zone_id

    name = "api.${var.domain_name}"
    type = "A"

    alias {
        name = var.api_dist_name
        zone_id = var.api_dist_zone_id
        evaluate_target_health = false
    }
}
