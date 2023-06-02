resource "azurerm_resource_group" "resource_group" {
  name     = lower(replace(replace("rg-${var.application_name}-${var.environment}${var.rg_name_suffix != "" ? "-${var.rg_name_suffix}" : ""}", " ", ""), "--", "-"))
  location = var.location
  tags     = var.tags
}
