output "id" {
  description = "ID of the subnet."
  value       = azurerm_subnet.this.id
}

output "name" {
  description = "Name of the subnet."
  value       = azurerm_subnet.this.name
}

output "address_prefixes" {
  description = "CIDR ranges of the subnet."
  value       = azurerm_subnet.this.address_prefixes
}

output "network_security_group_id" {
  description = "ID of the subnet NSG."

  value = (
    var.create_network_security_group
    ? azurerm_network_security_group.this[0].id
    : null
  )
}
