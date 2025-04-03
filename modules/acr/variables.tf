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
# ACR Inputs #
##############

variable "rg_name" {
  type        = string
  description = "Name of the resource group for the ACR"
}

variable "name" {
  type        = string
  description = "Name of the ACR"
  
}
