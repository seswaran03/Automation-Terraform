output "virtual_address_space" {
  value = azurerm_virtual_network.n01656509-VNET.address_space
}

output "virtual_network_name" {
  value = azurerm_virtual_network.n01656509-VNET.name
}

output "subnet_prefixes" {
  value = azurerm_subnet.n01656509-SUBNET.address_prefixes
}

output "subnet_name" {
  value = azurerm_subnet.n01656509-SUBNET.name
}

output "network_security_group_id" {
  value = azurerm_network_security_group.n01656509-NSG.id
}

output "network_security_group_name" {
  value = azurerm_network_security_group.n01656509-NSG.name
}

output "subnet_network_security_group_association_id" {
  value = azurerm_subnet_network_security_group_association.n01656509-subnet-nsg-association.id
}
output "subnet_id" {
  value = azurerm_subnet.n01656509-SUBNET.id
}

