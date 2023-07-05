output "ec2_instance_publicip" {
  description = "Public IP"
  value       = module.ec2_instance.public_ip
}

output "ec2_instance_publicdns" {
  description = "Public DNS assigned to EC2"
  value       = module.ec2_instance.public_dns
}