resource "aws_route53_record" "web_server_record" {
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300

  # Reference the public IP from the ec2 module
  # records = [module.ec2.public_ip]
  records = [var.ec2_public_ip]

  # depends_on = [module.ec2]
}

