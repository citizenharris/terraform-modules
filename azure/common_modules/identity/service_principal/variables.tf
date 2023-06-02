variable "application_id" {
  type        = string
  description = "(Required) The App ID of the Application for which to create a Service Principal."
}

variable "app_role_assignment_required" {
  type        = bool
  default     = false
  description = "(Optional) Whether this Service Principal requires an AppRoleAssignment to a user or group before Azure AD will issue a user or access token to the application. Defaults to false."
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "(Optional) A list of tags to apply to the Service Principal."
}

variable "owner_ad_group" {
  description = "The ad group to grant ownership of this app registration to"
  type        = string
  default     = "SMARTWindProgrammers"
}