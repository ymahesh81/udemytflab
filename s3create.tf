/* resource "random_pet" "random-name" {
    length = 5
    separator = "-"
  }
  resource "aws_s3_bucket" "s3test" {
      bucket = random_pet.random-name.id
      acl = "public-read"
      } */

# resource "aws_s3_bucket" "s3tfudemy" {
#   # bucket = "my-tf-test-bucket-udemy"

#   for_each = {
#     dev = "my-devtf-bucket"
#     qa = "my-qatf-bucket"
#     prod = "my-prodtf-bucket"
#     stg = "my-stgtf-bucket"       
#   }

#   bucket = "${each.key}-${each.value}"
#   acl = "private"

#   tags = {
#     "Name" = "${each.value}"
#     "Environment" = "${each.key}"
#   }
# }

# locals {
#   bucket-name = "${var.app_name}-${var.env_name}-bucket"
# }

# resource "aws_s3_bucket" "tfs3bucket00000" {
#   bucket = local.bucket-name
#   #acl = "private"
#   #aws_s3_bucket_acl = "private"
#   tags = {
#     Name = local.bucket-name
#     Env = var.env_name
#   }
# }

