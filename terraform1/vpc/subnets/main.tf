resource "aws_subnet" "public_subnet" {
  count                 = length(var.public_subnet_cidr_blocks)
  vpc_id                = var.vpc_id
  cidr_block            = element(var.public_subnet_cidr_blocks,count.index)
  tags = {
    Name = "Pub-Subnet-${count.index+1}"
  }
  availability_zone  = element(data.aws_availability_zones.available.names,count.index)
}
resource "aws_subnet" "private_subnet" {
  count                 = length(var.private_subnet_cidr_blocks)
  vpc_id                = var.vpc_id
  cidr_block            = element(var.private_subnet_cidr_blocks,count.index)
  tags = {
    Name = "Priv-Subnet-${count.index+1}"
  }
  availability_zone  = element(data.aws_availability_zones.available.names,count.index)
  #azs                   = data.aws_availability_zones.available.names
} 

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "Pub-RT"
  }
}

resource "aws_route_table_association" "public_ass" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.public_subnet.*.id,count.index)
  route_table_id = element(aws_route_table.public_rt.*.id,count.index)
}
/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = var.eip_id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
  depends_on    = [var.internet_gateway_id]
  tags = {
    Name        = "nat"
   # Environment = "${var.environment}"
  }
}
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
  #subnet_id      = element(aws_subnet.public_subnet.*.id,count.index)
  /* route {
      cidr_block = "0.0.0.0/0"
      gateway_id = var.internet_gateway_id
  }
 */
  tags = {
    Name = "Priv-RT"
  }
}
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}
resource "aws_route_table_association" "private_ass" {
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.private_subnet.*.id,count.index)
  route_table_id = aws_route_table.private_rt.id
}
 








































#resource "aws_subnet" "subnet_public" {
 # vpc_id = var.vpc_id
  #cidr_block = var.subnet_public_cidr
  #map_public_ip_on_launch = true
  #availability_zone = var.availability_zone
  #tags = {
   # Name = "${var.environment_tag}-Subnet"
  #}
#}

#resource "aws_subnet" "private_subnet" {
 # vpc_id = var.vpc_id
 # cidr_block = var.private_subnets_cidr
  #map_public_ip_on_launch = false
  #availability_zone = var.availability_zone
  #tags = {
   # Name = "${var.environment_tag}-Priv-Subnet"
  #}
#}

  #azs             = data.aws_availability_zones.available.names
  #private_subnets = slice(var.private_subnet_cidr_blocks, 0, var.private_subnet_count)
  #public_subnets  = slice(var.public_subnet_cidr_blocks, 0, var.public_subnet_count)