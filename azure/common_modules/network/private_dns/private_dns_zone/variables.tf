variable "resource_group" {
  type        = string
  description = "Resource group name"
}

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
