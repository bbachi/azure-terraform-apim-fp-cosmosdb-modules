output "cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.db.id
  description = "The id of the cosmosdb account"
}

output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.db.name
  description = "The name of the cosmosdb account"
}

output "cosmosdb_account_endpoint" {
  value = azurerm_cosmosdb_account.db.endpoint
  description = "The endpoint of the cosmosdb account"
}

output "connection_str" {
  value = azurerm_cosmosdb_account.db.connection_strings[0]
  description = "connection string of the cosmos DB"
  sensitive   = true
}