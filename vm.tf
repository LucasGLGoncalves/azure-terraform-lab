resource "azurerm_public_ip" "lab-az-vm-puip" {
  name                = "lab-az-vm-puip"
  depends_on = [ azurerm_subnet.az-subnet-publica ]
  resource_group_name = azurerm_resource_group.lab-az-rg.name
  location            = azurerm_resource_group.lab-az-rg.location
  allocation_method   = "Static"

  tags = {
    environment = "lab"
  }
}

resource "azurerm_network_interface" "lab-az-vm-netint" {
  name                = "lab-az-vm-netint"
  depends_on = [ azurerm_public_ip.lab-az-vm-puip ]
  location            = azurerm_resource_group.lab-az-rg.location
  resource_group_name = azurerm_resource_group.lab-az-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.az-subnet-publica.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.lab-az-vm-puip.id
  }
}

resource "azurerm_linux_virtual_machine" "lab-az-vm01-pub" {
  name                = "lab-az-vm01-pub"
  depends_on = [ azurerm_network_interface.lab-az-vm-netint ]
  resource_group_name = azurerm_resource_group.lab-az-rg.name
  location            = azurerm_resource_group.lab-az-rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.lab-az-vm-netint.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/lab-az-terraform.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

output "vm01-public-ip" {
  value = azurerm_public_ip.lab-az-vm-puip
}