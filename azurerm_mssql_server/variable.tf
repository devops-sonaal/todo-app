variable "name" {
  description = "mssql server name"
  type = string
}

variable "location" {}
variable "resource_group_name" {}
variable "administrator_login" {}
variable "administrator_login_password" {}

variable "minimum_tls_version" {}