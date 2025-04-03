locals {
  kubeconfig = yamldecode(data.azurerm_key_vault_secret.kube_config.value)
}
