
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "spot-instance-usingtf"



  create_spot_instance = true
  spot_price           = "0.60"
  spot_type            = "persistent"

  ami           = data.aws_ami.amznlinux.id
  instance_type = "t2.micro"
  key_name      = "clouddirty"
  monitoring    = true
  # vpc_security_group_ids = ["sg-08a40a53741fdf5a6"]
  # subnet_id              = "subnet-07de5f7ebfb91c1d0"
  #availability_zone = "ap-south-1a"
  user_data = <<-EOF
    #!/bin/bash
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    EOF

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}