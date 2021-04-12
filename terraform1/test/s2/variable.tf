variable "cidr_vpc" {
  description = "CIDR block for the VPC"
}
variable "public_subnet_cidr_blocks" {
  description = "CIDR block for the subnet"
}
variable "private_subnet_cidr_blocks" {
  description = "CIDR block for the private subnet"
} 
#variable "internet_gateway_id" {}
#variable "availability_zone" {
  #description = "availability zone to create subnet"
#}
#variable "public_key_path" {
 # description = "Public key path"
  #default = "~/.ssh/id_rsa.pub"
#}
#variable "environment_tag" {
 # description = "Environment tag"
#}

#variable "instance_ami" {
  #description = "AMI for aws EC2 instance"
#}

variable "instance_count" {
  description = ""
}
variable "ec2_instance_type"{
  description = "type for aws EC2 instance"
}
#variable "access_key" {
#	default = ""
#}
#variable "secret_key" {
	#default = ""
#}
#variable "region" {
 # default = ""
#}

