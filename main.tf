terraform {
	required_providers {
		azurerm= {
			source= "hashicorp/azurerm"
			version= "~> 3.0"
		}
	}
}

provider "azurerm" {
	features {}
}

resource "azurerm_resource_group" "demo" {
	name= "rg_demo_devops"
	location= "Central India"
}

resource "azurerm_container_registry" "acr_demo" {
	name= "myuniquedevopsacr"
	location= "azurerm_resource_group.demo.location"
	resource_group_name= "azurerm_resource_group.demo.name"
	sku= "Standard"
	admin_enabled= false    
}