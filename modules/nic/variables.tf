variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the Azure Resource Group"
  type        = string
}

variable "public_ip_address_id" {
  type = string
}
variable "subnet_id" {
  type = string
}