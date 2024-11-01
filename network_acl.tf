resource "aws_default_network_acl" "main" {
    default_network_acl_id = aws_vpc.main.default_network_acl_id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = format("%s-acl", var.project_name)
  }
}
