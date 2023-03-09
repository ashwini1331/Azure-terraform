data "azurerm_resource_group" "Demo_Dev_RG" {
  name = "POC-UAT-RG01"
}

resource "azurerm_virtual_network" "Demo_Dev_Vnet" {
  name                = var.Demo-Dev-Vnet           
  resource_group_name = data.azurerm_resource_group.Demo_Dev_RG.name
  location            = data.azurerm_resource_group.Demo_Dev_RG.location
  address_space       = [var.address_space]
}
resource "azurerm_subnet" "Demo_Dev_Subnet" {
  count                = length(local.subnet_name)
  name                 = local.subnet_name[count.index]
  resource_group_name  = data.azurerm_resource_group.Demo_Dev_RG.name
  virtual_network_name = azurerm_virtual_network.Demo_Dev_Vnet.name
  address_prefixes     = [local.address_prefixes[count.index]]
}
resource "azurerm_network_security_group" "Demo_dev_nsg" {
  name                = var.Demo_dev_nsg
  location            = data.azurerm_resource_group.Demo_Dev_RG.location
  resource_group_name = data.azurerm_resource_group.Demo_Dev_RG.name
}
resource "azurerm_network_security_rule" "Demo_dev_nsg_rules" {
  for_each                    = local.nsgrules
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = data.azurerm_resource_group.Demo_Dev_RG.name
  network_security_group_name = azurerm_network_security_group.Demo_dev_nsg.name
}
resource "azurerm_network_interface" "Demo_Dev_Network_interface" {
  count               = length(local.ip_config)
  name                = local.network_interface[count.index]
  location            = data.azurerm_resource_group.Demo_Dev_RG.location
  resource_group_name = data.azurerm_resource_group.Demo_Dev_RG.name

  ip_configuration {
    name                          = local.ip_config[count.index]
    subnet_id                     = azurerm_subnet.Demo_Dev_Subnet[count.index].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface_security_group_association" "Demo-Dev-Nsg-associate" {
  count                     = length(local.network_interface)
  network_interface_id      = element(azurerm_network_interface.Demo_Dev_Network_interface.*.id, count.index)
  network_security_group_id = element(azurerm_network_security_group.Demo_dev_nsg.*.id, count.index)
}
resource "azurerm_virtual_machine" "Demo_Dev_virtual_Machine" {
  count                            = length(local.linux_vm_name)
  name                             = local.linux_vm_name[count.index]
  location                         = data.azurerm_resource_group.Demo_Dev_RG.location
  resource_group_name              = data.azurerm_resource_group.Demo_Dev_RG.name
  network_interface_ids            = [element(azurerm_network_interface.Demo_Dev_Network_interface.*.id, count.index)]
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  vm_size                          = local.linux_vm_size[count.index]

  storage_os_disk {
    name              = local.linux_osdisk_name[count.index]
    caching           = var.linux_caching
    create_option     = var.linux_create_option
    managed_disk_type = var.linux_storage_account_type
  }

  storage_image_reference {
    publisher = local.linux_publisher[count.index]
    offer     = local.linux_offer[count.index]
    sku       = local.linux_sku[count.index]
    version   = var.linux_version
  }
  os_profile {
    computer_name  = var.computer_name
    admin_username = var.linux_admin_username
    admin_password = var.linux_admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

}