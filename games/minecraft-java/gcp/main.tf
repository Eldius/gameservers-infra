provider "google" {
  # You need to set this in your .bashrc  # export DIGITALOCEAN_TOKEN="Your API TOKEN"  #
  version = "~> 2.5"
}

terraform {
  required_version = ">= 0.12"
}

module "minecraft" {
  source        = "../../../modules/minecraft-gcp"
  servers_count = 1
}
