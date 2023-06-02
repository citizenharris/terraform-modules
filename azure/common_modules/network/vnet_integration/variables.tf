variable "market" {
  type        = string
  description = "Virtual network market"
}

variable "environment" {
  type        = string
  description = "Target environment for the subnetwork (i.e. staging, production)"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the Virtual Network"
}

variable "application_name" {
  type        = string
  description = "Name of the application which will use this network"
}

variable "address_prefixes" {
  type        = list(string)
  default     = ["10.1.1.0/24"]
  description = "Subnet address prefixes"
}

variable "app_service_id" {
  type        = string
  description = "Data Updater ID"
}

variable "virtual_network_name" {
  type = string
}

variable "subnet_id" {
  type = string
}