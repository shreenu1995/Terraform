output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = aws_instance.jmeter.*.id
}
output "private_ip" {
  description = "IDs of EC2 instances"
  value       = aws_instance.jmeter.*.private_ip
}