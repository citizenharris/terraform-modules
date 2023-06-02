resource "azurerm_container_group" "container_group" {
  name                = join("-", ["ci", var.application_name, var.environment, var.market])
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.address_type
  os_type             = var.os_type
  network_profile_id  = var.network_profile_id
  exposed_port = [
    {
      port     = var.exposed_port
      protocol = var.exposed_protocol
    },
  ]

  container {
    name   = "${var.application_name}-${var.environment}"
    image  = "ressmart${var.environment}.azurecr.io/${var.application_name}"
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.container_port
      protocol = var.container_protocol
    }

    secure_environment_variables = {
      PVSPOT_SECRET = var.pvspot_secret
    }
  }

  image_registry_credential {
    server   = "${var.container_registry}.azurecr.io"
    username = var.container_registry
    password = var.password
  }
}
