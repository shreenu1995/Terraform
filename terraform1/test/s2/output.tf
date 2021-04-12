output "public_subnet_id" {
  value = module.subnet.*.public_subnet_id
}

 output "private_subnet_id" {
  value = module.subnet.*.private_subnet_id
} 

output "private_ip" {
  description = "IDs of EC2 instances"
  value       = module.ec2_instances.*.private_ip

}