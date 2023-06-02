resource "azurerm_storage_queue" "this" {
  name                 = "queue-${lower(replace(var.queue_name, " ", "-"))}-${var.environment}${var.suffix != "" ? "-${var.suffix}" : ""}"
  storage_account_name = var.storage_account_name
  metadata             = var.metadata
}
