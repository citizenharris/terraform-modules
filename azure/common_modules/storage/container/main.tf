resource "azurerm_storage_container" "this" {
  name                  = "stcon-${var.container_name}-${var.environment}${var.suffix == "" ? "" : "-${var.suffix}"}"
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type
  metadata              = var.metadata
}
