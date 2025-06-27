module "rg_todo" {
 source = "../azurerm_resource_group"
 rg_name = "todoapp_rg" 
 rg_location = "West US"
}

module "vnet_todo" {
  depends_on = [ module.rg_todo ]
    source = "../azurerm_virtual_network"
    name = "todo_vnet"
    location = "West US"
    resource_group_name =  "todoapp_rg" 
  address_space = ["10.0.0.0/16"]
}

module "frontend_subnet_todo" {
  depends_on = [ module.vnet_todo, module.rg_todo, module.nsg_frontend ]
  source = "../azurerm_subnet"
  name = "frontend_subnet_todo"
  azurerm_resource_group = "todoapp_rg"
  azurerm_virtual_network = "todo_vnet"
  address_prefixes = ["10.0.1.0/24"]
  nsgname = "frontendnsg"
  
}

module "backend_subnet_todo" {
  depends_on = [ module.vnet_todo, module.rg_todo, module.nsg_backend]
  source = "../azurerm_subnet"
  name = "backend_subnet_todo"
  azurerm_resource_group = "todoapp_rg"
  azurerm_virtual_network = "todo_vnet"
  address_prefixes = ["10.0.2.0/24"]
  nsgname = "backendnsg"

}

module "frontend_VM" {
 depends_on = [ module.rg_todo,module.vnet_todo, module.frontend_subnet_todo ]
 source = "../azurerm_virtual_machine"
 name = "frontend_nic"
 location = "West US"
 resource_group_name =  "todoapp_rg" 
 vm_name = "frontendVM"
 vm_size = "Standard_B1s"
#  admin_username = ?
#  admin_password = "P@ssword123#"
 caching = "ReadWrite"
 storage_account_type = "Standard_LRS"
 publisher = "Canonical"
offer = "0001-com-ubuntu-server-focal"
 sku = "20_04-lts"
 subnet_todo = "frontend_subnet_todo"
 todo_vnet = "todo_vnet"
 pub_ip = "frontend_VM_public_ip"
 
}

module "frontend_VM_public_ip" {
  depends_on = [ module.rg_todo ]
  source = "../azurerm_public_ip"
  public_ip = "frontend_VM_public_ip"
  resource_group_name = "todoapp_rg" 
  location = "West US"
  allocation_method = "Static"

}


module "backend_VM" {
 depends_on = [ module.rg_todo, module.vnet_todo, module.backend_subnet_todo]
 source = "../azurerm_virtual_machine"
 name = "backend_nic"
 location = "West US"
 resource_group_name =  "todoapp_rg" 
 vm_name = "backendVM"
 vm_size = "Standard_B1s"
#  admin_username = ?
#  admin_password = ?
 caching = "ReadWrite"
 storage_account_type = "Standard_LRS"
 publisher = "Canonical"
 offer = "0001-com-ubuntu-server-focal"
 sku = "20_04-lts"
 subnet_todo = "backend_subnet_todo"
 todo_vnet = "todo_vnet"
 pub_ip = "backend_VM_public_ip"
 
 
  
}

module "backend_VM_public_ip" {
  depends_on = [ module.rg_todo ]
  source = "../azurerm_public_ip"
  public_ip = "backend_VM_public_ip"
  resource_group_name = "todoapp_rg" 
  location = "West US"
  allocation_method = "Static"

}

module "mssql_server" {
  depends_on = [ module.rg_todo ]
  source = "../azurerm_mssql_server"
  name = "mssqlsrv012"
  location = "West US"
  resource_group_name = "todoapp_rg"
  # administrator_login = "missadministrator"
  # administrator_login_password = "thisIsKat11"
  minimum_tls_version  = "1.2"
   
}

module "dbsrv" {
depends_on = [ module.mssql_server ]
source = "../azurerm_mssql_database"  
name_db = "tododb01"
rgname =  "todoapp_rg"
sql_server_name = "mssqlsrv012"

}

module "nsg_frontend" {
  depends_on = [ module.rg_todo ]
  source = "../azurerm_network_security_group"
  name = "frontendnsg"
  location = "West US"
  azurerm_resource_group = "todoapp_rg"
}

module "nsg_backend" {
  depends_on = [ module.rg_todo,]
  source = "../azurerm_network_security_group"
  name = "backendnsg"
  location = "West US"
  azurerm_resource_group = "todoapp_rg"   
}

# module "Key_vault_org" {
#   source = "../azurerm_key_vault"
#   depends_on = [ module.rg_todo ]
#   name = "keyvaultorg"
#   location = "West US"
#   resource_group_name = "todoapp_rg" 
  
# }
