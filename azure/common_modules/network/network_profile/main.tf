resource "azurerm_network_profile" "network_profile" {
  name                = join("-", [var.application_name, "profile"])
  location            = var.location
  resource_group_name = var.resource_group_name

  container_network_interface {
    name = "${var.application_name}-interface"
    ip_configuration {
      name      = "${var.application_name}-ip-configuration"
      subnet_id = var.subnet_id
    }
  }
}
