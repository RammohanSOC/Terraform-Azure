resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = var.address_space
  dns_servers   = var.dns_servers

  tags = var.tags
}

module "subnet" {
  source   = "./subnet"
  for_each = var.subnets

  subnet_name         = each.key
  resource_group_name = var.resource_group_name
  location            = var.location

  virtual_network_name = azurerm_virtual_network.this.name
  cidrs                = each.value.cidrs

  private_endpoint_network_policies = try(
    each.value.private_endpoint_network_policies,
    "Disabled"
  )

  private_link_service_network_policies_enabled = try(
    each.value.private_link_service_network_policies_enabled,
    true
  )

  default_outbound_access_enabled = try(
    each.value.default_outbound_access_enabled,
    true
  )

  service_endpoints = try(
    each.value.service_endpoints,
    []
  )

  delegations = try(
    each.value.delegations,
    {}
  )

  create_network_security_group = try(
    each.value.create_network_security_group,
    false
  )

  configure_nsg_rules = try(
    each.value.configure_nsg_rules,
    false
  )

  allow_internet_outbound = try(
    each.value.allow_internet_outbound,
    false
  )

  allow_lb_inbound = try(
    each.value.allow_lb_inbound,
    false
  )

  allow_vnet_inbound = try(
    each.value.allow_vnet_inbound,
    false
  )

  allow_vnet_outbound = try(
    each.value.allow_vnet_outbound,
    false
  )

  security_group_prefix = try(
    each.value.security_group_prefix,
    null
  )

  tags = var.tags
}

resource "azurerm_route_table" "this" {
  for_each = var.route_tables

  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = try(
    each.value.bgp_route_propagation_enabled,
    true
  )

  dynamic "route" {
    for_each = try(each.value.routes, {})

    content {
      name           = route.key
      address_prefix = route.value.address_prefix
      next_hop_type  = route.value.next_hop_type
      next_hop_in_ip_address = try(
        route.value.next_hop_in_ip_address,
        null
      )
    }
  }

  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each = var.route_table_associations

  subnet_id = module.subnet[each.value.subnet_name].id

  route_table_id = azurerm_route_table.this[
    each.value.route_table_name
  ].id
}

resource "azurerm_virtual_network_peering" "this" {
  for_each = var.peerings

  name = each.key

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  remote_virtual_network_id = each.value.remote_virtual_network_id

  allow_virtual_network_access = try(
    each.value.allow_virtual_network_access,
    true
  )

  allow_forwarded_traffic = try(
    each.value.allow_forwarded_traffic,
    false
  )

  allow_gateway_transit = try(
    each.value.allow_gateway_transit,
    false
  )

  use_remote_gateways = try(
    each.value.use_remote_gateways,
    false
  )
}
