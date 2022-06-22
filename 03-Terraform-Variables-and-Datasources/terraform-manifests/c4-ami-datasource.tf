# Get latest AMI ID for Amazon Linux2 OS
# datasource는 data.점으로 참조 가능 data.aws_ami.amzlinux2.id (id는) 테라폼 attribute
data "aws_ami" "amzlinux2" {
  # 최신 AMI 사용
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    # AMI NAME
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}