locals {
  application_name = lower(replace("as-${replace(trimspace(var.application_name), " ", "-")}-${var.environment}${var.as_name_suffix != "" ? "-${var.as_name_suffix}" : ""}", " ", ""))
}

resource "azurerm_app_service" "app_service" {
  # "name" may only contain alphanumeric characters and dashes and up to 60 characters in length
  name                = local.application_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  identity {
    type         = try(var.identity["type"], "SystemAssigned")
    identity_ids = try(var.identity["identity_ids"], null)
  }

  site_config {
    dotnet_framework_version = try(var.site_config["dotnet_framework_version"], null)
    remote_debugging_enabled = try(var.site_config["remote_debugging_enabled"], false)
    remote_debugging_version = try(var.site_config["remote_debugging_version"], null)
    scm_type                 = var.scm_type
    always_on                = var.always_on
  }

  app_settings = var.app_settings

  dynamic "auth_settings" {
    for_each = var.registration_client_id == "" ? [] : [true]

    content {
      enabled                       = true
      unauthenticated_client_action = "RedirectToLoginPage"

      active_directory {
        client_id = var.registration_client_id
      }
    }
  }

  dynamic "connection_string" {
    for_each = lookup(var.connection_string, "name", "") == "" ? [] : [true]

    content {
      name  = try(var.connection_string["name"], null)
      type  = try(var.connection_string["type"], null)
      value = try(var.connection_string["value"], null)
    }
  }

  dynamic "logs" {
    for_each = var.azure_blob_storage_logs == null ? [] : [true]

    content {
      application_logs {
        azure_blob_storage {
          level             = var.azure_blob_storage_logs["level"]
          retention_in_days = var.azure_blob_storage_logs["retention_in_days"]
          sas_url           = var.azure_blob_storage_logs["sas_url"]
        }
      }
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
