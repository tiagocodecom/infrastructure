output "vpc_id" {
  value = aws_vpc.app_vpc.id
}

output "subnet_id" {
  value = aws_subnet.app_subnet.id
}

output "security_group_id" {
  value = aws_security_group.app_sg.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.app_igw.id
}