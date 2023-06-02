variable "app_service_id" {
  description = "ID of the app service to connect"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet to connect"
  type        = string
}

variable "vn_name" {
  description = "Name of the virtual network to connect"
  type        = string
}

variable "vn_resource_group" {
  description = "Resource group of the virtual network"
  type        = string
}

variable "vn_subscription_id" {
  description = "Subscription ID of the virtual network"
  type        = string
}