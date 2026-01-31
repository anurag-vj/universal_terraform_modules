variable "name" {
  type        = string
}
variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "service_plan_id" {
  type        = string
}

variable "os_type" {
  type        = string
  default     = "Linux"

  validation {
    condition     = contains(["linux", "windows"], lower(var.os_type))
    error_message = "os_type must be either Linux or Windows."
  }
}

variable "app_settings" {
  type        = map(string)
  default     = {}
}

variable "tags" {
  type        = map(string)
  default     = {}
}
