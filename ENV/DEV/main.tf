module "rgs_module" {
  source = "../../Module/Resource_Group"
  rgs = var.pvrgs
}

module "vnet_module"{
  source = "../../Module/vnet"
  vnets = var.pvvnets
  depends_on = [ module.rgs_module ]
}
module "pip_module" {
  source = "../../Module/Public_IP"
  pips = var.pvpips
  depends_on = [ module.rgs_module ]
}
module "nic_module" {
  source = "../../Module/NIC"
  nics = var.pvnics
  depends_on = [
    module.rgs_module,
    module.vnet_module,
    module.pip_module
  ]
}
module "vm_module" {
  source = "../../Module/VM"
  vms = var.pvvms
  depends_on = [
    module.rgs_module,
    module.nic_module
  ]
}