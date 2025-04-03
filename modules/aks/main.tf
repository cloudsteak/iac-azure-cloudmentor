resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name}"
  location = var.location
  tags = var.default_tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  sku_tier = "Free"
  kubernetes_version = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  workload_identity_enabled = true
  oidc_issuer_enabled = true
  
  default_node_pool {
    name                = "systempool"
    vm_size             = "Standard_B2s"    # B2s
    node_count          = 1
    os_disk_size_gb = 64
    temporary_name_for_rotation = "systempool1"    
    orchestrator_version = var.kubernetes_version
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.default_tags
}


resource "azurerm_kubernetes_cluster_node_pool" "spotpool" {
  name                = "spotpool1"
  temporary_name_for_rotation = "spotpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size                = "Standard_D2s_v3"
  orchestrator_version   = var.kubernetes_version
  
  mode     = "User"
  node_count = 1
  
  # Spot configuration
  priority         = "Spot"
  eviction_policy  = "Delete"
  spot_max_price   = 0.015
  os_disk_size_gb = 64
  
  # Autoscaler settings
  auto_scaling_enabled = true
  min_count           = 1
  max_count           = 1

  # Optional: specify availability zones if needed
  # availability_zones = ["1", "2", "3"]

  # Provide any desired tags or node labels, if needed
  tags = var.default_tags
}
