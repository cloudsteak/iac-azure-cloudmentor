# module "acr" {
#   source          = "../modules/acr"
#   subscription_id = var.subscription_id
#   location        = var.location
#   default_tags    = var.default_tags
#   rg_name         = var.acr_rg_name
#   name            = var.acr_name

# }


# KeyVault Module
module "KEY_VAULT" {
  source    = "../modules/keyvault"
  tenant_id = data.azurerm_client_config.current.tenant_id

  location     = var.location
  default_tags = var.default_tags
  rg_name      = var.kv_rg_name
  name         = var.kv_name
  sku_name     = var.kv_sku_name
}


# Invoke the AKS module
module "AKS" {
  source             = "../modules/aks"
  rg_name            = var.aks_rg_name
  location           = var.location
  name               = var.aks_name
  kubernetes_version = var.aks_kubernetes_version

  default_tags = var.default_tags
}

resource "azurerm_key_vault_secret" "kube_admin_config" {
  name         = "${var.aks_name}-kube-admin-config"
  key_vault_id = module.KEY_VAULT.key_vault_id

  # reference the AKS module output
  value      = module.AKS.kube_admin_config_raw
  depends_on = [module.AKS, azurerm_role_assignment.aks_kv_secrets, azurerm_role_assignment.terraform_keyvault]
}

resource "azurerm_key_vault_secret" "kube_client_certificate" {
  name         = "${var.aks_name}-client-certificate"
  key_vault_id = module.KEY_VAULT.key_vault_id

  value      = module.AKS.client_certificate
  depends_on = [module.AKS, azurerm_role_assignment.aks_kv_secrets, azurerm_role_assignment.terraform_keyvault]
}

resource "azurerm_key_vault_secret" "kube_config_raw" {
  name         = "${var.aks_name}-kube-config"
  key_vault_id = module.KEY_VAULT.key_vault_id

  value      = module.AKS.kube_config_raw
  depends_on = [module.AKS, azurerm_role_assignment.aks_kv_secrets, azurerm_role_assignment.terraform_keyvault]
}


resource "azurerm_role_assignment" "aks_kv_secrets" {
  scope                = module.KEY_VAULT.key_vault_id
  role_definition_name = "Key Vault Secrets User" # or "Key Vault Secrets Officer"
  principal_id         = module.AKS.cluster_identity_id
  depends_on           = [module.AKS, module.KEY_VAULT]
}

resource "azurerm_role_assignment" "terraform_keyvault" {
  scope                = module.KEY_VAULT.key_vault_id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
  depends_on           = [module.AKS, module.KEY_VAULT]
}
