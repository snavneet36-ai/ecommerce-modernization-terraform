terraform {
  backend "azurerm" {
    resource_group_name  = "rg-ecommerce-modernization-dev"
    storage_account_name = "tfstateecomdev00001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}