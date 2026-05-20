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
	location= "australiacentral"
	resource_group_name= azurerm_resource_group.demo.name
	sku= "Standard"
	admin_enabled= false    
}

resource "azurerm_container_app_environment" "demo" {
  name                = "container-env-demo"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_container_app" "demo" {
  name                         = "nginx-containerapp"
  container_app_environment_id = azurerm_container_app_environment.demo.id
  resource_group_name          = azurerm_resource_group.demo.name
  revision_mode                = "Single"

  template {
    container {
      name   = "nginx"
      image  = "myuniquedevopsacr.azurecr.io/my-nginx-image:v1"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  registry {
    server               = "myuniquedevopsacr.azurecr.io"
    username             = azurerm_container_registry.acr_demo.admin_username
    password_secret_name = "acr-password"
  }

  secret {
    name  = "acr-password"
    value = azurerm_container_registry.acr_demo.admin_password
  }
}