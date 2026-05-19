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
  location  = "westeurope"
  name      = "lab01"
}

resource "azurerm_virtual_network" "lab01-network" {
  name = "lab01-network"
  location = azurerm_resource_group.lab01.location
  resource_group_name = azurerm_resource_group.lab01.name
  address_space = ["10.0.0.0/16"]
  subnet {
    name = "lab01-subnet01"
    address_prefixes = ["10.0.1.0/24"]
  }
  tags = {
    environment = "laboratory01"
  }
}