resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.cluster_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"  
    vnet_subnet_id = var.control_plane_subnet_id  
  }

  service_principal {
    client_id     = var.service_principle_client_id
    client_secret = var.service_principle_secret
  }

  network_profile {
    network_plugin = "azure"  
    
  }

}
