data "azurerm_client_config" "current" {}


data "azurerm_key_vault_secret" "kube_config" {
  name         = "${var.aks_name}-kube-config"
  key_vault_id = module.KEY_VAULT.key_vault_id
}
