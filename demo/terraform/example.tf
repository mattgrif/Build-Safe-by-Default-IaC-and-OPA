# # Create a resource group
# resource "azurerm_resource_group" "rg-examplehuman" {
#   name     = "rg-examplehuman"
#   location = "East US"
#   tags = {
#     environment = "Demo"
#   }
# }

# # Create a storage account with default configuration
# resource "azurerm_storage_account" "stexample" {
#   name                     = "stexample"
#   resource_group_name      = azurerm_resource_group.rg-examplehuman.name
#   location                 = azurerm_resource_group.rg-examplehuman.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "Demo"
#   }
# }

# Create a resource group for opa demo
resource "azurerm_resource_group" "rg-exampleopa-demo" {
  name     = "rg-exampleopa-demo"
  location = "East US"
  tags = {
    environment = "Demo"
  }
}

# Create a storage account for OPA Demo that fails using LRS
resource "azurerm_storage_account" "stexampleopa-demo" {
  name                     = "stexampleopa-demo"
  resource_group_name      = azurerm_resource_group.rg-exampleopa-demo.name
  location                 = azurerm_resource_group.rg-exampleopa-demo.location
  account_tier             = "Standard"
  account_replication_type = "GRS" # During demo change this from LRS to GRS to see the policy in action

  tags = {
    environment = "Demo"
  }
}