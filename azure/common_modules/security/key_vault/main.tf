locals {

  # Fully qualified name
  full_name = "${replace(replace(var.application_name, " ", ""), "-", "")}-${var.environment}${var.suffix == "" ? "" : "-${var.suffix}"}"

  # Fully qualified name with shortened environment (stag vs staging)
  shortened_env_name = length(local.full_name) > 21 ? replace(local.full_name, var.environment, substr(var.environment, 0, 4)) : local.full_name

  # Fully qualified name with shortened environment and application name (down vs downtime-api)
  shortened_app_name = length(local.shortened_env_name) > 21 ? replace(local.shortened_env_name, var.application_name, substr(var.application_name, 0, 4)) : local.shortened_env_name

  # Fully qualified name with shortened environment, application name, and suffix (fran vs france)
  shortened_suffix_name = length(local.shortened_app_name) > 21 ? replace(local.shortened_app_name, var.suffix, substr(var.suffix, 0, 4)) : local.shortened_app_name
  final_name            = lower("kv-${local.shortened_suffix_name}")

  # There's a requirement that the name of key_vault should be less or equal 24 characters.
  # They must also be globally unique
}

resource "azurerm_key_vault" "key_vault" {
  name                            = local.final_name
  location                        = var.location
  tags                            = var.tags
  resource_group_name             = var.resource_group
  enabled_for_disk_encryption     = true
  tenant_id                       = var.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = false
  enabled_for_template_deployment = true

  sku_name = "standard"

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
