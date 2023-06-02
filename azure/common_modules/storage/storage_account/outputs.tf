output "name" {
  value = azurerm_storage_account.this.name
}

output "primary_access_key" {
  value = azurerm_storage_account.this.primary_access_key
}

output "primary_connection_string" {
  value = azurerm_storage_account.this.primary_connection_string
}

output "queue_url" {
  value = azurerm_storage_account.this.primary_queue_endpoint
}

output "blob_url" {
  value = azurerm_storage_account.this.primary_blob_endpoint
}
