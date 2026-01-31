variable "public_ip" {
  type    = bool
  default = true
}

variable "allocation_method" {
  type = string
}

variable "sku" {
  type = string
}

variable "bastion_host_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
