resource "aws_instance" "newec2" {
  ami               = var.ec2_ami_id
  instance_type     = var.ec2_instance_type[1]
  availability_zone = "ap-south-1a"
  count = var.ec2_instance_count
  key_name = "udemytflab"
  
  vpc_security_group_ids = [aws_security_group.SSH-SG.id, aws_security_group.HTTP-SG.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    EOF

  tags = {
    "Name" = "tfinstance"
  }
#   lifecycle {
#     create_before_destroy = true
#   }
}