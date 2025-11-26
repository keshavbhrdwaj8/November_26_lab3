
# Reference Stage 2 remote state to get the Service Plan ID
data "terraform_remote_state" "app_plan" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Keshav_Bhardwaj_RG"
    storage_account_name = "keshavlab2storage"
    container_name       = "tfstate"
    key                  = "lab2/02-app-plan.tfstate"
  }
}

module "web_app" {
  source              = "../../modules/web_app"
  web_app_name        = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = data.terraform_remote_state.app_plan.outputs.app_service_plan_id
  tags                = var.tags
}
