# Common information

variable "application_name" {
  type        = string
  description = "Name of the application that this Key Vault belongs to"
}

variable "environment" {
  type        = string
  description = "Target environment for the application (i.e. development, test, staging, production)"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags to be attached to the Key Vault"
}

# Key Vault

variable "suffix" {
  type        = string
  default     = ""
  description = "An optional suffix to append to the Key Vault name"
}

variable "location" {
  type        = string
  description = "Key Vault location"
}

variable "resource_group" {
  type        = string
  description = "Resource group"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "owner_ad_group" {
  type        = string
  default     = "SMARTWindProgrammers"
  description = "The AD group to grant access to this Key Vault"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Key Vault soft delete retention days count"
}
