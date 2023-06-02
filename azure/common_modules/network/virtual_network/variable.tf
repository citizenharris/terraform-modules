variable "application_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "environment" {
  type        = string
  description = "Target environment for the virtual network (i.e. staging, production)"
}


variable "market" {
  type        = string
  description = "Market location where virtual network resides"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the Virtual Network"
}


variable "location" {
  type        = string
  description = "Location for the Virtual Network"
}

variable "address_space" {
  type        = list(string)
  default     = ["10.1.0.0/16"]
  description = "Virtual network address spice"
}

