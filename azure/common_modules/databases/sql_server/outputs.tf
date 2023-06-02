output "name" {
  value = azurerm_sql_server.sql_server.name
}

output "fully_qualified_domain_name" {
  value = azurerm_sql_server.sql_server.fully_qualified_domain_name
}

output "administrator_login" {
  description = "SQL Server admin user login"
  value       = azurerm_sql_server.sql_server.administrator_login
}

output "administrator_login_password" {
  description = "SQL Server admin user password"
  value       = azurerm_sql_server.sql_server.administrator_login_password
}
