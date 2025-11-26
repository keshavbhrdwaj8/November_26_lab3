
module "storage_account" {
  source                = "../../modules/storage_account"
  storage_account_name  = var.storage_account_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "key_vault" {
  source              = "../../modules/key_vault"
  key_vault_name      = var.key_vault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}
