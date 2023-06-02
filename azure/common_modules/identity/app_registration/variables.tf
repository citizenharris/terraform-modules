# Common information

variable "application_name" {
  type        = string
  description = "Name of the application that this App Registration governs"
}

variable "environment" {
  type        = string
  description = "Target environment for the application (i.e. development, test, staging, production)"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags to be attached to the App Registration"
}

# App Registration

variable "ar_name_suffix" {
  type        = string
  default     = ""
  description = "Optional suffix to be appended to App Registration name"
}

variable "sign_in_audience" {
  type        = string
  default     = "AzureADMyOrg"
  description = "(Optional) The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg` or `AzureADMultipleOrgs`"
}

variable "oauth2_permission_scopes" {
  type        = list(map(any))
  default     = null
  description = "Optional) One or more `oauth2_permission_scope` blocks as documented below, to describe delegated permissions exposed by the web API represented by this Application."
}

variable "required_resource_access" {
  type = list(object({
    resource_app_id = string
    resource_access = list(object({
      id   = string
      type = string
    }))
  }))
  description = "A block containing a `resource_app_id` - the unique identifier for the resource that the application requires access to. This should be the Application ID of the target application - and a collection of `resource_access` blocks, describing OAuth2.0 permission scopes and app roles that the application requires from the specified resource. See https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application#resource_access."
}


variable "web" {
  type = object({
    redirect_uris  = list(string)
    implicit_grant = map(any)
  })
  default     = null
  description = "A block used for UI authentication. For SwaggerUI to properly authenticate, the `redirect_uris` list needs to be supplied. See https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application#homepage_url."
}

variable "owner_ad_group" {
  description = "The ad group to grant ownership of this app registration to"
  type        = string
  default     = "SMARTWindProgrammers"
}
