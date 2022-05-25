output "ec2_public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.newec2.*.public_ip
}

output "ec2_private_ip" {
  description = "Ec2 DNS name"
  value       = aws_instance.newec2.*.private_ip
  sensitive   = true
}

# output "ec2_security_group" {
#   description = "List security groups"
#   value       = aws_instance.newec2.security_groups
# }

# output "ec2_http_url" {
#   description = "DNS url to access app"
#   value       = "http://${aws_instance.newec2.public_dns}"
# }

# output "s3_name" {
#   description = "S3 bucket created"
#   value = aws_s3_bucket.tfs3bucket00000
# }