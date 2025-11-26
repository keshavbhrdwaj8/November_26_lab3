
module "app_service_plan" {
  source                = "../../modules/app_service_plan"
  app_service_plan_name = var.app_service_plan_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
  sku_name              = var.sku_name
}
