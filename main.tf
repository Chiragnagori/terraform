terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.62.1"
    }
  }
}
provider "azurerm" {
  subscription_id = "ee22c8f0-93df-4b47-925a-d337fef522fe"
  features {}
}

module "rg_module" {
  source = "./modules/rg"
}

module "vnet_module" {
  source                  = "./modules/vnet"
  resource_group_name     = module.rg_module.resource_group_name
  resource_group_location = module.rg_module.resource_group_location
}

module "pub_ip" {
  source                  = "./modules/pubip"
  resource_group_name     = module.rg_module.resource_group_name
  resource_group_location = module.rg_module.resource_group_location

}
module "n_s_g" {
  source                  = "./modules/nsg"
  resource_group_name     = module.rg_module.resource_group_name
  resource_group_location = module.rg_module.resource_group_location
}

module "n_i_c" {
  source                  = "./modules/nic"
  resource_group_name     = module.rg_module.resource_group_name
  resource_group_location = module.rg_module.resource_group_location
  public_ip_address_id    = module.pub_ip.public_ip_address_id
  subnet_id               = module.vnet_module.subnet_id

}
module "vm" {
  source                  = "./modules/vm"
  resource_group_name     = module.rg_module.resource_group_name
  resource_group_location = module.rg_module.resource_group_location
  network_interface_ids   = module.n_i_c.network_interface_ids

}