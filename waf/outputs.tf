output "waf_policy_id" {
  value = azurerm_web_application_firewall_policy.waf.id
}

output "application_gateway_id" {
  value = azurerm_application_gateway.appgw.id
}
