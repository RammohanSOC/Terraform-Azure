output "virtual_network_id" {
  description = "ID of the Virtual Network."
  value       = azurerm_virtual_network.this.id
}

output "virtual_network_name" {
  description = "Name of the Virtual Network."
  value       = azurerm_virtual_network.this.name
}

output "virtual_network_address_space" {
  description = "Address space of the Virtual Network."
  value       = azurerm_virtual_network.this.address_space
}

output "subnet_ids" {
  description = "Map of subnet names to subnet IDs."

  value = {
    for name, subnet in module.subnet :
    name => subnet.id
  }
}

output "subnet_names" {
  description = "Map of subnet names."

  value = {
    for name, subnet in module.subnet :
    name => subnet.name
  }
}

output "route_table_ids" {
  description = "Map of route table names to IDs."

  value = {
    for name, route_table in azurerm_route_table.this :
    name => route_table.id
  }
}

output "peering_ids" {
  description = "Map of peering names to IDs."

  value = {
    for name, peering in azurerm_virtual_network_peering.this :
    name => peering.id
  }
}
