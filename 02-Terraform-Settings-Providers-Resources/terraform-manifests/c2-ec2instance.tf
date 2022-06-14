# Resource Block : EC2 Instance
/*
aws_instance -> Resource Type
myec2localname -> Resource Local Name : 같은 테라폼 모듈에서 참조되며 unique 해야함
*/
resource "aws_instance" "myec2localname" {
  ami = "ami-0195322846474ddb9"
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    # 인스턴스 명 반영
    "Name" = "EC2 Demo"
  }
}