resource "azurerm_network_security_group" "network_security" {
  name                = var.network_security_group
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}
