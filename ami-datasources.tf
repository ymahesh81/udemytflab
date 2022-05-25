data "aws_ami" "amznlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

#   filter {
#     name = "Platform"
#     values = [ "Amazon Linux" ]
#   }
#   filter {
#     name = "root-device-type"
#     values = [ "ebs" ]
#   }

#   filter {
#     name = "virtualization-type"
#     values = [ "hvm" ]
#   }

  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}