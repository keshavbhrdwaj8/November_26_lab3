
variable "resource_group_name" { 
    default = "Keshav_Bhardwaj_RG"
    type = string 
    }
variable "location" { 
    default = "eastus" 
    type = string 
    }
variable "tags" { 
    description = "Tags" 
    type = map(string) 
    default = { environment = "lab2", workload = "web-app" }
    }
    
variable "service_plan_id" {
  description = "App Service Plan resource ID from Stage 2"
  type        = string
}
variable "web_app_name" { 
    default = "keshavlab2-web"
    type = string 
    }


variable "app_service_plan_name" {
  description = "Name of the App Service Plan created in Stage 2 (same RG)"
  type        = string
}
