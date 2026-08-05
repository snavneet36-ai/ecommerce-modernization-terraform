output "app_service_name" {
  description = "Azure App Service name"
  value       = azurerm_linux_web_app.app.name
}

output "app_service_url" {
  description = "Azure App Service URL"
  value       = "https://${azurerm_linux_web_app.app.default_hostname}"
}

output "app_service_plan_name" {
  description = "Azure App Service Plan name"
  value       = azurerm_service_plan.app.name
}