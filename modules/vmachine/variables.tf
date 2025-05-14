variable "project_name" {
  type        = string
  description = "A unique name used to identify and tag resources related to this project"
}

variable "ami" {
  type = string
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instance."
}

variable "instance_type" {
  type = string
  description = "The type of EC2 instance to launch (e.g., t2.micro)."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where EC2 instances and other resources will be deployed"
}

variable "subnet_id" {
  type = string
  description = "The ID of the subnet where the EC2 instance will be launched."
}

variable "security_groups_ids" {
  type = list(string)
  description = "A list of security group IDs to associate with the EC2 instance."
}