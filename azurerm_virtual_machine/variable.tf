variable "name" {
    description = "nic-name"
    type = string  
}
variable "location" {
  description = "nic - locatoin"
    type = string
}

variable "resource_group_name" {}
variable "subnet_todo" {}
variable "todo_vnet" {}

variable "pub_ip" {}


variable "vm_name" {  }
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {}
variable "caching" {}
variable "storage_account_type" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}


