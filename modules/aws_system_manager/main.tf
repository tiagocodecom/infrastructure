resource "aws_ssm_parameter" "project_name_parameter" {
  name = "/${var.project_name}/project/name"
  description = "The name of the project, used to namespace configuration and parameters"
  type = "String"
  value = var.project_name
}

resource "aws_ssm_parameter" "project_domain_name_parameter" {
  name = "/${var.project_name}/project/domain_name"
  description = "The primary domain name used by the project (e.g., tiagocode.com)"
  type = "String"
  value = var.project_domain_name
}

resource "aws_ssm_parameter" "project_subdomain_prefix_parameter" {
  name = "/${var.project_name}/project/subdomain_prefix"
  description = "The prefix used for subdomains related to the project (e.g., local-admin, developemnt-website)"
  type = "String"
  value = var.project_domain_name
}

resource "aws_ssm_parameter" "database_name_parameter" {
  name = "/${var.project_name}/database/name"
  description = "The name of the application's database"
  type = "String"
  value = var.database_name
}
resource "aws_ssm_parameter" "database_username_parameter" {
 name = "/${var.project_name}/database/username"
 description = "The database username used by the application"
 type = "SecureString"
 value = var.database_username
}

resource "aws_ssm_parameter" "database_password_parameter" {
  name = "/${var.project_name}/database/password"
  description = "The database password used by the application"
  type = "SecureString"
  value = var.database_password
}