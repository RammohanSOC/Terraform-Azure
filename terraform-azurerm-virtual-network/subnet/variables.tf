variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "cidrs" {
  description = "CIDR ranges for the subnet."
  type        = list(string)
}

variable "private_endpoint_network_policies" {
  description = "Private endpoint network policy setting."
  type        = string
  default     = "Disabled"
}

variable "private_link_service_network_policies_enabled" {
  description = "Enable or disable Private Link Service network policies."
  type        = bool
  default     = true
}

variable "default_outbound_access_enabled" {
  description = "Enable default outbound internet access."
  type        = bool
  default     = true
}

variable "service_endpoints" {
  description = "Azure service endpoints."
  type        = list(string)
  default     = []
}

variable "delegations" {
  description = "Subnet service delegations."

  type = map(object({
    name    = string
    actions = list(string)
  }))

  default = {}
}

variable "create_network_security_group" {
  description = "Create an NSG for the subnet."
  type        = bool
  default     = false
}

variable "configure_nsg_rules" {
  description = "Create custom NSG rules."
  type        = bool
  default     = false
}

variable "allow_internet_outbound" {
  description = "Allow internet outbound traffic."
  type        = bool
  default     = false
}

variable "allow_lb_inbound" {
  description = "Allow Azure Load Balancer inbound traffic."
  type        = bool
  default     = false
}

variable "allow_vnet_inbound" {
  description = "Allow Virtual Network inbound traffic."
  type        = bool
  default     = false
}

variable "allow_vnet_outbound" {
  description = "Allow Virtual Network outbound traffic."
  type        = bool
  default     = false
}

variable "security_group_prefix" {
  description = "Optional NSG name prefix."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the subnet resources."
  type        = map(string)
  default     = {}
}
