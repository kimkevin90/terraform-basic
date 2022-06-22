# # 여러 인스턴스 생성 시 (count 적용) loop를 통해 output 출력

# # Output - For Loop with List
# output "for_output_list" {
#   description = "For Loop with List"
#   value = [for instance in aws_instance.myec2vm: instance.public_dns]
# }

# # Output - For Loop with Map
# # id는 key pulic_dns는 value
# output "for_output_map1" {
#   description = "For Loop with Map"
#   value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
# }

# # Output - For Loop with Map Advanced
# # c ~ count
# output "for_output_map2" {
#   description = "For Loop with Map - Advanced"
#   value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
# }

# # Output Latest Generalized Splat Operator - Returns the List
# output "latest_splat_instance_publicdns" {
#   description = "Generalized latest Splat Operator"
#   value = aws_instance.myec2vm[*].public_dns
# }

# EC2 Instance Public IP with TOSET
# TOSET에는 splat 적용 불가!!
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  #value = aws_instance.myec2vm.*.public_ip   # Legacy Splat
  #value = aws_instance.myec2vm[*].public_ip  # Latest Splat
  value = toset([for instance in aws_instance.myec2vm: instance.public_ip])
}

# EC2 Instance Public DNS with TOSET
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value = aws_instance.myec2vm[*].public_dns  # Legacy Splat
  #value = aws_instance.myec2vm[*].public_dns  # Latest Splat
  value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
}

# EC2 Instance Public DNS with TOMAP
output "instance_publicdns2" {
  value = tomap({for az, instance in aws_instance.myec2vm: az => instance.public_dns})
}
