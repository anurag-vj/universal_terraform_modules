# Azure App Service Plan module

Overview
This Terraform module creates an Azure App Service Plan (`azurerm_service_plan`) used to host App Services (Web Apps). It supports Linux and Windows SKUs and exposes the plan's id and name for consumption by other modules (for example a Web App module).

Usage
```hcl
module "app_service_plan" {
  source               = "../../core/app_service_plan"
  app_service_plan_name = "example-asp"
  location             = "eastus"
  resource_group_name  = "rg-my-apps"
  os_type              = "Linux"   # or "Windows"
  sku_name             = "F1"      # e.g. F1, B1, S1, P1v2, etc.
  tags = {
    environment = "dev"
  }
}

# Reference the produced id when creating a web app
resource_id = module.app_service_plan.id
```

Inputs
- `app_service_plan_name` (string) : Name of the App Service Plan.
- `location` (string) : Azure location for the plan.
- `resource_group_name` (string) : Resource group name.
- `os_type` (string) : OS for the plan. Allowed values: `Linux` or `Windows`. Default: `Linux`.
- `sku_name` (string) : Pricing tier for the plan (default: `F1`).
- `tags` (map(string)) : Tags to apply to the App Service Plan (default: `{}`).

Outputs
- `name` : The name of the App Service Plan.
- `sku_name` : The SKU/pricing tier of the plan.
- `id` : The resource id of the created App Service Plan.

Notes
- Use the produced `id` when creating `azurerm_app_service` or similar resources that accept a service plan id.
- Choose an appropriate `sku_name` for your workload; Free and Shared tiers (F/S) are for development/testing, while Standard/Premium tiers provide scaling and production features.
- Ensure your root Terraform configuration sets a compatible `azurerm` provider version.

Extending
To add features like dedicated scaling, per-zone SKUs, or autoscale settings, extend inputs and resources in `main.tf` and surface relevant outputs.
