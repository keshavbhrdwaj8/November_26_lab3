
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.113"
    }
  }

  backend "azurerm" {
    resource_group_name  = "<tfstate-rg>"
    storage_account_name = "<tfstate-sa>"
    container_name       = "tfstate"
    key                  = "lab2/01-foundation.tfstate"
  }
}

provider "azurerm" {
  features {}
}
