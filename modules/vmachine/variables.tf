variable "project_name" {
  type        = string
  description = "A unique name used to identify and tag resources related to this project"
}

variable "ami" {
  type = string
  description = "The ID of the Amazon Machine Image (AMI) for the EC2 instance."
}

variable "instance_type" {
  type = string
  description = "The type of EC2 instance (e.g., t2.micro)."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where resources will be deployed"
}

variable "subnet_id" {
  type = string
  description = "The ID of the subnet for the EC2 instance."
}

variable "security_groups_ids" {
  type = list(string)
  description = "A list of security group IDs for the EC2 instance."
}

variable "internet_gateway_id" {
  type        = string
  description = "The ID of the Internet Gateway."
}