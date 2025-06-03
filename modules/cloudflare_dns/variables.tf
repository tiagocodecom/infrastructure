variable "cloudflare_zone_id" {
  type        = string
  description = "The ID of the Cloudflare zone to use for DNS records."
}

variable "project_domain_name" {
  type        = string
  description = "The primary domain name used for the project (e.g., for DNS records, TLS certificates, and routing)."
}

variable "instance_public_ip" {
  type        = string
  description = "The public IPv4 address of the EC2 instance. Used to associate DNS records or external services with the instance."
}
