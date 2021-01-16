provider "aws" {
    region = "eu-central-1"
  
}

terraform {
   backend "s3" {
    bucket = "joseph-terraform"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }  
}