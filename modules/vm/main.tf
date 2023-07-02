resource "azurerm_linux_virtual_machine" "myvm" {
  name                  = "vm-bytf-chirag-001"
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_ids]
  size                  = "Standard_DS1_v2"

  admin_username = "chirag"
  admin_password = "chiragvm@123"
  disable_password_authentication = false

  os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}