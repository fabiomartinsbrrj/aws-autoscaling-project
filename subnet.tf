resource "aws_subnet" "sysops-subnet-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-subnet-1a", var.project_name)
  }
}

resource "aws_subnet" "sysops-subnet-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-subnet-1b", var.project_name)
  }
}

resource "aws_subnet" "sysops-subnet-1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-subnet-1c", var.project_name)
  }
}