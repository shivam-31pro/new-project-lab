variable "myvm"{}

resource "azurerm_network_interface" "nic" {
  for_each = var.myvm
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name
    subnet_id                     = data.azurerm_subnet.dsubnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.dpip[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.myvm
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_username
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id]
  disable_password_authentication= each.value.disable_password_authentication
  


  os_disk {
    caching              = each.value.caching
        storage_account_type =each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}