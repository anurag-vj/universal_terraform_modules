resource "azurerm_public_ip" "public_ip" {
  count               = var.public_ip ? 1 : 0
  name                = "${var.bastion_host_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku

  tags = var.tags
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bastion_host_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "${var.bastion_host_name}-ipconfig"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.public_ip[0].id
  }

  tags = var.tags
}
