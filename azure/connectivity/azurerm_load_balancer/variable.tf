variable "load_balancer_name" {
    description = "The name of the load balancer"
    type = string
}

variable "location" {
    description = "The Azure location where the load balancer will be created"
    type = string
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the load balancer"
    type = string
}

variable "sku" {
    description = "The sku iof the load balancer. Possible values are 'Basic' and 'Standard'"
    type = string
    default = "Standard"
}

variable "subnet_id" {
    description = "The ID of the subnet for the load balancer's frontend IP Configuration"
    type 
}