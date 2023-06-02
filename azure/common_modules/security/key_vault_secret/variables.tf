# Common information

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags to be attached to the Key Vault access policy"
}

# Key Vault Secret

variable "key_vault_id" {
  type        = string
  description = "Key Vault ID"
}

variable "secret_name" {
  type        = string
  description = "Secret name"
}

variable "secret_value" {
  type        = string
  description = "Secret value"
}
