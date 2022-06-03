#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo yum update -y
sudo yum install -y httpd
sudo systemctl httpd start  
sudo systemctl enable httpd
#echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" | sudo tee /var/www/html/index.html
echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in ap-south-1 Region</h1>" > /var/www/html/index.html
sudo systemctl restart httpd