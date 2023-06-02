resource "azurerm_container_registry" "container_registry" {
  name                = "${var.name}${var.environment}"
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}
