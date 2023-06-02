# Common information

variable "application_name" {
  type        = string
  description = "Name of the application that will be running on this VM"
}

variable "environment" {
  type        = string
  description = "Target environment for the application (i.e. development, test, staging, production)"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags to be attached to the App Service Plan"
}

# Service Plan

variable "plan_name_suffix" {
  type        = string
  default     = ""
  description = "Plan name suffix"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group that will host the resource"
}

variable "location" {
  type        = string
  description = "The Azure location of the resource e.g. UK South, West Europe"
}

variable "tier" {
  type        = string
  description = "The pricing tier for the App Service Plan. See https://azure.microsoft.com/en-gb/pricing/details/app-service/windows/ or https://stackoverflow.com/a/47522889 for reference "
}

variable "size" {
  type        = string
  description = "The size of the App Service Plan. This refers to the size of the VM instance e.g. B1, S2"
}
