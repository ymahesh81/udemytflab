# ## VPC Creation ##
# resource "aws_vpc" "stg-vpc" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   tags = {
#     "Name" = "stg-vpc"
#   }
# }
# /* resource "aws_vpc" "dev-vpc" {
#   cidr_block = "172.0.0.0/16"
#   tags = {
#     "Name" = "dev-vpc"
#   }
# }

# resource "aws_vpc" "prod-vpc" {
#   cidr_block = "192.0.0.0/16"
#   provider = aws.aws-southeast-1
#   tags = {
#     "Name" = "prod-vpc"
#   }
# } */

# # Subnet Creation
# resource "aws_subnet" "stg-pubsubnet" {
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = "ap-south-1a"
#   vpc_id                  = aws_vpc.stg-vpc.id
#   map_public_ip_on_launch = true
#   tags = {
#     "Name" = "stg-pubsubnet"
#   }
# }

# # IGW Creation
# resource "aws_internet_gateway" "stg-igw" {
#   vpc_id = aws_vpc.stg-vpc.id

# }

# # Route Table Creation
# resource "aws_route_table" "stg-public-routetable" {
#   vpc_id = aws_vpc.stg-vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.stg-igw.id
#   }
# }

# # Create Route Table 
# resource "aws_route" "stg-route" {
#   route_table_id         = aws_route_table.stg-public-routetable.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.stg-igw.id
# }

# # Associate route table with subnet
# resource "aws_route_table_association" "stg-routetable-association" {
#   route_table_id = aws_route_table.stg-public-routetable.id
#   subnet_id      = aws_subnet.stg-pubsubnet.id
  

# }

# resource "aws_security_group" "stg-public-securitygroup" {
#   vpc_id = aws_vpc.stg-vpc.id

#   ingress {
#     description = "Allow port 22"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allow HTTP port 80"
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow outbound ports"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]

#   }
# }

# # Create EC2 resource

# resource "aws_instance" "stg-webserver" {
#   ami                    = "ami-0e0ff68cb8e9a188a"
#   instance_type          = "t2.micro"
#   #availability_zone      = "ap-south-1a"
#   key_name               = "udemytflab"
#   subnet_id              = aws_subnet.stg-pubsubnet.id
#   vpc_security_group_ids = [aws_security_group.stg-public-securitygroup.id]
#   user_data              = file("apache-install.sh")
#   tags = {
#     "Name" = "webserver"
#   }
# }

# # Create EIP
# resource "aws_eip" "stg-eip" {
#   instance = aws_instance.stg-webserver.id
#   vpc      = true
#   depends_on = [
#     aws_internet_gateway.stg-igw
#   ]
# }