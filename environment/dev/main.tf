module "rg" {
  source = "../../child_modules/azurerm_rg"
  a_rgs  = var.a_rgs
}

module "vnet" {
  source     = "../../child_modules/azurerm_vnet"
  depends_on = [module.rg]
  vnet       = var.vnet
}
module "subnet" {
  source     = "../../child_modules/azurerm_subnet"
  depends_on = [module.vnet]
  subnet     = var.subnet

}
module "pip" {
  source     = "../../child_modules/azurerm_pip"
  depends_on = [module.rg]
  pip        = var.pip
}
module "vm" {
  source     = "../../child_modules/azurerm_vm"
  depends_on = [module.subnet]
  myvm       = var.myvm
}