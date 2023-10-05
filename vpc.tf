#vpc for ProjectA
resource "aws_vpc" "projectA-vpc" {
    cidr_block = "172.16.0.0/22"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "ProjectA-vpc"
    }
}

#public subnet for ProjectA
resource "aws_subnet" "projectA-public-subnet" {
    vpc_id = aws_vpc.projectA-vpc.id
    cidr_block = "172.16.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "ProjectA-public-subnet"
    }
}

#private subnet for ProjectA
resource "aws_subnet" "projectA-private-subnet" {
    vpc_id = aws_vpc.projectA-vpc.id
    cidr_block = "172.16.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = "ProjectA-private-subnet"
    }
}

#private subnet2 for ProjectA
resource "aws_subnet" "projectA-private-subnet2" {
    vpc_id = aws_vpc.projectA-vpc.id
    cidr_block = "172.16.3.0/24"
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = false
    tags = {
        Name = "ProjectA-private-subnet"
    }
}

resource "aws_db_subnet_group" "project-a-rds-subnet-group" {
  name        = "project-a-rds-subnet_group"
  description = "Project A RDS group of subnets"
  subnet_ids  = ["${aws_subnet.projectA-private-subnet.id}", "${aws_subnet.projectA-private-subnet2.id}"]
}

resource "aws_internet_gateway" "projectA-igw" {
    vpc_id = aws_vpc.projectA-vpc.id
    tags = {
        Name = "ProjectA-igw"
    }
}