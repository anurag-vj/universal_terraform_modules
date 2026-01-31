output "network_security_ids" {
  value = {
    name = azurerm_network_security_group.network_security.name
    id   = azurerm_network_security_group.network_security.id
  }
}
