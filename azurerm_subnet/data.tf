data "azurerm_network_security_group" "todo_nsg" {
  name                = var.nsgname
  resource_group_name = var.azurerm_resource_group
}