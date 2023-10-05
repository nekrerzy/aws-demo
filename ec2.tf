#instancia EC2 for project A  ubuntu t3.micro

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

#key pair for project A
resource "aws_key_pair" "projectA" {
    key_name = "projectA"
    public_key = file("~/.ssh/id_ed25519.pub")
    tags = {
        Name = "projectA"
    }
}

#instance EC2 for project A
resource "aws_instance" "projectA" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = "projectA"
  vpc_security_group_ids = [aws_security_group.projectA-sg.id]
  subnet_id = aws_subnet.projectA-public-subnet.id
  tags = {
    Name = "projectA-EC2"
  }
}