variable "address_space" {
  description = "Create Vnet details IP address "
  type = string 
  default = ""
}
variable "Demo-Dev-Vnet" {
  description = "VNET name need to assign here "
  type = string 
  default = ""
  
}
variable "Demo_dev_nsg" {
  description = "Security group and firewall rules for virtual machine access"
  type        = string
  default     = ""
}
variable "computer_name" {
  description = "Give the computer name"
  type        = string
  default     = ""
}
variable "linux_admin_username" {
  description = "Username for Virtual Machine administrator account"
  type        = string
  default     = ""
}
variable "linux_admin_password" {
  type        = string
  default     = ""
  description = "Password for Virtual Machine administrator account"
}
variable "linux_storage_account_type" {
  description = "Provide strorage account type details"
  type        = string
  default     = ""
}
variable "linux_caching" {
  description = "Linux Caching details for Virtual machine creation"
  type = string
  default = ""
}
variable "linux_create_option" {
  description = "Linux image source for virtual machine"
  type = string 
  default = ""
}
variable "linux_version" {
  description = "Linux version"
  type        = string
  default     = ""

}

