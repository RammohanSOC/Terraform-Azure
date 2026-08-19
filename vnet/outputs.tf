output "vnet_id" {
  description = "Resource ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "Address space of the Virtual Network"
  value       = azurerm_virtual_network.vnet.address_space
}
