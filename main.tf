resource "azurerm_resource_group" "resource_group" {
  name  = var.rg-name
  location = var.location
}

module "cosmosdb" {
  source = "./modules/cosmosdb"

  cosmosdb_name = var.cosmosdb_name
  rg-name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
}

module "function-app" {
  source = "./modules/function-app"

  rg-name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  fn_storage_account_name = var.fn_storage_account_name
  fn_app_service_plan_name = var.fn_app_service_plan_name
  function_app_name = var.function_app_name
  connection_str = module.cosmosdb.connection_str

  depends_on = [module.cosmosdb]
}

module "apim" {
  source = "./modules/apim"

  rg-name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  apim_name = var.apim_name

  depends_on = [azurerm_resource_group.resource_group]
}