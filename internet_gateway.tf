resource "aws_internet_gateway" "gw" {
  tags = {
    Name = format("%s-internet-gateway", var.project_name)
  }
}

resource "aws_default_route_table" "rt" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = format("%s-route-table", var.project_name)
  }
}