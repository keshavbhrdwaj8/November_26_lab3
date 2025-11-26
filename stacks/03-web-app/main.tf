
data "azurerm_service_plan" "existing" {
  name                = var.app_service_plan_name    # pass the plan name, not the ID
  resource_group_name = var.resource_group_name
}
module "web_app" {
  source              = "../../modules/web_app"
  web_app_name        = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags
}
