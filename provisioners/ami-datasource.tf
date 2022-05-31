data "aws_ami" "amznlinux" {
    most_recent = true
    owners = [ "amazon" ]
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-gp2"]
          }

    filter {
      name = "root-device-type"
      values = [ "ebs" ]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }
    
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
}