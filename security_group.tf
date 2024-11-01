resource "aws_security_group" "dbserver" {
  name        = format("%s-dbserver", var.project_name)
  description = "Acesso a porta do servidor MySQL"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = format("%s-dbserver", var.project_name)
    sysops = "administrator"
  }
}

resource "aws_vpc_security_group_ingress_rule" "dbserver_custom" {
  security_group_id = aws_security_group.dbserver.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}
 
data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

resource "aws_security_group" "webserver" {
  name        = format("%s-webserver", var.project_name)
  description = "Acesso as portas do SSH, HTTP e HTTPS"
  vpc_id      = aws_vpc.main.id
 


  tags = {
    Name = format("%s-webserver", var.project_name)
    sysops = "administrator"
  }
}

resource "aws_security_group_rule" "webserver_custom_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = aws_security_group.webserver.id
}

 resource "aws_vpc_security_group_ingress_rule" "webserver_custom_http" {
  security_group_id = aws_security_group.webserver.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

 resource "aws_vpc_security_group_ingress_rule" "webserver_custom_https" {
  security_group_id = aws_security_group.webserver.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_security_group" "nfs" {
  name        = format("%s-nfs", var.project_name)
  description = "Acesso a porta do servidor nfs"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = format("%s-nfs", var.project_name)
    sysops = "administrator"
  }
}

resource "aws_vpc_security_group_ingress_rule" "nfs_custom" {
  security_group_id = aws_security_group.nfs.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 2049
  ip_protocol       = "tcp"
  to_port           = 2049
}

resource "aws_security_group" "memcached" {
  name        = format("%s-memcached", var.project_name)
  description = "Acesso a porta do servidor memcached"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = format("%s-memcached", var.project_name)
    sysops = "administrator"
  }
}

resource "aws_vpc_security_group_ingress_rule" "memcached_custom" {
  security_group_id = aws_security_group.memcached.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 11211
  ip_protocol       = "tcp"
  to_port           = 11211
}

resource "aws_security_group" "dns" {
  name        = format("%s-dns", var.project_name)
  description = "Resolver nomes do servidor DNS"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = format("%s-dns", var.project_name)
    sysops = "administrator"
  }
}

resource "aws_vpc_security_group_ingress_rule" "dns_custom_udp" {
  security_group_id = aws_security_group.dns.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 53
  ip_protocol       = "udp"
  to_port           = 53
}

resource "aws_vpc_security_group_ingress_rule" "dns_custom_tcp" {
  security_group_id = aws_security_group.dns.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 53
  ip_protocol       = "tcp"
  to_port           = 53
}