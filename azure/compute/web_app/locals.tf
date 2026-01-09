locals {
  is_linux   = lower(var.os_type) == "linux"
  is_windows = lower(var.os_type) == "windows"
  enable_always_on = false
}
