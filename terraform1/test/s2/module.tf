module "vpc" {
source = "../../vpc/vpc/"
  cidr_vpc          = var.cidr_vpc
}

 
module "subnet" {
 source = "../../vpc/subnets/"
  public_subnet_cidr_blocks   = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  eip_id = module.eip.eip_id
 
}

module "eip" {
 source = "../../vpc/eip/"
 vpc_id = module.vpc.vpc_id
 internet_gateway_id = module.vpc.internet_gateway_id
}

module "ec2_instances" {
  source = "../../Ec2/"

  instance_count     = var.instance_count
  instance_type      = var.ec2_instance_type
  subnet_ids         = module.subnet.private_subnet_id[*]
  
}

/* module "nat-gateway" {
  source = "../../vpc/nat-gateway/"
  eip_id = module.eip.eip_id
  public_subnet_id = module.subnet.public_subnet_id
  internet_gateway_id = module.vpc.internet_gateway_id
} */
/* module "routetables" {
  source = "../../vpc/routetable/"
  vpc_id = module.vpc.vpc_id
 # environment_tag = var.environment_tag
  #public_subnet_id      = module.subnet.public_subnet_id
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
 # nat_id = module.nat-gateway.nat_id
 # private_subnet_id = module.subnet.private_subnet_id
  
}
 */

  #instance_type        = var.instance_type
  #access_key           = var.access_key
  #secret_key           = var.secret_key
 #region               = var.region
 #instance_ami         = var.instance_ami
