output "id" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.id}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.kube_config_raw}"
}

output "client_key" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key}"
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate}"
}

output "cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate}"
}

output "host" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host}"
}

output "subnet_id" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.agent_pool_profile.0.vnet_subnet_id}"
}

output "network_plugin" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.network_profile.0.network_plugin}"
}

output "network_policy" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.network_profile.0.network_policy}"
}

output "service_cidr" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.network_profile.0.service_cidr}"
}

output "dns_service_ip" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.network_profile.0.dns_service_ip}"
}

output "docker_bridge_cidr" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.network_profile.0.docker_bridge_cidr}"
}

output "pod_cidr" {
  value = "${azurerm_kubernetes_cluster.aks_cluster.network_profile.0.pod_cidr}"
}

output "login_server" {
  value = "${azurerm_container_registry.acr-instance.login_server}"
}