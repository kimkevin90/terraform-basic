# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  # ssh & http 보안그룹 설정
  vpc_security_group_ids = [ aws_security_group.vpc-terraform-ssh.id, aws_security_group.vpc-terraform-web.id   ]
  # 생성한 EC2 Name 설정
  tags = {
    "Name" = "EC2 Demo 2"
  }
}
