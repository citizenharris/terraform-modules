data "azurerm_client_config" "current_user" {}

locals {
  application  = "ssl"
  location     = "UK South"
  tenant_id    = data.azurerm_client_config.current_user.tenant_id
  current_user = data.azurerm_client_config.current_user.object_id
}

module "resource_group" {
  source           = "../../common_modules/group/resource_group"
  application_name = local.application
  environment      = var.environment
  location         = local.location
}


module "key_vault" {
  source                     = "../../common_modules/security/key_vault"
  application_name           = local.application
  environment                = var.environment
  location                   = local.location
  resource_group             = module.resource_group.name
  soft_delete_retention_days = 7
  tenant_id                  = local.tenant_id
}

module "admin_key_vault_access_policy" {
  source = "../../common_modules/security/key_vault_access_policy"

  key_vault_id = module.key_vault.key_vault_id
  object_id    = local.current_user
  tenant_id    = local.tenant_id
  secret_permissions = [
    "Get",
    "Delete",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set"
  ]
}
