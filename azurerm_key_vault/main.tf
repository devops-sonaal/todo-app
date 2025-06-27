# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "org_key_vault" {
#   name                        = var.name
#   location                    = var.location
#   resource_group_name         = var.resource_group_name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"

#   # Enable public access (allows access over internet)
#   public_network_access_enabled = true

#   # Enable RBAC instead of Access Policies
#   enable_rbac_authorization = true
# }

# resource "azurerm_role_assignment" "key_vault_admin" {
#   scope                = azurerm_key_vault.org_key_vault.id
#   role_definition_name = "Key Vault Administrator"
#   principal_id         = data.azurerm_client_config.current.object_id
# }