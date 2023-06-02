resource "random_password" "sql_server_password_secret" {
  length      = 16
  special     = false
  lower       = true
  number      = true
  upper       = true
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
}

resource "azurerm_sql_server" "sql_server" {
  name                         = lower(replace("${var.application_name}-${var.environment}-${var.suffix}", " ", ""))
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password == "" ? random_password.sql_server_password_secret.result : var.administrator_login_password
}
