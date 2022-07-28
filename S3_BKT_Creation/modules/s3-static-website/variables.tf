variable "aws_region" {
    description = "Region in which AWS resource to be created"
    type = string
    default = "ap-south-1"
  
}

variable "s3_bucketname" {
    description = "Provide S3 Bucket Name"
    type = string
    default = "s3website-04-1990"
  
}

variable "s3_tags" {
  description = "Provide the tags to S3"
  type = map(string)
  default = {
    Terraform = "true"
    Environment = "dev"
    
  }
}