resource "azurerm_lb" "internal_lb" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                          = "${var.load_balancer_name}-feipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "${var.load_balancer_name}-backendpool"
  loadbalancer_id = azurerm_lb.internal_lb.id
}

resource "azurerm_lb_probe" "lb_probe" {
  name                = "${var.load_balancer_name}-lbprobe"
  loadbalancer_id     = azurerm_lb.internal_lb.id
  protocol            = var.lb_probe_protocol
  port                = var.lb_probe_port
  interval_in_seconds = var.interval_in_seconds
  number_of_probes    = var.number_of_probes
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = "${var.load_balancer_name}-lbrule"
  loadbalancer_id                = azurerm_lb.internal_lb.id
  protocol                       = var.lb_rule_protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_pool
  frontend_ip_configuration_name = azurerm_lb.internal_lb.frontend_ip_configuration.name
  probe_id                       = azurerm_lb_probe.lb_probe.id
}
