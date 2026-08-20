variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "local_network_gateway_name" {
  type = string
}

variable "gateway_address" {
  type = string
}

variable "address_space" {
  type = list(string)
}
