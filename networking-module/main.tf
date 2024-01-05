resource "azurerm_resource_group""azure_resource_name"{

    

    name = var.resource_group_name
    location = var.location

  
}

resource "azurerm_virtual_network""aks-vnet" {
  name  = "aks-vnet"
  address_space = var.vnet_address_space
  resource_group_name = azurerm_resource_group.azure_resource_name.name 
  location = var.location
}

resource "azurerm_subnet""control_plane_subnet" {
  name  = "control_plane_subnet"
  resource_group_name = azurerm_resource_group.azure_resource_name.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes = ["10.0.1.0/24"]

}

resource "azurerm_subnet""worker-node-subnet" {
    name  = "worker_plane_subnet"
    resource_group_name = azurerm_resource_group.azure_resource_name.name  
    virtual_network_name = azurerm_virtual_network.aks-vnet.name
    address_prefixes = ["10.0.2.0/24"]
  
}

resource "azurerm_network_security_group""aks-nsg" {



    name = "aks network security group"
    location = var.location
    resource_group_name = azurerm_resource_group.azure_resource_name.name 


   


    security_rule{
        name                       = "kube-apiserver"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_address_prefix      = "31.121.129.114/32"
        destination_port_range     = "443"
        destination_address_prefix  = "*"
        

    }

    security_rule{
        name                       = "ssh-rule"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        destination_address_prefix  = "*"
        
        
    }

    
  
}