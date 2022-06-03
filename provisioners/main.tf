terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
      
    }

    null = {
      source = "hashicorp/null"
      version = "~> 3.0.0"
    }
    
    time = {
      source = "hashicorp/time"
      version = "~> 0.6.0"
    }     
  }
  
}

provider "aws" {
  region = var.aws_region
}