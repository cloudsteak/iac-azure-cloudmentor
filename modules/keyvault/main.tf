resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name}"
  location = var.location
  tags = var.default_tags
}

resource "azurerm_key_vault" "this" {
  name                = var.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = var.sku_name
  soft_delete_retention_days = 7
  enable_rbac_authorization = true
  tenant_id = var.tenant_id
}


