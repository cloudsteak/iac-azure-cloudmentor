resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name}"
  location = var.location
  tags = var.default_tags
}

# Add resource lock on Docker resource group
resource "azurerm_management_lock" "acr_lock" {
  name       = "DeleteLockAKSAcr"
  scope      = azurerm_container_registry.acr.id
  lock_level = "CanNotDelete"
  notes      = "This lock is to prevent user deletion of the ACR resource group"
  
  timeouts {
    create = "30m"
    delete = "30m"
  }
}


resource "azurerm_container_registry" "acr" {
  name                = "${var.name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Basic"
  admin_enabled       = true
  tags = var.default_tags
}
