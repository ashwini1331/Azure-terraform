variable "subscription_id" {
  description = "Provide your subscription ID for particuler azure account"
  default     = "3d3e800d-3830-4688-93bf-0532fb21dd76"
}
variable "tenant_id" {
  description = "Provide Your Tenant ID for particuler azure account"
  default     = "91f3867d-f3a0-41c5-94b6-fe6476f35d42"
}
variable "client_id" {
  description = "Provide Your Client ID for particuler azure account"
  default     = "9708207a-c57c-468a-b9c6-92b40e36d9b2"
}
variable "client_secret" {
  description = "Provide Your Client secret(password) for particuler azure account"
  default     = "ipH8Q~7xeKXFIXqYD7e_Oh8xurJyEFFHChyfdaDv"
}
variable "computer_name" {
  default = "linux-vm"
}
variable "linux_admin_username" {
  default = "azureuser"
}
variable "linux_storage_account_type" {
  default = "Standard_LRS"
}
variable "Demo_dev_nsg" {
  default = "Demo-Dev-Nsg"
}
variable "linux_admin_password" {
  default = "Password@1234"
}
variable "linux_version" {
  default = "latest"
}
variable "address_space" {
  default = "10.0.0.0/16"
}
variable "Demo_Dev_Vnet" {
  default = "Demo-Dev-Vnet"
}
variable "linux_caching" {
  default = "ReadWrite"
}
variable "linux_create_option" {
  default = "FromImage"
}