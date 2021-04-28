  variable "ssh_key" {
      description = "(Required) SSH Key to be configured for access to the VM, you won't be able to access the VMs if this value isn't set up"
      default = ""
      type = string
  }
  variable "preprovision" {
      default = "true"
      type = bool
  }
