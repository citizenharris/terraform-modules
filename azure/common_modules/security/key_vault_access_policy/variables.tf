variable "key_vault_id" {
  type        = string
  description = "Key Vault ID"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "object_id" {
  type        = string
  description = "The Object ID of the service principal used for access"
}

variable "key_permissions" {
  type        = list(string)
  default     = []
  description = "Key permissions"
}

variable "secret_permissions" {
  type        = list(string)
  default     = []
  description = "(Optional) List of secret permissions, must be one or more from the following: `Backup`, `Delete`, `Get`, `List`, `Purge`, `Recover`, `Restore` and `Set`."
}

variable "certificate_permissions" {
  type        = list(string)
  default     = []
  description = "Certificate permissions"
}
