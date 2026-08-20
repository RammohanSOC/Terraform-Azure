output "frontdoor_profile_id" {
  value = azurerm_cdn_frontdoor_profile.frontdoor.id
}

output "frontdoor_endpoint_hostname" {
  value = azurerm_cdn_frontdoor_endpoint.endpoint.host_name
}
