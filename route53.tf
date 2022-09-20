resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.appstellar-training.zone_id
  name    = "assignment.appstellar.training"
  type    = "A"
  ttl     = 300
  records = ["8.8.8.8"]
}
