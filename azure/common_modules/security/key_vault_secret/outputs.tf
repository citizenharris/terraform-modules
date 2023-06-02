output "secret_id" {
  value = azurerm_key_vault_secret.secret.versionless_id
}

output "secret_value" {
  value = var.secret_value
}