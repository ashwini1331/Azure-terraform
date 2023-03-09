module "virtual_machine" {
  source                     = "./modules/Virtual-machine"
  computer_name              = var.computer_name
  linux_admin_username       = var.linux_admin_username
  linux_storage_account_type = var.linux_storage_account_type
  Demo_dev_nsg               = var.Demo_dev_nsg
  linux_admin_password       = var.linux_admin_password
  linux_version              = var.linux_version
  address_space              = var.address_space
  Demo-Dev-Vnet              = var.Demo_Dev_Vnet
  linux_caching              = var.linux_caching
  linux_create_option        = var.linux_create_option
}

module "SQL_DB" {
  source = "./modules/SQL-DB"
}