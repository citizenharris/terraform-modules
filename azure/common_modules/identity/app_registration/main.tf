data "azuread_group" "default_group" {
  display_name     = var.owner_ad_group
  security_enabled = true
}

resource "random_uuid" "app_role_id" {
}

resource "azuread_application" "app_registration" {
  display_name    = "${var.application_name} ${var.environment} ${var.ar_name_suffix != "" ? var.ar_name_suffix : ""}"
  identifier_uris = ["api://${lower(replace(("${var.application_name}-${var.environment}${var.ar_name_suffix != "" ? "-${var.ar_name_suffix}" : ""}"), " ", "-"))}"]
  # you cannot set a group as the owner of an application, 
  # see https://feedback.azure.com/forums/169401-azure-active-directory/suggestions/6688284-ad-groups-in-application-owners
  # so add all the members of the group as owners
  # this has the disadvantage that as team members change we will need to update the owners of the apps
  owners           = data.azuread_group.default_group.members
  sign_in_audience = var.sign_in_audience

  api {
    dynamic "oauth2_permission_scope" {
      for_each = var.oauth2_permission_scopes == null ? [] : var.oauth2_permission_scopes

      content {
        admin_consent_description  = try(oauth2_permission_scope.value["admin_consent_description"], null)
        admin_consent_display_name = try(oauth2_permission_scope.value["admin_consent_display_name"], null)
        enabled                    = try(oauth2_permission_scope.value["enabled"], null)
        id                         = try(oauth2_permission_scope.value["id"], null)
        type                       = try(oauth2_permission_scope.value["type"], null)
        user_consent_description   = try(oauth2_permission_scope.value["user_consent_description"], null)
        user_consent_display_name  = try(oauth2_permission_scope.value["user_consent_display_name"], null)
        value                      = try(oauth2_permission_scope.value["value"], null)
      }
    }
  }

  app_role {
    allowed_member_types = ["User", "Application"]
    description          = "Admins can manage roles and perform all task actions"
    display_name         = "Admin"
    enabled              = true
    value                = "admin"
    id                   = random_uuid.app_role_id.id
  }

  dynamic "required_resource_access" {
    for_each = var.required_resource_access

    content {
      resource_app_id = required_resource_access.value["resource_app_id"]

      dynamic "resource_access" {
        for_each = required_resource_access.value["resource_access"]

        content {
          id   = resource_access.value["id"]
          type = resource_access.value["type"]
        }
      }
    }
  }

  web {
    homepage_url  = try(var.web["homepage_url"], null)
    logout_url    = try(var.web["logout_url"], null)
    redirect_uris = try(var.web["redirect_uris"], null)

    implicit_grant {
      access_token_issuance_enabled = try(var.web["implicit_grant"]["access_token_issuance_enabled"], null)
      id_token_issuance_enabled     = try(var.web["implicit_grant"]["id_token_issuance_enabled"], null)
    }
  }
}
