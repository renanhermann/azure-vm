output "vm_id" {
  description = "The ID of the created VM (Linux or Windows, depending on the value of os_type)."
  value       = var.os_type == "linux" ? azurerm_linux_virtual_machine.linux_vm[0].id : azurerm_windows_virtual_machine.windows_vm[0].id
}

output "public_ip_address" {
  description = "The private IP address of the network interface associated with the created VM."
  value       = azurerm_network_interface.vm_nic.private_ip_address
}
