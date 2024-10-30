resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-internet-gateway", var.project_name)
  }
}