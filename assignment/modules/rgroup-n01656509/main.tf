resource "azurerm_resource_group" "n01656509-RG" {
  name     = "${var.resource_group_name}-RG"
  location = var.location
}
