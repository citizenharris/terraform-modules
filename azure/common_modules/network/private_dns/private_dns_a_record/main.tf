resource "azurerm_private_dns_a_record" "private_dns_a_record" {
  name                = var.private_dns_a_record
  zone_name           = var.private_dns_zone_name
  resource_group_name = var.resource_group
  ttl                 = var.ttl
  records             = var.dns_records
}
