output "codedeploy_service_role_arn" {
  value = aws_iam_role.codedeploy_service_role.arn
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}