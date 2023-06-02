output "ip_address" {
  value       = azurerm_container_group.container_group.ip_address
  description = "Container IP Adress"
}
