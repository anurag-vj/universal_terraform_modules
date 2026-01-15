variable "network_security_group" {
    type = string
}

variable "location" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "tags" {
    type = map(object)
    default = {}
}
