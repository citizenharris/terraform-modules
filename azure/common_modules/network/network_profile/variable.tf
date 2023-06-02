variable "application_name" {
  type        = string
  description = "Name of the network profile for the application"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the network profile"
}

variable "location" {
  type        = string
  description = "Location/location for the network profile"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID for the network profile"
}
