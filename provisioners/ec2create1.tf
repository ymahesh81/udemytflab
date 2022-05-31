resource "aws_instance" "my_ec2_vm" {
    instance_type = var.instance_type
    key_name = var.ec2_key
    ami = data.aws_ami.amznlinux.id
    availability_zone = var.availability_zone
    user_data = file("apache_install.sh") 
    #security_groups = [ aws_security_group.http_port.id , aws_security_group.ssh_port.id ]
    vpc_security_group_ids = [ aws_security_group.http_port.id , aws_security_group.ssh_port.id ]
  

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("udemytflab.pem")
  }

  provisioner "file" {
      source = "app/app1-file1.html"
      destination = "/var/www/html/index.html"
      on_failure = continue
    
  }
}

resource "aws_security_group" "http_port" {
    description = "To access HTTP"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "ssh_port" {
    description = "To SSH Linux Server"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
