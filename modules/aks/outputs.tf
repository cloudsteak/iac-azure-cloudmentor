# Output for kubeconfig
output "kube_admin_config_raw" {
  description = "Admin kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}


output "cluster_identity_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id

  sensitive = true
}
