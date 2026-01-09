output "app_service_plan_ids" {
  description = "App Service Plan details"
  value = {
    name     = azurerm_service_plan.app_service_plan.name
    sku_name = azurerm_service_plan.app_service_plan.sku_name
    id       = azurerm_service_plan.app_service_plan.id
  }
}
