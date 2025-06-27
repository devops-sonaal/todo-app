resource "azurerm_network_security_group" "todo_nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.azurerm_resource_group

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}