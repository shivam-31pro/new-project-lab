subnet= {
subnet1={
    name                = "frontend_subnet"
  location            = "eastus2"
  resource_group_name = "alpha1"
  virtual_network_name="alpha_vnet1"
   address_prefixes       = ["10.0.1.0/24"]
}
subnet2={
    name                = "backend_subnet"
  location            = "eastus2"
  resource_group_name = "alpha1"
    virtual_network_name="alpha_vnet2"
   address_prefixes        = ["10.0.2.0/24"]
}
}