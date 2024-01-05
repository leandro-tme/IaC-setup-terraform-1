 variable "client_secret" {
    type = string
    default  = "2qB8Q~JOsna38M9koVDxCD7_DGXYtNR4QxW.qahR"
}

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
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