resource "azurerm_storage_account_network_rules" "this" {
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name

  default_action             = var.default_action
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = var.virtual_network_subnet_ids
  bypass                     = var.bypass

  dynamic "private_link_access" {
    for_each = var.private_link_access == null ? [] : [true]

    content {
      endpoint_resource_id = var.private_link_access["endpoint_resource_id"]
      endpoint_tenant_id   = try(var.private_link_access["endpoint_tenant_id"], null)
    }
  }
}
