variable "application_name" {
  type        = string
  description = "Name of the application that this Resource Group bundles resources for"
}

variable "environment" {
  type        = string
  description = "Target environment for the application (i.e. development, test, staging, production)"
}

variable "location" {
  type        = string
  description = "SQL Server location"
}

variable "suffix" {
  type        = string
  description = "Name suffix"
}

variable "resource_group" {
  type        = string
  description = "Resource group"
}

variable "sql_server_version" {
  type        = string
  default     = "12.0"
  description = "SQL server version"
}

variable "administrator_login" {
  type        = string
  description = "SQL Server admin user login"
}

variable "administrator_login_password" {
  type        = string
  default     = ""
  description = "SQL Server admin user password, or '' to create a random password"
}
