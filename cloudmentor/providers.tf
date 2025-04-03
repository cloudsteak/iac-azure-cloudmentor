# Terraform configuration file for Azure provider
# This file is used to configure the Azure provider for Terraform.
# It specifies the required provider version and the subscription ID.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

