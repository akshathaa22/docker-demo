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

resource "azurerm_resourcegroup_name" "demo" {
	name= "rg_demo_devops"
	location= "Central India"
}

resource "azurerm_container_registry" "acr_demo" {
	name= "myuniquedevopsacr"
	location= "azurerm_resourcegroup_name.demo.location"
	resource_group_name= "azurerm_resourcegroup_name.demo.name"
	sku= "Standard"
	admin_enabled= false    
}