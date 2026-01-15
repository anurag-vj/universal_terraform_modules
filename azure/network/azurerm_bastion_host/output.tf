output "bastion_host_ids" {
  value = {
    name        = azurerm_bastion_host.bastion_host.name
    id          = azurerm_bastion_host.bastion_host.id
    pip_name    = try(azurerm_public_ip.public_ip[0].name, null)
    pip_address = try(azurerm_public_ip.public_ip[0].ip_address, null)
    pip_id      = try(azurerm_public_ip.public_ip[0].id, null)
  }
}
