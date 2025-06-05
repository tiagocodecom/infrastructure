variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources into."
}

variable "aws_ec2_instance_ami" {
  type        = string
  default     = "ami-00f34bf9aeacdf007"
  description = "The ID of the Amazon Machine Image (AMI) to use for the virtual machine."
}

variable "aws_ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The instance type for the virtual machine (e.g., t3.micro)."
}

variable "aws_vpc_cidr_block" {
  type        = string
  default     = "10.10.0.0/16"
  description = "The CIDR block to be used for the Virtual Private Cloud (VPC)."
}

variable "aws_subnet_cidr_block" {
  type        = string
  default     = "10.10.0.0/18"
  description = "The CIDR block to be used for the subnet within the VPC."
}

variable "cloudflare_zone_id" {
  type        = string
  description = "The ID of the Cloudflare zone to use for DNS records."
}

variable "cloudflare_email" {
  type        = string
  description = "Email address associated with your Cloudflare account. Required for authenticating with the Cloudflare provider."
}

variable "cloudflare_api_key" {
  type        = string
  description = "Cloudflare API key for legacy authentication. Use only if not using API token."
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token with permissions to manage DNS records. Used for authenticating with the Cloudflare provider."
}

variable "cloudflare_dns" {
  type        = string
  description = "The DNS name or configuration used in the Cloudflare integration. This may refer to a DNS record or setting needed by the project."
}

variable "project_environment" {
  type        = string
  description = "Specifies the environment in which the project is deployed (e.g., development, staging, production)."
}

variable "project_name" {
  type        = string
  description = "A short, unique identifier for the project. Used to name, group, and tag AWS resources consistently."
}

variable "project_domain_name" {
  type        = string
  description = "The primary domain name used for the project (e.g., for DNS records, TLS certificates, and routing)."
}

variable "project_subdomain_prefix" {
  type        = string
  default     = ""
  description = "The prefix for subdomains used in the project (e.g., 'local-' for local-admin.tiagocode.com)."
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

variable "service_redis_username" {
  type        = string
  description = "Username required to access the Redis service instance."
}

variable "service_redis_password" {
  type        = string
  description = "Password used to authenticate with the Redis service."
}

variable "service_traefik_username_password" {
  type        = string
  description = "Combined username and password (in user:pass format) used for basic auth with the Traefik dashboard."
}

variable "service_drupal_database_prefix" {
  type        = string
  description = "Prefix used for Drupal database tables to namespace installations or differentiate environments."
}

variable "service_drupal_hash_salt" {
  type        = string
  description = "A secure random string used by Drupal for one-way hashing and securing data (e.g., sessions, passwords)."
}

variable "service_frontend_api_url" {
  type        = string
  description = "Base URL for the frontend to communicate with the backend API."
}

variable "service_fronted_api_username" {
  type        = string
  description = "Username used by the frontend to authenticate with the backend API."
}

variable "service_frontend_api_password" {
  type        = string
  description = "Password used by the frontend to authenticate with the backend API."
}

variable "service_frontend_images_url" {
  type        = string
  description = "URL used by the frontend to access static image assets."
}