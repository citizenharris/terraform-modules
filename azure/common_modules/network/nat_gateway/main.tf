resource "azurerm_public_ip" "pip" {
  name                = join("-", ["pip", var.application_name, var.environment, var.market])
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "natgw" {
  location                = var.location
  name                    = join("-", ["ng", var.application_name, var.environment, var.market])
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = var.nat_gateway_idle_timeout
}

resource "azurerm_nat_gateway_public_ip_association" "pip-assoc" {
  nat_gateway_id       = azurerm_nat_gateway.natgw.id
  public_ip_address_id = azurerm_public_ip.pip.id
}

resource "azurerm_nat_gateway_public_ip_association" "pip-assoc-custom-ips" {
  nat_gateway_id       = azurerm_nat_gateway.natgw.id
  public_ip_address_id = azurerm_public_ip.pip.id
}

resource "azurerm_subnet_nat_gateway_association" "subnet-assoc" {
  nat_gateway_id = azurerm_nat_gateway.natgw.id
  subnet_id      = var.subnet_id
}
