variable "resource_group" {
  type        = string
  description = "Resource group"
}

variable "database_name" {
  type        = string
  description = "Name of the database"
}

variable "location" {
  type        = string
  description = "SQL Server location"
}

variable "server_name" {
  type        = string
  description = "SQL Server name"
}

# restrict values + link
variable "max_size" {
  type        = string
  default     = "250GB"
  description = "The maximum size that the database can grow to"
}

# More info about possible values is here: https://docs.microsoft.com/en-us/azure/azure-sql/database/resource-limits-dtu-single-databases
variable "dtu" {
  type        = number
  default     = 100
  description = "SKU name (translates to DTU size)"
}
