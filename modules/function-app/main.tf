resource "azurerm_storage_account" "fn_storage_account" {
  name                     = var.fn_storage_account_name
  location                 = var.location
  resource_group_name      = var.rg-name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "fn_app_service_plan" {
  name                = var.fn_app_service_plan_name
  location            = var.location
  resource_group_name = var.rg-name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "fn_app" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.rg-name
  app_service_plan_id        = azurerm_app_service_plan.fn_app_service_plan.id
  storage_account_name       = azurerm_storage_account.fn_storage_account.name
  storage_account_access_key = azurerm_storage_account.fn_storage_account.primary_access_key

  app_settings = {
    FUNCTIONS_EXTENSION_VERSION = "~3"
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING    = "${azurerm_storage_account.fn_storage_account.primary_connection_string}"
    WEBSITE_CONTENTSHARE                        = "${azurerm_storage_account.fn_storage_account.name}"
    COSMOSDB_CONNECTION_STR = var.connection_str
  }
}