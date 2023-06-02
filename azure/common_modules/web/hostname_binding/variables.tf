variable "subdomain" {
  type        = string
  description = "Subdomain"
}

variable "domain" {
  type        = string
  description = "Domain"
}

variable "resource_group" {
  type        = string
  description = "Resource group"
}

variable "app_service_name" {
  type        = string
  description = "App Service name"
}

variable "custom_domain_verification_id" {
  type        = string
  description = "Custom Domain verification ID"
}

variable "domain_subscription_id" {
  type        = string
  description = "Domain subscription ID"
}

variable "domain_resource_group_name" {
  type        = string
  description = "Domain resource group name"
}

variable "default_site_hostname" {
  type        = string
  description = "Default site hostname"
}
