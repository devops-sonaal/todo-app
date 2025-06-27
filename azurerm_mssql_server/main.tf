resource "azurerm_mssql_server" "mssql" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.vm_username.value
  administrator_login_password = data.azurerm_key_vault_secret.vm_password.value
  minimum_tls_version          = var.minimum_tls_version 

}

