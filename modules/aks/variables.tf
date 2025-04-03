################
# Basic Inputs #
################

variable "location" {
  type        = string
  description = "value of the Azure location"
}

variable "default_tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."
  
}

 
##############
# AKS Inputs #
##############

variable "rg_name" {
  type        = string
  description = "Name of the resource group for the AKS"
}

variable "name" {
  type        = string
  description = "Name of the AKS"
  
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS"
  default = "mentor"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for the AKS"
}
