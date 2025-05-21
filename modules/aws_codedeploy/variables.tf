variable "aws_region" {
  type = string
  description = "The AWS region to deploy resources into."
}

variable "project_name" {
  type        = string
  description = "A unique name used to identify and tag resources related to this project."
}

variable "deployer_role_arn" {
  type = string
  description = "The ARN of the role"
}

variable "instance_name" {
  type = string
  description = "The name of the EC2 instance"
}