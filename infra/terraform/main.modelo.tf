terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "<AWS_BUCKET_STATE_NAME>"
    key = "site.tfstate"
    region = "<AWS_US_REGION>"
  }
}

provider "aws" {
  region = "<AWS_US_REGION>"
}