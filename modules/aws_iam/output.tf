output "codedeploy_ec2_role_arn" {
  value = aws_iam_role.codedeploy_service_role.arn
}

output "codedeploy_ec2_profile_name" {
  value = aws_iam_instance_profile.instance_profile.name
}