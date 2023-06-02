output "principal_id" {
  value = azurerm_app_service.app_service.identity[0].principal_id
}

output "application_id" {
  value = azurerm_app_service.app_service.id
}

output "application_name" {
  value = azurerm_app_service.app_service.name
}

output "base_url" {
  value = "https://${local.application_name}.azurewebsites.net"
}

output "default_site_hostname" {
  value = azurerm_app_service.app_service.default_site_hostname
}

output "custom_domain_verification_id" {
  value = azurerm_app_service.app_service.custom_domain_verification_id
}

output "deployment_username" {
  value = azurerm_app_service.app_service.site_credential.0.username
}

output "deployment_password" {
  value     = azurerm_app_service.app_service.site_credential.0.password
  sensitive = true
}
