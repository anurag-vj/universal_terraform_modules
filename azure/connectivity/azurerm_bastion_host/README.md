# Azure Bastion Host Module

This module provisions an Azure Bastion Host and a Public IP.

## Scope
- Creates one Bastion Host in a specified resource group and location
- Creates a Public IP (current implementation requires `public_ip = true`)
- Exposes Bastion Host name/id and Public IP details (if created)

This module does not manage:
- Subnet creation (requires a dedicated AzureBastionSubnet in the VNet)
- Provider or backend configuration

## Requirements
- Terraform >= 1.5.0
- Provider `hashicorp/azurerm` ~> 4.0

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| bastion_host_name | Bastion Host name | string | Yes |
| location | Azure region | string | Yes |
| resource_group_name | Resource Group name | string | Yes |
| subnet_id | ID of the `AzureBastionSubnet` | string | Yes |
| public_ip | Whether to create a Public IP (must be `true`) | bool | Yes |
| allocation_method | Public IP allocation method | string | Yes |
| sku | Public IP SKU | string | Yes |
| tags | Tags to apply | map(string) | No |

## Outputs

| Name | Description |
|------|-------------|
| bastion_host_ids | Object with `name`, `id`, and optional `pip_*` fields |

Fields included for the created Public IP:
- `pip_name`: Public IP name
- `pip_address`: Public IP address
- `pip_id`: Public IP resource ID

## Example Usage

```hcl
module "bastion" {
  source = "../modules/network/azurerm_bastion_host"

  bastion_host_name   = "bastion-dev"
  location            = "eastus"
  resource_group_name = "rg-dev"
  subnet_id           = module.subnet.subnet_ids.id  # AzureBastionSubnet required

  public_ip         = true  # required by current implementation
  allocation_method = "Static"
  sku               = "Standard"

  tags = {
    environment = "dev"
  }
}
```

### Example Usage (for_each)

```hcl
variable "bastions" {
  type = map(object({
    bastion_host_name   = string
    location            = string
    resource_group_name = string
    subnet_id           = string
    public_ip           = bool
    allocation_method   = string
    sku                 = string
    tags                = map(string)
  }))
}

module "bastion" {
  for_each = var.bastions
  source   = "../modules/network/azurerm_bastion_host"

  bastion_host_name   = each.value.bastion_host_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = each.value.subnet_id
  public_ip           = each.value.public_ip
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
  tags                = each.value.tags
}
```

## Notes
- Azure Bastion requires a subnet named `AzureBastionSubnet` with a minimum size of /27 within the VNet.
- Current module logic references `azurerm_public_ip.public_ip[0]` unconditionally, so `public_ip` must remain `true`. Setting `public_ip = false` will result in an index error. If you need to use an existing Public IP, the module code must be refactored to conditionally reference the PIP or accept an external `public_ip_id`.
