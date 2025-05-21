
data "aws_iam_policy_document" "codedeploy_policy_document" {
  statement {
    sid = ""
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }  
}

resource "aws_iam_role_policy_attachment" "codeploy_policy_attachment" {
  role = aws_iam_role.codedeploy_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

resource "aws_iam_role" "codedeploy_service_role" {
  name = "${title(var.project_name)}CodeDeployServiceRole"
  assume_role_policy = data.aws_iam_policy_document.codedeploy_policy_document.json
}

data "aws_iam_policy_document" "ec2_policy_document" {
  statement {
    sid = ""
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.ec2_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}

resource "aws_iam_role" "ec2_service_role" {
  name               = "${title(var.project_name)}Ec2ServiceRole"
  assume_role_policy = data.aws_iam_policy_document.ec2_policy_document.json
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.project_name}CodeDeployEC2InstanceProfile"
  role = aws_iam_role.ec2_service_role.name
}