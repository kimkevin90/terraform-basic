# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "js" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "ap-northeast-2" 
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0195322846474ddb9" # 리소스 번호
  instance_type = "t2.micro"
}

