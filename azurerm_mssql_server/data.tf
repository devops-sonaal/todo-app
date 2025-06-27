data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault" "key_vault" {
  name                = "keyvault12"
  resource_group_name = "key-vault"
}

data "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-usename"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}