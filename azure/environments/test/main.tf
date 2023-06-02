terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

module "ssl" {
  source      = "../../applications/ssl-test"
  environment = "test"
}