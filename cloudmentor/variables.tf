variable "subscription_id" {
  type        = string
  description = "value of the Azure subscription ID"

}

variable "location" {
  type        = string
  description = "value of the Azure location"

}

variable "default_tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."

}

variable "acr_rg_name" {
  type        = string
  description = "Name of the resource group for the ACR"

}

variable "acr_name" {
  type        = string
  description = "Name of the ACR"

}


variable "kv_rg_name" {
  type        = string
  description = "Name of the resource group for the KeyVault"

}
variable "kv_name" {
  type        = string
  description = "Name of the KeyVault"

}
variable "kv_sku_name" {
  type        = string
  description = "SKU name for the KeyVault"
  default     = "standard"
}

variable "aks_kubernetes_version" {
  type        = string
  description = "Kubernetes version for the AKS"

}


variable "aks_rg_name" {
  type        = string
  description = "Name of the resource group for the AKS"

}
variable "aks_name" {
  type        = string
  description = "Name of the AKS"

}
