# Azure Resource Group Module

This module creates a single Azure Resource Group.

## Scope
- Creates one Resource Group
- Applies tags if provided
- Exposes ID, name, and location

This module does not manage:
- Multiple resource groups internally
- Policies, locks, or role assignments
- Provider or backend configuration

## Inputs

| Name | Description | Required |
|-----|------------|----------|
| name | Resource Group name | Yes |
| location | Azure region | Yes |
| tags | Resource tags | No |

## Outputs

| Name | Description |
|-----|-------------|
| id | Resource Group ID |
| name | Resource Group name |
| location | Resource Group location |

## Example Usage

```hcl
module "resource_group" {
  source = "git::https://github.com/<org>/terraform-modules.git//azure/core/resource-group?ref=v1.0.0"

  name     = "rg-dev"
  location = "eastus"

  tags = {
    environment = "dev"
  }
}

## Using this module with for_each (Environment Usage)

This module is intentionally designed to create **a single Resource Group**.

If you need to create **multiple Resource Groups**, use `for_each` in the **calling environment**, not inside the module.

### Example: Creating multiple Resource Groups

```hcl
variable "resource_groups" {
  type = map(object({
    location = string
    tags     = map(string)
  }))
}

module "resource_group" {
  for_each = var.resource_groups

  source = "git::https://github.com/<org>/terraform-modules.git//azure/core/resource-group?ref=v1.0.0"

  name     = each.key
  location = each.value.location
  tags     = each.value.tags
}
