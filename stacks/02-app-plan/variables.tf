
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
    default = { environment = "lab2", workload = "app-plan" } 
    }
variable "app_service_plan_name" { 
    default = "keshavlab2-asp" 
    type = string 
    }
variable "sku_name" { 
    description = "SKU (e.g., B1, P1v3)" 
    type = string 
    default = "B1" 
    }
