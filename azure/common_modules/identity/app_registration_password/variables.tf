# App Registration Password

variable "application_object_id" {
  type        = string
  description = "The object id of the App Registration that will host the secret"
}

variable "display_name" {
  type        = string
  default     = null
  description = "(Optional) A display name for the password."
}

variable "end_date" {
  type        = string
  default     = null
  description = "(Optional) The End Date which the Password is valid until, formatted as a RFC3339 date string (e.g. 2018-01-01T01:02:03Z). Changing this field forces a new resource to be created."
}

variable "end_date_relative" {
  type        = string
  default     = null
  description = "(Optional) A relative duration for which the Password is valid until, for example 240h (10 days) or 2400h30m. Changing this field forces a new resource to be created."
}

variable "start_date" {
  type        = string
  default     = null
  description = "(Optional) The Start Date which the Password is valid from, formatted as a RFC3339 date string (e.g. 2018-01-01T01:02:03Z). If this isn't specified, the current date is used. Changing this field forces a new resource to be created."
}
