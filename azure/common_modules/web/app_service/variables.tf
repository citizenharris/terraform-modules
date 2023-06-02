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
  description = "Tags to be attached to the App Service"
}

# App Service

variable "location" {
  type        = string
  description = "Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group"
}

variable "app_service_plan_id" {
  type        = string
  description = "The ID of the app service plan that dictates the image size for this app service"
}

variable "as_name_suffix" {
  type        = string
  default     = ""
  description = "Optional suffix to be appended to App Service name"
}

variable "registration_client_id" {
  type        = string
  default     = ""
  description = "Optional app registration client id"
}

variable "app_settings" {
  type        = map(any)
  default     = {}
  description = "Optional map of app settings for the App Service"
}

variable "site_config" {
  type        = map(any)
  default     = {}
  description = "Optional map of site config settings for the App Service"
}

variable "identity" {
  type        = map(any)
  default     = {}
  description = "A block which should contain the `type` of identity - e.g. SystemAssigned (default), UserAssigned - and a list of `identity_ids` which specifies a list of user managed identity ids to be assigned"
}

variable "connection_string" {
  type        = map(any)
  default     = {}
  description = "Connection String Map"
}

variable "scm_type" {
  type        = string
  default     = "LocalGit"
  description = "Optional deployment scm type (Defaults to LocalGit)"
}

variable "always_on" {
  type        = bool
  default     = false
  description = "always_on true or false"
}

variable "azure_blob_storage_logs" {
  type = object({
    level             = string
    retention_in_days = number
    sas_url           = string
  })
  default     = null
  description = "Configuration for storing application logs in blob storage. See https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service#level for reference"
}

