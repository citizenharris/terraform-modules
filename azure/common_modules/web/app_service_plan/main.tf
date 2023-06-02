resource "azurerm_app_service_plan" "service_plan" {
  name                = lower(replace("asp-${var.application_name}-${var.environment}${var.plan_name_suffix != "" ? "-${var.plan_name_suffix}" : ""}", " ", ""))
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = var.tier
    size = var.size
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
