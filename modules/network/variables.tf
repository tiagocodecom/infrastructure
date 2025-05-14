variable "project_name" {
  type        = string
  description = "A unique name used to identify and tag resources related to this project"
}

variable "vpc_cidr_block" {
  type = string
  description = "CIDR block range for the VPC (e.g., 10.10.0.0/16)"
}

variable "subnet_cidr_block" {
  type = string
  description = "CIDR block range for the subnet (e.g., 10.10.0.0/18)"
}