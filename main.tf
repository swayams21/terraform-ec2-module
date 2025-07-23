terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "dev" {
  source        = "./modules/ec2"
  ami_id        = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.micro"
  tags = {
    Name = "test"
  }
}


module "prod" {
  source        = "./modules/ec2"
  ami_id        = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t2.medium"
  tags = {
    Name = "dev"
  }
}  
