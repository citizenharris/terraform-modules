variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the storage account exists. Changing this forces a new resource to be created."
}

variable "storage_account_name" {
  type        = string
  description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "default_action" {
  type        = string
  description = "(Required) Specifies the default action of allow or deny when no other rules match. Valid options are `Deny` or `Allow`."
}

variable "ip_rules" {
  type        = list(string)
  default     = []
  description = "(Optional) List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in [RFC 1918](https://tools.ietf.org/html/rfc1918#section-3)) are not allowed."
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "(Optional) A list of virtual network subnet ids to to secure the storage account."
}

variable "bypass" {
  type        = list(string)
  default     = []
  description = "(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of `Logging`, `Metrics`, `AzureServices`, or `None`. NOTE: User has to explicitly set bypass to empty slice ([]) to remove it."
}

variable "private_link_access" {
  type = object({
    endpoint_resource_id = string
    endpoint_tenant_id   = string
  })
  default     = null
  description = "(Optional) Defines private link access to the storage account. Properties: endpoint_resource_id - (Required) The resource id of the resource access rule to be granted access. endpoint_tenant_id - (Optional) The tenant id of the resource of the resource access rule to be granted access. Defaults to the current tenant id."
}
