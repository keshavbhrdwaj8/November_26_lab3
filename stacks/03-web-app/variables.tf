
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
variable "web_app_name" { 
    default = "keshavlab2-web"
    type = string 
    }
