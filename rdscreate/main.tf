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

/* provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
  alias   = "aws-southeast-1"
} */
