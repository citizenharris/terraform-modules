variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "resource_group" {
  type        = string
  description = "Resource group"
}

variable "sql_server_name" {
  type        = string
  description = "SQL Server name the admin should be assigned to"
}

variable "default_admin_user" {
  type        = string
  default     = "SMARTWindProgrammers"
  description = "Default Admin user"
}
