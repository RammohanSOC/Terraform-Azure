terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_local_network_gateway" "lng" {
  name                = var.local_network_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  gateway_address = var.gateway_address
  address_space   = var.address_space
}
