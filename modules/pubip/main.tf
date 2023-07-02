resource "azurerm_public_ip" "mypubip" {
  name                = "pubip-bytf-chirag-001"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}