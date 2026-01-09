variable "name" {
  description = "Name of the app service plan"
  type        = string
}

variable "location" {
  description = "location for the app service plan"
  type        = string
}

variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
}

variable "os_type" {
  description = "os for app servcie plan (linux or windows)"
  type        = string
  default     = "Linux"

  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "os_type must be either Linux or Windows."
  }
}

variable "sku_name" {
  description = "pricing tier for app service plan"
  type        = string
  default     = "F1"
}

variable "tags" {
  description = "Tags to apply to the resource"
  type        = map(string)
  default     = {}
}
