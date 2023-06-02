variable "market" {
  type        = string
  description = "location market e.g france, australia"
}
variable "environment" {
  type        = string
  description = "Enviroment e.g production, staging"
}

variable "application_name" {
  type        = string
  description = "Container name"
}

variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "private_dns_zone_name" {
  type        = string
  description = "Private DNS Zone Domain Name"
}

variable "virtual_network_id" {
  type        = string
  description = "Virtual network id"
}
