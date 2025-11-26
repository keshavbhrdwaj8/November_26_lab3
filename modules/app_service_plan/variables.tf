
variable "app_service_plan_name" { 
    type = string 
    }
variable "resource_group_name" { 
    type = string 
    }
variable "location" { 
    type = string 
    }
variable "tags" { 
    type = map(string) 
    }
variable "sku_name" { 
    type = string 
    default = "B1" 
    }
