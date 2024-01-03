variable "resource_group_name"{
    description = "the azure resource group where the networking resources will be deployed/ "
    type = string
    default = "my-azure-resource-group"

}

variable "location" {

    description = "the azure region where the networking resource will be deployed to"
    type = string
    default = "UK South"
  
}


variable "vnet_address_space" {


    description = "the address space for the virtual network"
    type = list(string)
    default = [ "10.0.0.0/16" ]
  
}