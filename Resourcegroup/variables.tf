variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "Production"
}
