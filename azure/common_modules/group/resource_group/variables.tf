# Common information

variable "application_name" {
  type        = string
  description = "Name of the application that this Resource Group bundles resources for"
}

variable "environment" {
  type        = string
  description = "Target environment for the application (i.e. development, test, staging, production)"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags to be attached to the resource group"
}

# Resource Group

variable "location" {
  type        = string
  description = "Resource Group location"
}

variable "rg_name_suffix" {
  type        = string
  default     = ""
  description = "Optional Resource Group name suffix"
}
