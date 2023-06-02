variable "name" {
  type        = string
  description = "Firewall rule name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "server_name" {
  type        = string
  description = "SQL Server name the rule should be applied to"
}

variable "start_ip_address" {
  type        = string
  description = "Start IP address"
}

variable "end_ip_address" {
  type        = string
  description = "End IP address"
}
