a_rgs = {
  rg_alpha1 = {
    name     = "alpha1"
    location = "eastus2"
  }
  rg_alpha2 = {
    name     = "alpha2"
    location = "eastus2"
  }
}
vnet = {
  vnet_a = {
    name                = "alpha_vnet1"
    location            = "eastus2"
    resource_group_name = "alpha1"
    address_space       = ["10.0.0.0/16"]
  }
  vnet_b = {
    name                = "alpha_vnet2"
    location            = "eastus2"
    resource_group_name = "alpha1"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                = "frontend_subnet"
    location            = "eastus2"
    resource_group_name = "alpha1"
      virtual_network_name="alpha_vnet1"
     address_prefixes       = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                = "backend_subnet"
    location            = "eastus2"
    resource_group_name = "alpha1"
      virtual_network_name="alpha_vnet1"
     address_prefixes       = ["10.0.2.0/24"]
  }
}
pip = {
  pip_a = {
    name                = "alpha_pip1"
    resource_group_name = "alpha1"
    location            = "eastus2"
    allocation_method   = "Static"
  }
  pip_b = {
    name                = "alpha_pip2"
    resource_group_name = "alpha1"
    location            = "eastus2"
    allocation_method   = "Static"
  }
}
myvm = {
  vm1 = {
    name                            = "alpha-nic1"
    location                        = "eastus2"
    resource_group_name             = "alpha1"
    ipcon_name                      = "internal"
    private_ip_address_allocation   = "Dynamic"
    subnet_name                     = "frontend_subnet"
    virtual_network_name            = "alpha_vnet1"
    public_pip_name                 = "alpha_pip1"
    vm_name                         = "dhurandar1"
    size                            = "Standard_D2s_v3"
    admin_username                  = "Shivam_vm1"
    admin_password                  = "Shivam@2026"
    disable_password_authentication = "false"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
  vm2 = {
    name                            = "alpha-nic2"
    location                        = "eastus2"
    resource_group_name             = "alpha1"
    ipcon_name                      = "internal2"
    private_ip_address_allocation   = "Dynamic"
    subnet_name                     = "backend_subnet"
    virtual_network_name            = "alpha_vnet1"
    public_pip_name                 = "alpha_pip2"
    vm_name                         = "dhurandar2"
    size                            = "Standard_D2s_v3"
    admin_username                  = "Shivam_vm2"
    admin_password                  = "Shivam@2026"
    disable_password_authentication = "false"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}
