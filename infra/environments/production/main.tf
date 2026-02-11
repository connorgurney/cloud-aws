# Terraform configuration
terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "connorgurney-iac-tf"
    key    = "cloud-aws"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


# AWS configuration
provider "aws" {
  region = "eu-west-2"
}
