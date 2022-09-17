resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(
    {
      "Name" : "main-vpc-${terraform.workspace}"
  }, var.default_tags)
}

data "aws_availability_zones" "available" {
  state = "available"
}