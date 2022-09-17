resource "aws_vpc_endpoint" "vpce-s3" {
  vpc_id              = aws_vpc.main_vpc.id
  vpc_endpoint_type   = "Gateway"
  service_name        = "com.amazonaws.${var.aws_region}.s3"
  route_table_ids     = [aws_route_table.ecsroute.id]
}

resource "aws_vpc_endpoint" "vpce-ecr-api" {
  vpc_id              = aws_vpc.main_vpc.id
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${var.aws_region}.ecr.api"
  security_group_ids  = [aws_security_group.ecssg.id]
  subnet_ids = [ "${aws_subnet.ecssubnets.0.id}", "${aws_subnet.ecssubnets.1.id}" ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "vpce-ecr-dkr" {
  vpc_id              = aws_vpc.main_vpc.id
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${var.aws_region}.ecr.dkr"
  security_group_ids  = [aws_security_group.ecssg.id]
  subnet_ids = [ "${aws_subnet.ecssubnets.0.id}", "${aws_subnet.ecssubnets.1.id}" ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "vpce-logs" {
  vpc_id              = aws_vpc.main_vpc.id
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${var.aws_region}.logs"
  security_group_ids  = [aws_security_group.ecssg.id]
  subnet_ids = [ "${aws_subnet.ecssubnets.0.id}", "${aws_subnet.ecssubnets.1.id}" ]
  private_dns_enabled = true
}