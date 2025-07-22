resource "aws_security_group" "builder_sg" {
    name        = "tal_builder-sg"
    vpc_id      = "vpc-044604d0bfb707142"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.builder_sg.id
  cidr_ipv4         = "54.202.235.116/32"          #change to my own machine ip when needed - run curl ifconfig.me
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"  
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.builder_sg.id
  cidr_ipv4         = "54.202.235.116/32"          #change to my own machine ip when needed - run curl ifconfig.me
  from_port         = 5001
  to_port           = 5001
  ip_protocol       = "tcp"  
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_outbound" {
  security_group_id = aws_security_group.builder_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
