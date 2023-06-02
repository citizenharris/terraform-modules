resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id = var.app_service_id
  subnet_id      = "/subscriptions/${var.vn_subscription_id}/resourceGroups/${var.vn_resource_group}/providers/Microsoft.Network/virtualNetworks/${var.vn_name}/subnets/${var.subnet_name}"
}
