<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.4.0 |

## Usage Example

```hcl
module "vm_module" {
  source              = ""
  vm_name             = "my-vm"
  resource_group_name = "my-rg"
  location            = "East US"
  vm_size             = "Standard_B2ms"
  os_type             = "linux"
  admin_username      = "azureuser"
  linux_ssh_key       = file("~/.ssh/id_rsa.pub")
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "18.04-LTS"
  nsg_rules = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.linux_vm](https://registry.terraform.io/providers/hashicorp/azurerm/4.4.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.vm_nic](https://registry.terraform.io/providers/hashicorp/azurerm/4.4.0/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.vm_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.4.0/docs/resources/network_security_group) | resource |
| [azurerm_windows_virtual_machine.windows_vm](https://registry.terraform.io/providers/hashicorp/azurerm/4.4.0/docs/resources/windows_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Administrator password for the virtual machine (required for Windows) | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Administrator username for the virtual machine | `string` | `"azureuser"` | no |
| <a name="input_image_offer"></a> [image\_offer](#input\_image\_offer) | Offer of the virtual machine image | `string` | n/a | yes |
| <a name="input_image_publisher"></a> [image\_publisher](#input\_image\_publisher) | Publisher of the virtual machine image | `string` | n/a | yes |
| <a name="input_image_sku"></a> [image\_sku](#input\_image\_sku) | SKU of the virtual machine image | `string` | n/a | yes |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Version of the virtual machine image | `string` | `"latest"` | no |
| <a name="input_linux_ssh_key"></a> [linux\_ssh\_key](#input\_linux\_ssh\_key) | Public SSH key for Linux virtual machines | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the virtual machine | `string` | `"East US"` | no |
| <a name="input_nsg_rules"></a> [nsg\_rules](#input\_nsg\_rules) | Network security group rules | <pre>list(object({<br>    name                       = string<br>    priority                   = number<br>    direction                  = string<br>    access                     = string<br>    protocol                   = string<br>    source_port_range          = string<br>    destination_port_range     = string<br>    source_address_prefix      = string<br>    destination_address_prefix = string<br>  }))</pre> | `[]` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Operating system type (linux or windows) | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the VM will be created | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the subnet to which the VM will be associated | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size of the virtual machine | `string` | `"Standard_B2ms"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The private IP address of the network interface associated with the created VM. |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | The ID of the created VM (Linux or Windows, depending on the value of os\_type). |
<!-- END_TF_DOCS -->