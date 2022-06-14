# Terraform Block
terraform {
  required_version = "~> 1.0" # 테라폼 버전 0.14 이거나 이상 0.15, 0.16 etc and < 1.xx
  /*
  terraform aws provider
  LocalName(aws)은 argument로 = {} 사용 필요
  정의한 LocalName과 Provider Block의 provider는 일치해야 한다.
  */
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  } 
}  

# Provider Block
provider "aws" {
  # profile or access key 사용 가능
  profile = "js" 
  region  = "ap-northeast-2" 
}
