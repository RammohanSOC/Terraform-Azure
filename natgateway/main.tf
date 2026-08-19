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

resource "azurerm_nat_gateway" "nat" {
  name                = var.nat_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip" {
  nat_gateway_id       = azurerm_nat_gateway.nat.id
  public_ip_address_id = var.public_ip_id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_nat" {
  subnet_id      = var.subnet_id
  nat_gateway_id = azurerm_nat_gateway.nat.id
}
