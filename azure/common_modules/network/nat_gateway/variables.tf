variable "market" {
  type        = string
  description = "Project market name e.g france, australia"
}

variable "location" {
  type        = string
  description = "Azure location to use"
}

variable "environment" {
  type        = string
  description = "Project environment"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to use"
}

variable "application_name" {
  type        = string
  description = "Name of the network profile for the application"
}

variable "public_ip_ids" {
  type        = list(string)
  default     = []
  description = "List of public ips to use. Create one ip if not provided"
}

variable "nat_gateway_idle_timeout" {
  type        = number
  default     = 4
  description = "Idle timeout configuration in minutes for Nat Gateway"
}

variable "subnet_id" {
  type        = string
  description = "Ids of subnets to associate with the Nat Gateway"
}
