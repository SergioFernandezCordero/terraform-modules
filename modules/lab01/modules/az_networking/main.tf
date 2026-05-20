resource "azurerm_virtual_network" "lab01-network" {
  name = "lab01-network"
  location = var.rg_location
  resource_group_name = var.rg_name
  address_space = ["10.0.0.0/16"]
  subnet {
    name = "lab01-subnet01"
    address_prefixes = ["10.0.1.0/24"]
  }
  tags = {
    environment = "laboratory01"
  }
}
