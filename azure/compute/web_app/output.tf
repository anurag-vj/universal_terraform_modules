output "id" {
  description = "web app id"
  value       = local.is_linux ? azurerm_linux_web_app.linux_web_app[0].id : azurerm_windows_web_app.windows_web_app[0].id
}

output "default_hostname" {
  description = "hostname of web app"
  value       = local.is_linux ? azurerm_linux_web_app.linux_web_app[0].default_hostname : azurerm_windows_web_app.windows_web_app[0].default_hostname
}
