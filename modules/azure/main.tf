provider "azurerm" {
  version = "1.43.0"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}

resource "azurerm_resource_group" "game_servers_group" {
  name     = "game-servers"
  location = var.location
  tags     = var.tags
}
