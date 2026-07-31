# Example Terraform code used in presentation

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg-example" {
  name     = "rg-example"
  location = "East US"
}

# Create a storage account with default configuration
resource "azurerm_storage_account" "stexample" {
  name                     = "stexample"
  resource_group_name      = azurerm_resource_group.rg-example.name
  location                 = azurerm_resource_group.rg-example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Demo"
  }
}
