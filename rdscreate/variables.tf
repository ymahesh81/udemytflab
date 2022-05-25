variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "db_username" {
  description = "AWS RDS DB login name"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "AWS DB Password"
  type        = string
  sensitive   = true
}