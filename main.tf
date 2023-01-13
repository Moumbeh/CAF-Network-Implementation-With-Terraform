terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"      
    }
  }
  backend "azurerm" {
    
  }
}

provider "azurerm" {
  features {}
}

module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = ">= 5.6.0"

  providers = {
    azurerm.vhub = azurerm
  }

  global_settings = var.global_settings  
  resource_groups = var.resource_groups
  networking = var.networking

  # SET correct object id!  $(az ad signed-in-user show --query id -o tsv --only-show-errors) OR
  # GET all logged in user credentials $(az ad signed-in-user show)
  # https://github.com/aztfmod/terraform-azurerm-caf/issues/1173
  # https://github.com/hashicorp/terraform-provider-azurerm/issues/16982
  logged_user_objectId = "xxxxxxxxxxxxxxxxxx"
}