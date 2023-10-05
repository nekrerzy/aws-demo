#internet route table for public subnet
resource "aws_route_table" "projectA-public-route-table" {
    vpc_id = aws_vpc.projectA-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.projectA-igw.id
    }
    tags = {
        Name = "ProjectA-public-route-table"
    }
}

resource "aws_route_table_association" "projectA-public-route-table-association" {
    subnet_id = aws_subnet.projectA-public-subnet.id
    route_table_id = aws_route_table.projectA-public-route-table.id
}
  
