variable "aws_region" {
  type        = string
  default     = "eu-north-1"
  description = "The AWS region to deploy resources into."
}

variable "cloudflare_zone_id" {
  type        = string
  description = "The ID of the Cloudflare zone to use for DNS records."
}

variable "cloudflare_email" {
  type        = string
  description = "Email address associated with your Cloudflare account. Required for authenticating with the Cloudflare provider."
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token with permissions to manage DNS records. Used for authenticating with the Cloudflare provider."
}

variable "project_environment" {
  type        = string
  description = "Specifies the environment in which the project is deployed (e.g., development, staging, production)."
}

variable "project_domain_name" {
  type        = string
  description = "The primary domain name used for the project (e.g., for DNS records, TLS certificates, and routing)."
}

variable "project_subdomain_prefix" {
  type        = string
  description = "The prefix for subdomains used in the project (e.g., 'local-' for local-admin.tiagocode.com)."
}

variable "project_name" {
  type        = string
  default     = "tiagocode"
  description = "A short, unique identifier for the project. Used to name, group, and tag AWS resources consistently."
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

variable "database_name" {
  type        = string
  description = "The name of the application's primary database."
}

variable "database_username" {
  type        = string
  description = "The username used to authenticate with the application's database."
}

variable "database_password" {
  type        = string
  description = "The password used to authenticate with the application's database."
}