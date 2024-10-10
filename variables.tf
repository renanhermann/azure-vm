variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the VM will be created"
  type        = string
}

variable "location" {
  description = "Location of the virtual machine"
  type        = string
  default     = "East US"
}

variable "subnet_id" {
  description = "ID of the subnet to which the VM will be associated"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2ms"
}

variable "admin_username" {
  description = "Administrator username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Administrator password for the virtual machine (required for Windows)"
  type        = string
  sensitive   = true
}

variable "os_type" {
  description = "Operating system type (linux or windows)"
  type        = string
  validation {
    condition     = contains(["linux", "windows"], var.os_type)
    error_message = "The OS type must be 'linux' or 'windows'."
  }
}

variable "linux_ssh_key" {
  description = "Public SSH key for Linux virtual machines"
  type        = string
  default     = ""
}

variable "image_publisher" {
  description = "Publisher of the virtual machine image"
  type        = string
}

variable "image_offer" {
  description = "Offer of the virtual machine image"
  type        = string
}

variable "image_sku" {
  description = "SKU of the virtual machine image"
  type        = string
}

variable "image_version" {
  description = "Version of the virtual machine image"
  type        = string
  default     = "latest"
}

variable "nsg_rules" {
  description = "Network security group rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}
