
data "azurerm_subnet" "dsubnet" {
  for_each =var.myvm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "dpip" {
  for_each = var.myvm
  name                = each.value.public_pip_name
  resource_group_name = each.value.resource_group_name
}