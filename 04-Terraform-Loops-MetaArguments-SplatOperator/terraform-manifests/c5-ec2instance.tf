# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type = var.instance_type
  # LIST와 Map 사용
  instance_type = var.instance_type_list[1]  # For List
  #nstance_type = var.instance_type_map["prod"]  # For Map
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
  
  # # EC2 생성 갯수
  # count = 2
  # tags = {
  #   # count index는 0부터 시작
  #   # Count-Demo-0 , Count-Demo-1로 ec2 Name 설정
  #   "Name" = "Count-Demo-${count.index}"
  # }
  

  # Create EC2 Instance in all Availabilty Zones of a VPC  
  #  toset 사용시 ["a", "b", 3] => ["a", "b", "3"] 변환
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key  # You can also use each.value because for list items each.key == each.value
  tags = {
    "Name" = "Demo-1-${each.key}"
  }
}