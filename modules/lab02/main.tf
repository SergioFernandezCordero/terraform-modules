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

resource "random_integer" "rand" {
  max = 99999
  min = 10000
}

resource "azurerm_resource_group" "lab02" {
  location = var.location
  name = var.rg_name
}

resource "azurerm_storage_account" "sa" {
  resource_group_name = azurerm_resource_group.lab02.name
  location            = azurerm_resource_group.lab02.location
  account_replication_type = "LRS"
  account_tier = "Standard"
  name = "${lower(var.naming_prefix)}${random_integer.rand.result}"
}

resource "azurerm_storage_container" "lab02" {
  name = "terraform-state"
  storage_account_id = azurerm_storage_account.sa.id
}

data "azurerm_storage_account_sas" "sas" {
  connection_string = azurerm_storage_account.sa.primary_connection_string
  https_only = true
  expiry = timeadd(timestamp(), "17000h")
  start = timestamp()
  permissions {
    add     = false
    create  = true
    delete  = true
    filter  = false
    list    = false
    process = false
    read    = true
    tag     = false
    update  = false
    write   = true
  }
  resource_types {
    container = true
    object    = true
    service   = true
  }
  services {
    blob  = true
    file  = false
    queue = false
    table = false
  }
}

resource "local_file" "post-config" {
  depends_on = [azurerm_storage_container.lab02]
  filename = "${path.module}/backend-config.txt"
  content = <<EOF
storage_account_name = "${azurerm_storage_account.sa.name}"
container_name = "terraform-state"
key = "terraform.tgstate"
sas_token = "${data.azurerm_storage_account_sas.sas.sas}"

  EOF
}