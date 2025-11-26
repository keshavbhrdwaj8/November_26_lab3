
module "web_app" {
  source              = "../../modules/web_app"
  web_app_name        = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags
}
