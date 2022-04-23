resource "azurerm_virtual_network" "this" {
    name                    = var.aks_vnet.name
    address_space           = var.aks_vnet.address_space
    location                = azurerm_resource_group.this.location
    resource_group_name     = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  name                 = var.aks_subnet.name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.aks_subnet.address_prefixes
}