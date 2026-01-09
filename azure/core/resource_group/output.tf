output "name" {
  description = "Resource Group Name"
  value       = azurerm_resource_group.resource_group.name
}

output "location" {
  description = "Resource Group Location"
  value = azurerm_resource_group.resource_group.location
}

output "id" {
  description = "Resource Group Id"
  value       = azurerm_resource_group.resource_group.id
}
