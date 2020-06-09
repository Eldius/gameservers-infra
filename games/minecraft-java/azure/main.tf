provider "azurerm" {
  version = "1.43.0"
}


terraform {
  required_version = ">= 0.12"
  #backend "azurerm" {
  #  resource_group_name  = "StorageAccount-ResourceGroup"
  #  storage_account_name = "abcd1234"
  #  container_name       = "tfstate"
  #  key                  = "prod.terraform.tfstate"
  #}
}

module "minecraft" {
  source = "../../../modules/azure"

  network_name          = "gameservers-network"
  address_space         = ["10.0.0.0/16"]
  subnet_address_prefix = "10.0.2.0/24"
  location              = "brazilsouth"
  tags = {
    project     = "gameservers"
    game        = "minecraft-java"
    environment = "staging"
  }

  servers_count         = 1
  playbook              = "minecraft-java.yml"
  instance_size         = "Standard_b2s"
  instance_name_pattern = "minecraft-test-server"
  game_name             = "minecraft-java-edition"

  ansible_extra_vars = [
    "-e minecraft_rcon_enable=${var.rcon_enabled}"
    , "-e minecraft_rcon_password=${var.rcon_pass}"
  ]
}

variable "rcon_enabled" {
  default = "False"
}

variable "rcon_pass" {
  default = ""
}

output "fqdns" {
  value = module.minecraft.servers_fqdns
}

output "ips" {
  value = module.minecraft.servers_ips
}
