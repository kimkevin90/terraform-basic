# terraform registry vpc : https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.1"
  
  name = "vpd-dev"
  cidr = "10.0.0.0/16" 

  azs                 = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]

  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]
  # database subnet은 외부와 통신 안하므로 아래 조건 적용 x
  # create_database_internet_gateway_route = false
  # create_database_nat_gateway_route = false

  # NAT GateWay
  # cross az traffic 50000넘을 시 nat gateway 추가하기
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Name = "public-subnets"
  }

  private_subnet_tags = {
    Name = "private-subnets"
  }

  database_subnet_tags = {
    Name = "database-subnets"
  }

  tags = {
    Owner = "js"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
}