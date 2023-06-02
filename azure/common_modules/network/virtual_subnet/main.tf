resource "azurerm_subnet" "subnet" {
  name                 = lower(join("-", ["sn", var.application_name, var.environment, var.market]))
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  delegation {
    name = "delegation"

    service_delegation {
      name    = var.service_delegation_name
      actions = var.service_delegation_actions
    }
  }
}