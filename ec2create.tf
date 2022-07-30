resource "aws_instance" "newec2" {
  ami               = data.aws_ami.amznlinux.id
  instance_type     = var.ec2_instance_type
  #instance_type     = var.ec2_instance_type["small-app"]
  #count = terraform.workspace == "default" ? 2 : 1
  availability_zone = "ap-south-1a"
  count = var.ec2_instance_count
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp2"
  }
  key_name = "udemytflab"
  
  vpc_security_group_ids = [aws_security_group.SSH-SG.id, aws_security_group.HTTP-SG.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    EOF
  

tags = {
  "Name"= "vm-${terraform.workspace}-${count.index}"
}

}

# tags = var.ec2_instance_tags
# tags = {
#   "Name" = "tfinstance"
# }
#   lifecycle {
#     create_before_destroy = true
#   }
#}

