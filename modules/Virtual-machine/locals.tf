locals {
  nsgrules = {
    rdp = {
      name                       = "SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
    http = {
      name                       = "http"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "10.0.0.0/24"
    }
    Demorule = {
      name                       = "Demorule"
      priority                   = 102
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  subnet_name       = ["Demo-Dev-Subnet-ubuntu-vm", "Demo-Dev-Subnet-Rhel-vm", "Demo-Dev-Subnet-centos-vm"]
  address_prefixes  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  network_interface = ["Demo-Dev-Network-interface-ubuntu", "Demo-Dev-Network-interface-Rhel", "Demo-Dev-Network-interface-centos"]
  ip_config         = ["testconfiguration1", "testconfiguration2", "testconfiguration3"]
  linux_publisher   = ["Canonical", "RedHat", "OpenLogic"]
  linux_offer       = ["UbuntuServer", "RHEL", "CentOS"]
  linux_sku         = ["18.04-LTS", "8.1", "7_9-gen2"]
  linux_vm_name     = ["UbuntuServer", "RHEL", "CentOS"]
  delegation        = ["test1", "test2", "test3"]
  linux_osdisk_name = ["Demo-dev-os-disk-UbuntuServer", "Demo-dev-os-disk-RHEL", "Demo-dev-os-disk-CentOS"]
  linux_vm_size     = ["Standard_DS1_v2", "Standard_DS1_v2", "Standard_DS1_v2"]

}