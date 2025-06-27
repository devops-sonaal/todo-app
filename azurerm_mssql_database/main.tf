resource "azurerm_mssql_database" "mssql01" {
  name      = var.name_db
  server_id = data.azurerm_mssql_server.mssql_server.id
}

data "azurerm_mssql_server" "mssql_server" {
  name                = var.sql_server_name
  resource_group_name = var.rgname
}
