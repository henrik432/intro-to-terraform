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

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.0"

  domain_name  = "${local.sub_domain}.${local.domain_name}"
  zone_id      = data.aws_route53_zone.route53_zone.zone_id
}

output "cert_arn" {
  value = module.acm.this_acm_certificate_arn
}
