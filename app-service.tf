resource "azurerm_service_plan" "app" {
  name                = "${var.project_name}-app-plan"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  os_type  = "Linux"
  sku_name = "B1"

  tags = local.common_tags
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.project_name}-webapp"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  service_plan_id = azurerm_service_plan.app.id

  virtual_network_subnet_id = azurerm_subnet.app.id

  identity {
    type = "SystemAssigned"
  }
   
  site_config {
    app_command_line = "gunicorn --bind=0.0.0.0:8000 app:app"

    application_stack {
      python_version = "3.12"
    }
  }
  tags = local.common_tags
}