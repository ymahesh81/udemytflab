variable "bucket_name" {
  description = "Name of s3 bucket"
  type = string
}

variable "tags" {
  description = "Tags to set bucket"
  type = map(string)
  default = {
    
  }
}