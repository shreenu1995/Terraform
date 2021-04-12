variable "public_subnet_cidr_blocks" {
    description = "this is public subnet"
    type = list
    
}

variable "private_subnet_cidr_blocks" {
    description = "this is private subnet"
    type = list
}

#variable "availability_zone" {
    #description = "this is for AZ"
    #type = string
#}

variable "vpc_id" {
    description = "take the value"
}
#variable "environment_tag" {
 #   description = "this is the environment name"
  #  type = string
#}
data "aws_availability_zones" "available" {}
variable "internet_gateway_id" {}
variable "eip_id" {}