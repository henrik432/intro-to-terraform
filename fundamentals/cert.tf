variable "env" {
  type = "string"
  default = "dev"
}

locals {
  domain_name = "${var.env}.example.com"
  sub_domain = "my"
}

data "aws_route53_zone" "route53_zone" {
  name = local.domain_name
}

resource "aws_acm_certificate" "cert" {
  domain_name = "${local.sub_domain}.${local.domain_name}"
  validation_method = "DNS"
  tags = {
    Environment = var.env
  }
}

resource "aws_route53_record" "validation_record" {
  name = aws_acm_certificate.cert.domain_validation_options[0].resource_record_name
  type = aws_acm_certificate.cert.domain_validation_options[0].resource_record_type
  zone_id = data.aws_route53_zone.route53_zone.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[0].resource_record_value
  ]
  ttl = 60
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [
    aws_route53_record.validation_record.fqdn
  ]
}

output "cert_arn" {
  value = aws_acm_certificate.cert.arn
}
