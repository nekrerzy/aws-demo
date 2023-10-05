# Rds mysql for project A
#create a RDS Database Instance
resource "aws_db_instance" "myi-rds-nstance" {
  engine               = "mysql"
  identifier           = "project-a-rdsinstance"
  allocated_storage    =  20
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "myrdsuser"
  password             = "myrdspassword"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.projectA-rds-sg.id}"]
  db_subnet_group_name = aws_db_subnet_group.project-a-rds-subnet-group.id
  skip_final_snapshot  = true
  publicly_accessible =  false
  multi_az = true
  apply_immediately = true
  tags = {
    Name = "project-a-rdsinstance"
  }
}