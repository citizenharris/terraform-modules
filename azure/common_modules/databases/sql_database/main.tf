module "sql_database_sizes" {
  source = "../sql_database_sizes"
}

# even though `azurerm_sql_database` is deprecated and they recommend using `azurerm_mssql_database`
# we can't use `azurerm_mssql_database` for our use case because there's a bug which would not allow
# us to change max size of the database: https://github.com/terraform-providers/terraform-provider-azurerm/issues/8890
resource "azurerm_sql_database" "sql_database" {
  name                             = var.database_name
  resource_group_name              = var.resource_group
  location                         = var.location
  server_name                      = var.server_name
  requested_service_objective_name = module.sql_database_sizes.sku[var.dtu]
  max_size_bytes                   = module.sql_database_sizes.size[var.max_size]
  # This is the default collation, but we set it explicitly anyway so we know all Azure database will 
  # have the same collation as the old on-prem database.  The collations must match for migrations to work
  collation = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}
