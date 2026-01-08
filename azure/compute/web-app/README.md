(The file `/Users/anurag_vijay/Documents/Github Repo's/terraform_infra_modules/azure/compute/web-app/README.md` exists, but is empty)
# Azure Web App (App Service) module

Overview
This Terraform module deploys an Azure App Service (Web App) and wires it to an existing App Service Plan. It supports Linux and Windows web apps via the platform-specific resources in the module.

Usage
```hcl
module "web_app" {
	source              = "../../compute/web-app"
	web_app_name        = "example-webapp"
	location            = "eastus"
	resource_group_name = "rg-my-apps"
	service_plan_id     = "<app_service_plan_resource_id>" # usually module.app_service_plan.id
	os_type             = "Linux" # or "Windows"
	app_settings = {
		"WEBSITE_RUN_FROM_PACKAGE" = "1"
	}
	tags = {
		environment = "dev"
	}
}
```

Inputs
- `web_app_name` (string) : Name for the Web App (must be unique within the App Service namespace).
- `location` (string) : Azure location to create the Web App in.
- `resource_group_name` (string) : Resource group name for the Web App.
- `service_plan_id` (string) : ID of an existing App Service Plan to host the Web App.
- `os_type` (string) : OS for the Web App. Allowed values: `Linux` or `Windows`. Default: `Linux`.
- `app_settings` (map(string)) : App settings to apply to the Web App (default: `{}`).
- `tags` (map(string)) : Tags to apply to the Web App resource (default: `{}`).

Outputs
- `id` : The resource id of the created Web App.
- `default_hostname` : The default host name (e.g. <app>.azurewebsites.net).

Notes
- This module expects an existing App Service Plan; pass the plan's resource id via `service_plan_id`.
- For Linux apps the module uses the Linux resource; for Windows it uses the Windows resource (controlled by `os_type`).
- Ensure your `azurerm` provider and Terraform versions in your root configuration meet any provider requirements.

Contributing
If you need additional features (deployment slots, managed identity, custom domains, TLS bindings), open an issue or extend the module inputs and resources.
