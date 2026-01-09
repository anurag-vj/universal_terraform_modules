output "web_app" {
  description = "Web App details"
  value = {
    id = try(
      azurerm_linux_web_app.linux_web_app[0].id,
      azurerm_windows_web_app.windows_web_app[0].id
    )

    default_hostname = try(
      azurerm_linux_web_app.linux_web_app[0].default_hostname,
      azurerm_windows_web_app.windows_web_app[0].default_hostname
    )
  }
}
