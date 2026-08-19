variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Azure Virtual Network name"
  type        = string
}

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}
