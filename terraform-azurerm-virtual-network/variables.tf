variable "resource_group_name" {
  description = "Name of the existing Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network."
  type        = list(string)
}

variable "dns_servers" {
  description = "Optional custom DNS servers."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to Azure resources."
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "Subnet configuration."

  type = map(object({
    cidrs = list(string)

    private_endpoint_network_policies = optional(
      string,
      "Disabled"
    )

    private_link_service_network_policies_enabled = optional(
      bool,
      true
    )

    default_outbound_access_enabled = optional(
      bool,
      true
    )

    service_endpoints = optional(
      list(string),
      []
    )

    delegations = optional(
      map(object({
        name    = string
        actions = list(string)
      })),
      {}
    )

    create_network_security_group = optional(
      bool,
      false
    )

    configure_nsg_rules = optional(
      bool,
      false
    )

    allow_internet_outbound = optional(
      bool,
      false
    )

    allow_lb_inbound = optional(
      bool,
      false
    )

    allow_vnet_inbound = optional(
      bool,
      false
    )

    allow_vnet_outbound = optional(
      bool,
      false
    )

    security_group_prefix = optional(
      string,
      null
    )
  }))

  default = {}
}

variable "route_tables" {
  description = "Route table configuration."

  type = map(object({
    bgp_route_propagation_enabled = optional(
      bool,
      true
    )

    routes = optional(
      map(object({
        address_prefix         = string
        next_hop_type          = string
        next_hop_in_ip_address = optional(string)
      })),
      {}
    )
  }))

  default = {}
}

variable "route_table_associations" {
  description = "Subnet to route table associations."

  type = map(object({
    subnet_name      = string
    route_table_name = string
  }))

  default = {}
}

variable "peerings" {
  description = "Virtual network peering configuration."

  type = map(object({
    remote_virtual_network_id = string

    allow_virtual_network_access = optional(
      bool,
      true
    )

    allow_forwarded_traffic = optional(
      bool,
      false
    )

    allow_gateway_transit = optional(
      bool,
      false
    )

    use_remote_gateways = optional(
      bool,
      false
    )
  }))

  default = {}
}
