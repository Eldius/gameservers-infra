provider "digitalocean" {
  # You need to set this in your .bashrc  # export DIGITALOCEAN_TOKEN="Your API TOKEN"  #
  version = "= 1.7"
}

terraform {
  required_version = ">= 0.12"
}

module "minecraft" {
  source        = "../../../modules/minecraft-digitalocean"
  servers_count = 1
}
