provider "azurerm" {
  features {}
  alias           = "domain_provider"
  subscription_id = var.domain_subscription_id
}

resource "azurerm_dns_cname_record" "cname_record" {
  provider            = azurerm.domain_provider
  name                = var.subdomain
  zone_name           = var.domain
  resource_group_name = var.domain_resource_group_name
  ttl                 = 3600
  record              = var.default_site_hostname
}

resource "azurerm_dns_txt_record" "text_record" {
  provider            = azurerm.domain_provider
  name                = "asuid.${var.subdomain}"
  zone_name           = var.domain
  resource_group_name = var.domain_resource_group_name
  ttl                 = 3600

  record {
    value = var.custom_domain_verification_id
  }
}

resource "azurerm_app_service_custom_hostname_binding" "custom_domain" {
  hostname            = "${var.subdomain}.${var.domain}"
  app_service_name    = var.app_service_name
  resource_group_name = var.resource_group
}

resource "azurerm_app_service_managed_certificate" "managed_certificate" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.custom_domain.id
}

resource "azurerm_app_service_certificate_binding" "certificate_binding" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.custom_domain.id
  certificate_id      = azurerm_app_service_managed_certificate.managed_certificate.id
  ssl_state           = "SniEnabled"
}