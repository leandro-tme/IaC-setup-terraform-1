output "aks-aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster

}


output "aks_kubeconfig" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true 
}
