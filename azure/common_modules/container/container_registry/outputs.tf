output "name" {
  value       = azurerm_container_registry.container_registry.name
  description = "Container Registry name"
}

output "admin_password" {
  value = azurerm_container_registry.container_registry.admin_password
}
