terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Remember doing az login with personal account
  subscription_id = "eed70993-f087-4634-bed2-6876855d18f8"
  tenant_id = "3524db84-f5fc-4b0c-93b9-8ffe2317bd86"
}

resource "azurerm_resource_group" "lab01" {
  location  = var.rg_location
  name      = var.rg_name
}

module "vnet" {
  source    = "Azure/avm-res-network-virtualnetwork/azurerm"
  version   = "0.17.1"
  location  = var.rg_location
  parent_id = azurerm_resource_group.lab01.id
  address_space = var.address_space
  name = var.vnet_name
}
