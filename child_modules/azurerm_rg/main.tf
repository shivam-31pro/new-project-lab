variable "a_rgs"{}
resource "azurerm_resource_group" "rgs"{
    for_each=var.a_rgs
    name=each.value.name
    location=each.value.location
}