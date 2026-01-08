output "name" {
  description = "app service plan name"
  value       = azurerm_service_plan.app_service_plan.name
}

output "sku_name" {
  description = "app service plan procing tier"
  value       = azurerm_service_plan.app_service_plan.sku_name
}

output "id" {
  description = "app service plan id"
  value       = azurerm_service_plan.app_service_plan.id
}
