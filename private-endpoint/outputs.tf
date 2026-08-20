output "private_endpoint_id" {
  value = azurerm_private_endpoint.private_endpoint.id
}

output "private_ip_addresses" {
  value = azurerm_private_endpoint.private_endpoint.private_service_connection[*].private_ip_address
}
