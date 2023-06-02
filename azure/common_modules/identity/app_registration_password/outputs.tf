output "display_name" {
  value = azuread_application_password.app_registration_password.display_name
}

output "password" {
  value     = azuread_application_password.app_registration_password.value
  sensitive = true
}
