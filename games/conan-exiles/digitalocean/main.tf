provider "digitalocean" {
  # You need to set this in your .bashrc  # export DIGITALOCEAN_TOKEN="Your API TOKEN"  #
  version = "= 1.7"
}

terraform {
  required_version = ">= 0.12"
}

module "conan-exiles" {
  source                = "../../../modules/digitalocean"
  servers_count         = 1
  playbook              = "conan-exiles.yml"
  instance_size         = "s-1vcpu-3gb"
  instance_name_pattern = "conan-exiles-test-server"
  game_name             = "conan-exiles"
}
