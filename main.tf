terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
  subscription_id = "b0291c04-e9d0-47f2-98e8-093ac745e344"

}
module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  resource_group_name = "networking-rg"
  location           = "UK South"
  vnet_address_space = ["10.0.0.0/16"]

  
}
module "aks_cluster" {

  source = "./aks-cluster-module"

  dns_prefix = "myaks-project"
  service_principle_client_id = var.client_id
  service_principle_secret = var.client_secret


  resource_group_name         = module.networking.resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  








  


}