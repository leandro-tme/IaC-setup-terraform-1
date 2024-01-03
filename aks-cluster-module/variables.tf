variable "aks_cluster_name" {

    description = "name of the AKS cluster you wish to create"
    type = string
    default = "aks-cluster"

  
}

variable "cluster_location" {

    description = " Azure region where the AKS cluster will be deployed to"
    type = string
    default = "UK South"

  
}
variable "dns_prefix" {

    description = "defines the DNS prefix of cluster"
    type = string
    

  
}

variable "kubernetes_version" {

    description = "specifies which Kubernetes version the cluster will use"
    type = string
    default = "1.29"

  
}

variable "service_principle_client_id" {

    description = "provides the Client ID for the service principal associated with the cluster"
    type = string
   

  
}

variable "service_principle_secret" {

    description = "value"
    type = string

  
}

# Networking Module Variables
variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the networking resources are provisioned."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network created in the networking module."
  type        = string
}

variable "control_plane_subnet_id" {
  description = "The ID of the control plane subnet within the VNet, created in the networking module."
  type        = string
}

variable "worker_node_subnet_id" {
  description = "The ID of the worker node subnet within the VNet, created in the networking module."
  type        = string
}