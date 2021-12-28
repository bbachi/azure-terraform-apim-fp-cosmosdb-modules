resource "azurerm_api_management" "demo-apim" {
  name                = var.apim_name
  location            = var.location
  resource_group_name = var.rg-name
  publisher_name      = "publisher"
  publisher_email     = "publisher.email@gmail.com"

  sku_name = "Developer_1"
}