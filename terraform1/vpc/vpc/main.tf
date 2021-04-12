resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  #tags = {
   # Name = "${var.environment_tag}-VPC"
  #}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  #tags = {
    #Name = "${var.environment_tag}-IGW"
  #}
} 




