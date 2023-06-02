data "azuread_group" "default_group" {
  display_name     = var.default_admin_user
  security_enabled = true
}

resource "azurerm_sql_active_directory_administrator" "sql_server_ad_admin" {
  server_name         = var.sql_server_name
  resource_group_name = var.resource_group
  login               = var.default_admin_user
  tenant_id           = var.tenant_id
  object_id           = data.azuread_group.default_group.object_id
}
