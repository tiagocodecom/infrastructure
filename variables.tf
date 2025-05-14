variable "aws_region" {
  type        = string
  default     = "eu-north-1"
  description = "The AWS region to deploy resources into."
}

variable "project_name" {
  type        = string
  default     = "tiagocode"
  description = "The name of the project, used to tag and identify resources."
}

variable "network_vpc_cidr_block" {
  type        = string
  default     = "10.10.0.0/16"
  description = "The CIDR block to be used for the Virtual Private Cloud (VPC)."
}

variable "network_subnet_cidr_block" {
  type        = string
  default     = "10.10.0.0/18"
  description = "The CIDR block to be used for the subnet within the VPC."
}

variable "vmachine_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The instance type for the virtual machine (e.g., t3.micro)."
}

variable "vmachine_ami" {
  type        = string
  default     = "ami-00f34bf9aeacdf007"
  description = "The ID of the Amazon Machine Image (AMI) to use for the virtual machine."
}