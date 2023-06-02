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

variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "address_prefixes" {
  type        = list(string)
  description = "Subnet address prefixes"
}

variable "service_delegation_name" {
  type = string
}

variable "service_delegation_actions" {
  type = list(any)
}