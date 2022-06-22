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




