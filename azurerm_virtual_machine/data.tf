data "azurerm_subnet" "subnet" {
  name                 = var.subnet_todo
  virtual_network_name = var.todo_vnet
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "publicip" {
  name                = var.pub_ip
  resource_group_name = var.resource_group_name
}

