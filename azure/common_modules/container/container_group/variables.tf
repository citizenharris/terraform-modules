variable "os_type" {
  type        = string
  default     = "Linux"
  description = "OS Type for a container (Windows/Linux)"
}

variable "location" {
  type        = string
  description = "location for the container instance"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for a container"
}

variable "market" {
  type = string
}

variable "environment" {
  type = string
}

variable "application_name" {
  type        = string
  description = "Name of the application that this Resource Group bundles resources for"
}

variable "cpu" {
  type        = string
  default     = "0.5"
  description = "CPU size"
}

variable "memory" {
  type        = string
  default     = "1.5"
  description = "Memory size"
}

variable "container_port" {
  type        = number
  description = "Port exposed by the docker container"
}

variable "exposed_port" {
  type        = number
  description = "Port to expose from Azure"
}

variable "container_protocol" {
  type        = string
  default     = "TCP"
  description = "Protocol for the container port (TCP/UDP)"
}

variable "container_registry" {
  type        = string
  description = "Container registry name containing instance"
}

variable "password" {
  type        = string
  description = "Admin password"
}

variable "address_type" {
  type        = string
  default     = "private"
  description = "Address type - public, private"
}

variable "exposed_protocol" {
  type        = string
  default     = "TCP"
  description = "Protocol for exposed port (TCP/UDP)"
}

variable "network_profile_id" {
  type        = string
  description = "Network profile id for the virtual network the container has to be connected to"
}

variable "pvspot_secret" {
  type        = string
  description = "PV Spot secret token required for container to authenticate with PV Spot API"
}
