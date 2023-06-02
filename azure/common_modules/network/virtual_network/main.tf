resource "azurerm_virtual_network" "virtual_network" {
  name                = lower(join("-", ["vn", var.application_name, var.environment, var.market]))
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}
