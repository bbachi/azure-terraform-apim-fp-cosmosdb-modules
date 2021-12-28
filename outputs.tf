output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
  description = "Name of the resource group"
}

output "cosmosdb_account_id" {
  value = module.cosmosdb.cosmosdb_account_id
  description = "The id of the cosmosdb account"
}

output "cosmosdb_account_name" {
  value = module.cosmosdb.cosmosdb_account_name
  description = "The name of the cosmosdb account"
}

output "cosmosdb_account_endpoint" {
  value = module.cosmosdb.cosmosdb_account_endpoint
  description = "The endpoint of the cosmosdb account"
}

output "function_app_name" {
  value = module.function-app.function_app_name
  description = "Name of the resource group"
}

output "function_app_id" {
  value = module.function-app.function_app_id
  description = "Id of the function app"
}