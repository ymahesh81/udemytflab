# Input Variables
variable "aws_region" {
  description = "Region to deploy resources"
  type = string
  default = "ap-south-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-0e0ff68cb8e9a188a"
}

variable "ec2_instance_count" {
  description = "Instance Count"
  type = number
  default = 1
}

variable "ec2_instance_type" {
  description = "Enter the instance type"
  # type = string
  type = list(string)
  default = ["t2.large", "t2.micro", "t2.small"]
  # default = "t2.micro"

}