variable "project_environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "project_domain_name" {
  type = string
}

variable "project_subdomain_prefix" {
  type = string
}

variable "database_name" {
  type = string
}

variable "database_username" {
  type = string
}

variable "database_password" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_email" {
  type = string
}

variable "cloudflare_dns" {
  type = string
}

variable "cloudflare_api_key" {
  type = string
}

variable "service_traefik_username_password" {
  type = string
}

variable "service_redis_username" {
  type = string
}

variable "service_redis_password" {
  type = string
}

variable "service_drupal_hash_salt" {
  type = string
}

variable "service_drupal_database_prefix" {
  type = string
}

variable "service_frontend_api_url" {
  type = string
}

variable "service_fronted_api_username" {
  type = string
}

variable "service_frontend_api_password" {
  type = string  
}

variable "service_frontend_images_url" {
  type = string
}
