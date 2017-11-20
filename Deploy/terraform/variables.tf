variable "prefix" {
  description = "A prefix used for all resources in this example"
}

variable "resource_group_name" {
  description = "AKS and ACR resource group name"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "env_tag" {
  description = "AKS cluster environment"
}

variable "kube_version" {
  description = "AKS kubernetes version"
  default = "1.12.7"
}

variable "ssh_public_key" {
  default = "id_rsa.pub"
}

variable "admin_username" {
  default = "kube-root-admin"
}

variable "agent_count" {
  description = "Number of Cluster Agent Nodes (GPU Quota is defaulted to only 1 Standard_NC6 per subscription) - Please view https://docs.microsoft.com/en-us/azure/aks/faq#are-security-updates-applied-to-aks-agent-nodes"
}

variable "azurek8s_sku" {
  description = "Sku of Cluster node- Recommend -Standard_F4s_v2- for normal and -Standard_NC6- for GPU (GPU Quota is defaulted to only 1 per subscription) Please view Azure Linux VM Sizes at https://docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes"
}

variable "acr_sku_name" {
  description = "The Azure Container Registry SKU name"
  default = "Basic"
}

variable "aks_os_disk_size" {
  description = "AKS Agent Pool machine node volume disk size"
  default = 30
}
