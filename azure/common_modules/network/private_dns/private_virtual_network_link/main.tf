resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_link" {
  name                  = lower(join("-", ["vnl", "vn", var.application_name, var.environment, var.market]))
  resource_group_name   = var.resource_group
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.virtual_network_id
}
