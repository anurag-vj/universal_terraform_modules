resource "azurerm_linux_web_app" "linux_web_app" {
  count               = local.is_linux ? 1 : 0
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  https_only = true

  site_config {}

  app_settings = var.app_settings

  tags = var.tags
}

resource "azurerm_windows_web_app" "windows_web_app" {
  count               = local.is_windows ? 1 : 0
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  https_only = true

  site_config {}

  app_settings = var.app_settings

  tags = var.tags
}
