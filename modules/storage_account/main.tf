
resource "azurerm_storage_account" "this" {
  name                         = var.storage_account_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  account_tier                 = "Standard"
  account_replication_type     = "LRS"
  public_network_access_enabled = false
  min_tls_version               = "TLS1_2"

  network_rules {
    default_action = "Deny"
    bypass         = ["None"]
  }

  tags = var.tags
}
