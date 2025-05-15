resource "aws_instance" "app_instance" {
  ami = var.ami
  instance_type = var.instance_type

  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups_ids

  root_block_device {
    volume_size = 40
  }

  depends_on = [
    var.internet_gateway_id
  ]

  tags = {
    Name = "${var.project_name}-instance"
  }
}