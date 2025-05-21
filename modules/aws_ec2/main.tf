data "cloudinit_config" "main_config" {
  gzip = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.root}/cloudinit/run-on-boot.sh", {
      "PROJECT_NAME": var.project_name,
      "AWS_REGION": var.aws_region,
    })
  }
}

resource "aws_instance" "ec2_instance" {
  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile = var.instance_profile

  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups_ids
  associate_public_ip_address = true

  user_data_replace_on_change = true
  user_data = data.cloudinit_config.main_config.rendered

  depends_on = [
    var.internet_gateway_id
  ]

  tags = {
    Name = "${var.project_name}-instance"
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"
  instance = aws_instance.ec2_instance.id

  depends_on = [
    var.internet_gateway_id
  ]

  tags = {
    Name = "${var.project_name}-eip"
  }
}