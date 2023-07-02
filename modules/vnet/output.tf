output "vnet_name" {
  value = azurerm_virtual_network.myvnet.name
}
output "subnet_id" {
  value = azurerm_subnet.mysubnet.id
}