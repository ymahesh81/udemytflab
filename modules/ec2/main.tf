terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "ec2-full-access"
  assume_role {
    role_arn     = "arn:aws:iam::789303332549:role/ec2fullaccess-iacdeploy"
    session_name = "iacassumerole-test"
  }
}
