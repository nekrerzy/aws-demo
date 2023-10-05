
output "ec2_instance_id" {
  value = aws_instance.projectA.public_ip
}

output "rds_instance_address" {
  value = aws_db_instance.myi-rds-nstance.address
}


data "aws_instance" "projectA" {
  instance_id = aws_instance.projectA.id
}

output "user_data" {
    value = data.aws_instance.projectA.user_data

}

output "route53_record" {
    value = aws_route53_record.projecta.name
}