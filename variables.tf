# Input Variables
variable "aws_region" {
  description = "Region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

/* variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0e0ff68cb8e9a188a"
  validation {
    condition     = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0, 4) == "ami-"
    error_message = "The ec2_ami_id value must be valid AMI id starting with ami."
  }
} */

# variable "ec2_instance_count" {
#   description = "Instance Count"
#   type        = number
#   default     = 1
# }

 variable "ec2_instance_type" {
  description = "Enter the instance type"
  type = string
  # type = list(string)
  # default = ["t2.large", "t2.micro", "t2.small"]
  default = "t2.micro"

}

# variable "ec2_instance_tags" {
#   description = "Tag names for the EC2 instance"
#   type        = map(string)
#   default = {
#     "Name" = "webapp"
#     "ENV"  = "Dev"
#   }

# } 

# variable "ec2_instance_type" {
#   description = "Select the instance type based on size of application"
#   type        = map(string)
#   default = {
#     "small-app"  = "t2.micro"
#     "medium-app" = "t2.small"
#     "big-app"    = "t2.medium"
#   }

# }

/* variable "app_name" {
  description = "Enter the application name"
  type = string

}

variable "env_name" {
  description = "Enter the environment name"
  type = string
} */