
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
    default = { environment = "lab2", workload = "foundation" } 
    }
variable "storage_account_name" { 
    default = "keshavlab2storage" 
    type = string 
    }
variable "key_vault_name" { 
    description = "keshavlab2-kv" 
    type = string 
    }
