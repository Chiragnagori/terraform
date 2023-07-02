variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the Azure Resource Group"
  type        = string
}
variable "network_interface_ids" {
  type = string
}