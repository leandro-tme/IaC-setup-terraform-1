output "vnet_id" {
  description = "will store the ID of the previously created VNet"
  value = azurerm_virtual_network.aks-vnet.id
}

output "control_plane_subnet_id" {
  description = "will hold the ID of the control plane subnet within the VNet"
  value = azurerm_subnet.control_plane_subnet.id
}

output "worker_plane_subnet_id" {
  description = "will store the ID of the worker node subnet within the VNet."
  value = azurerm_subnet.worker-node-subnet.id
}

output "networking_resource_group_name" {
  description = "will provide the name of the Azure Resource Group where the networking resources were provisioned in."
  value = azurerm_resource_group.azure_resource_name.name
}

output "aks_nsg_id" {
  description = "will store the ID of the Network Security Group (NSG)"
  value = azurerm_network_security_group.aks-nsg.id
}

