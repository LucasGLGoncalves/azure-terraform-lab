resource "azurerm_virtual_network" "aula-az-vnet" {
  name                = "aula-az-vnet"
  depends_on = [ azurerm_resource_group.aula-az-rg ]
  location            = azurerm_resource_group.aula-az-rg.location
  resource_group_name = azurerm_resource_group.aula-az-rg.name
  address_space       = ["10.0.0.0/16"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "az-subnet-publica" {
  name                 = "az-subnet-publica"
  depends_on = [ azurerm_virtual_network.aula-az-vnet ]
  resource_group_name  = azurerm_resource_group.aula-az-rg.name
  virtual_network_name = azurerm_virtual_network.aula-az-vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "az-subnet-privada" {
  name                 = "az-subnet-privada"
  depends_on = [ azurerm_virtual_network.aula-az-vnet ]
  resource_group_name  = azurerm_resource_group.aula-az-rg.name
  virtual_network_name = azurerm_virtual_network.aula-az-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}