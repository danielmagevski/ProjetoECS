
data "aws_route53_zone" "selected" {
  name         = "labdev.cloud."
  private_zone = false
}

resource "aws_route53_record" "my_alb_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "app.labdev.cloud"
  type    = "A"

  alias {
    name                   = aws_alb.my_alb.dns_name
    zone_id                = aws_alb.my_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "my_cert" {
  domain_name       = "app.labdev.cloud"
  validation_method = "DNS"

  tags = {
    Name = "My Certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.my_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  name    = each.value.name
  type    = each.value.type
  zone_id = data.aws_route53_zone.selected.zone_id
  records = [each.value.record]
  ttl     = 60
}


