resource "azurerm_subnet" "subnet_todo" {
  name                 = var.name
  resource_group_name  = var.azurerm_resource_group
  virtual_network_name = var.azurerm_virtual_network
  address_prefixes     = var.address_prefixes

}
resource "azurerm_subnet_network_security_group_association" "subnet_assoc" {
  subnet_id                 = azurerm_subnet.subnet_todo.id
  network_security_group_id = data.azurerm_network_security_group.todo_nsg.id 
}



