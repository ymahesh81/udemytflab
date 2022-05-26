terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "mahesh"
}

terraform {
  backend "s3" {
    bucket = "terraformstate04"
    key = "dev/devenv.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-devstate-table"
  }
}
/* provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
  alias   = "aws-southeast-1"
} */
