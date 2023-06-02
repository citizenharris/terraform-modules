variable "container_name" {
  type        = string
  description = "(Required) A description of the container's function e.g. 'logs', 'attachments'. It forms the first part of the container name in conjunction with the environment and suffix."
}

variable "environment" {
  type        = string
  description = "(Required) The environment in which the resource exists"
}

variable "storage_account_name" {
  type        = string
  description = "(Required) The name of the storage account that will host the container"
}

variable "container_access_type" {
  type        = string
  default     = "private"
  description = "(Optional) The Access Level configured for this Container. Possible values are `blob`, `container` or `private`. Defaults to `private`."
}

variable "metadata" {
  type        = map(any)
  default     = {}
  description = "(Optional) A mapping of MetaData for this Container. All metadata keys should be lowercase."
}

variable "suffix" {
  type        = string
  default     = ""
  description = "(Optional) A suffix to append to the container name e.g. 'france'"
}
