# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ap-northeast-2"
}

variable "aws_profile" {
  description = "Profile for AWS Account"
  type = string
  default = "js"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type = string
  default = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-key"
}


