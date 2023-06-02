resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = lower("${join("-", [var.application_name, var.environment, var.market])}.private")
  resource_group_name = var.resource_group
}
