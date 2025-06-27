terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
    features {}
  # Configuration options
  subscription_id = "53e4f20f-51c0-49dc-8d0b-5e0d60530fbe"
}