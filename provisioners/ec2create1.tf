resource "aws_instance" "my_ec2_vm" {
    instance_type = var.instance_type
    key_name = var.ec2_key
    ami = data.aws_ami.amznlinux.id
    availability_zone = var.availability_zone
    user_data = file("apache_install.sh") 
    #security_groups = [ aws_security_group.http_port.id , aws_security_group.ssh_port.id ]
    vpc_security_group_ids = [ aws_security_group.http_port.id , aws_security_group.ssh_port.id ]

}

resource "time_sleep" "wait_90_seconds" {
  depends_on = [ aws_instance.my_ec2_vm  ]
  create_duration = "90s"
}

resource "null_resource" "sync_app_static" {
  depends_on = [ time_sleep.wait_90_seconds ]
  triggers = {
    always_update = timestamp()
  }

      

  connection {
    type = "ssh"
    #host = self.public_ip
    host = aws_instance.my_ec2_vm.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("udemytflab.pem")
  }

  provisioner "file" {
      source = "app/app1-file1.html"
      destination = "/tmp/app1-file1.html"
      on_failure = continue
    
  }

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.my_ec2_vm.private_ip} >> privateip.txt"
  #   #working_dir = "provisioners/"
  # }

  provisioner "remote-exec" {
    inline = [
      "sudo cp -r /tmp/app1-file1.html /var/www/html"
    ]
  }
}