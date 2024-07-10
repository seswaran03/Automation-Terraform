terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01656509RG"
    storage_account_name = "tfstaten01656509sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}
