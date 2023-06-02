variable "display_name" {
  type        = string
  default     = null
  description = "(Optional) A display name for the password."
}

variable "environment" {
  type        = string
  description = "(Required) Target environment for the resource (i.e. development, test, staging, production)"
}

variable "suffix" {
  type        = string
  description = "(Optional) A suffix to append to the display name, usually a market e.g. `france`"
  default     = ""
}
