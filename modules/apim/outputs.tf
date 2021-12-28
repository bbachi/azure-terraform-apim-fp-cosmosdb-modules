output "apim_gateway_url" {
  value = azurerm_api_management.demo-apim.gateway_url
  description = "Gateway URL of the APIM"
}