variable "storage_account_name" {
  type        = string
  description = "(Required) The name of the storage account to which this SAS applies."
}

variable "container_name" {
  type        = string
  description = "(Required) The name of the container to generate a SAS for."
}

variable "start" {
  type        = string
  description = "(Required) The starting time and date of validity of this SAS. Must be a valid ISO-8601 format time/date string e.g. '2021-08-21'."
}

variable "expiry" {
  type        = string
  description = "(Required) The expiration time and date of validity of this SAS. Must be a valid ISO-8601 format time/date string e.g. '2221-08-21'."
}

variable "permissions" {
  type        = string
  description = "(Required) The list of permissions that the SAS will grant. Can be any combination of **the first letter** of `read`, `add`, `create`, `write`, `delete`, `list` - e.g. `racwdl`. See https://docs.microsoft.com/en-us/rest/api/storageservices/create-service-sas for details."
}

variable "storage_resource_url" {
  type        = string
  description = "The URL of the resource you're generating a SAS token for."
}
