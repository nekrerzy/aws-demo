#record entry for the domain

data "aws_route53_zone" "selected" {
  name         = "myawsexperiments.net"
  private_zone = false
}


resource "aws_route53_record" "projecta" {
    zone_id = data.aws_route53_zone.selected.zone_id
    name    = "projecta"
    type    = "A"
    ttl     = "300"
    records = ["${data.aws_instance.projectA.public_ip}"] 
}