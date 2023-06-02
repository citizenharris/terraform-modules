
variable "name" {
  description = "Name of the container registry"
  type        = string
}

variable "location" {
  description = "Container registry location"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "resource_group" {
  type = string
}

variable "sku" {
  description = "Current possible values are Premium, Standard and Basic. See more: https://azure.microsoft.com/en-us/pricing/details/container-registry/"
  type        = string
}

variable "admin_enabled" {
  type    = bool
  default = true
}
