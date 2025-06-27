data "azurerm_subnet" "subnet" {
  name                 = var.subnet_todo
  virtual_network_name = var.todo_vnet
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "publicip" {
  name                = var.pub_ip
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  name                = "keyvault12"
  resource_group_name = "key-vault"
}

data "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-usename"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
