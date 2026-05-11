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

resource "azurerm_resource_group" "test" {
  location  = "westeurope"
  name      = "test-resource-group"
}

resource "azurerm_resource_group" "test2" {
  location  = "westeurope"
  name      = "test-resource-group2"
  tags = {
    dependency = "azurerm_resource_group.test"
  }
}

resource "azurerm_resource_group" "test3" {
  location  = "westeurope"
  name      = "test-resource-group3"
  depends_on = [
    azurerm_resource_group.test,
    azurerm_resource_group.test2
  ]
}

variable "image_id" {
  type = string
  description = "Identificador absurdo"
  default = "mengano"
  validation {
    condition = length(var.image_id) > 5
    error_message = "La cagaste Burt Lancaster"
  }
}

locals {
  name = "antofagasto"
  tag = "manolo"
}

resource "azurerm_resource_group" "sample" {
  location  = "westeurope"
  name      = var.image_id
}

resource "azurerm_resource_group" "sample2" {
  location  = "westeurope"
  name      = "${var.image_id}_tonoto"
}

resource "azurerm_resource_group" "sample3" {
  location  = "westeurope"
  name      = "${var.image_id}_tonoto"
  tags = {
    "team" = local.tag
  }
}

resource "azurerm_resource_group" "sample4" {
  count = 0
  location  = "westeurope"
  name      = "${var.image_id}_tonoto_${count.index}"
  tags = {
    "team" = local.tag
  }
}

locals {
  names = {
    name01 = "1",
    name02 = "2",
    name03 = "3"
  }
}

resource "azurerm_resource_group" "sample5" {
  for_each = local.names
  location  = "westeurope"
  name      = "${var.image_id}_tonoto_${each.value}"
  tags = {
    "team" = local.tag
  }
}

locals {
  nombres = ["manolo", "pepe", "juan"]
  mayus = [for i in local.nombres: title(i)]
}

output "output_example" {
  value = azurerm_resource_group.test.name
}

output "output_image" {
  value = var.image_id
}

output "output_list" {
  value = local.mayus
}