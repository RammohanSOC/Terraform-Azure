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

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = var.public_ip_id
  }
}
