output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "security_group_ids" {
  value = [
    aws_security_group.web_security_group.id,
    aws_security_group.admin_security_group.id
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gw.id
}