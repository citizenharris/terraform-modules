resource "azuread_application_password" "app_registration_password" {
  application_object_id = var.application_object_id
  display_name          = var.display_name
  end_date              = var.end_date
  end_date_relative     = var.end_date_relative
  start_date            = var.start_date
}
