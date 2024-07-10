module "rgroup-n01656509" {
  source = "./modules/rgroup-n01656509"
  resource_group_name = "n01656509-RG"  
  location  = "Canada Central"  
}
module "network-n01656509" {
  source                = "./modules/network-n01656509"
  vnet_name             = "n01656509-VNET"
  vnet_address_space    = ["10.0.0.0/16"]
  location              = module.rgroup-n01656509.location
  resource_group_name   = module.rgroup-n01656509.resource_group_name
  subnet_name           = "n01656509-SUBNET"
  subnet_address_prefix = ["10.0.1.0/24"]
  nsg_name              = "n01656509-nsg"
}
module "common-n01656509" {
  source = "./modules/common-n01656509"
  location            = module.rgroup-n01656509.location
  resource_group_name = module.rgroup-n01656509.resource_group_name
}
module "vmlinux-n01656509" {
  source              = "./modules/vmlinux-n01656509"
  location            = module.rgroup-n01656509.location
  resource_group_name = module.rgroup-n01656509.resource_group_name
  subnet_id           = module.network-n01656509.subnet_id
  storage_account_uri = module.common-n01656509.primary_blob_endpoint
  admin_username      = "n01656509"
  public_key     = "/Users/n01656509/.ssh/id_rsa.pub"
  private_key    = "/Users/n01656509/.ssh/id_rsa"
  linux_avs           = "Linux_avs"
  linux_vms           = { "linux-vm1" = "dns1", "linux-vm2" = "dns2", "linux-vm3" = "dns3" }
}
module "vmwindows-n01656509" {
  source              = "./modules/vmwindows-n01656509"
  resource_group_name = module.rgroup-n01656509.resource_group_name
  location            = module.rgroup-n01656509.location
  subnet_id           = module.network-n01656509.subnet_id
  storage_account_uri = module.common-n01656509.primary_blob_endpoint
  admin_username      = "n01656509"
  admin_password      = "Humber@123"  
  windows_avs         = "Windows_avs"
}
module "datadisk-n01656509" {
  source              = "./modules/datadisk-n01656509"
  location            = module.rgroup-n01656509.location
  resource_group_name = module.rgroup-n01656509.resource_group_name
  linux_vm_ids        = module.vmlinux-n01656509.vm_ids
  windows_vm_id       = module.vmwindows-n01656509.vm_id[0]
}
module "loadbalancer-n01656509" {
  source              = "./modules/loadbalancer-n01656509"
  location            = module.rgroup-n01656509.location
  resource_group_name = module.rgroup-n01656509.resource_group_name
  linux_nic_ids       = module.vmlinux-n01656509.nic_ids
}
module "database-n01656509" {
  source              = "./modules/database-n01656509"
  location            = module.rgroup-n01656509.location
  resource_group_name = module.rgroup-n01656509.resource_group_name
  db_username         = "psqladmin"
  db_password         = "Humber@123"
}

