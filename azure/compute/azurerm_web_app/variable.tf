variable "name" {
  description = "name of web app, unique"
  type        = string
}
variable "location" {
  description = "location for web app"
  type        = string
}

variable "resource_group_name" {
  description = "name of the resource_group"
  type        = string
}

variable "service_plan_id" {
  description = "service plan id"
  type        = string
}

variable "os_type" {
  description = "os for app servcie plan (linux or windows)"
  type        = string
  default     = "Linux"

  validation {
    condition     = contains(["linux", "windows"], lower(var.os_type))
    error_message = "os_type must be either Linux or Windows."
  }
}

variable "app_settings" {
  description = "variable for app settings"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to the resource"
  type        = map(string)
  default     = {}
}
