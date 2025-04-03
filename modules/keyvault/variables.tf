################
# Basic Inputs #
################

variable "tenant_id" {
  type        = string
  description = "value of the Azure tenant ID"
  
}

variable "location" {
  type        = string
  description = "value of the Azure location"
}

variable "default_tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."

}


###################
# KeyVault Inputs #
###################

variable "rg_name" {
  type        = string
  description = "Name of the resource group for the KeyVault"
}

variable "name" {
  type        = string
  description = "Name of the KeyVault"

}


variable "sku_name" {
  type        = string
  description = "SKU name for the KeyVault"
  default     = "standard"
}
