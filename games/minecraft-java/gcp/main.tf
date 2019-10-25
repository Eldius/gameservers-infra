provider "google" {
  # You need to set this in your .bashrc  # export DIGITALOCEAN_TOKEN="Your API TOKEN"  #
  version = "~> 2.5"
}

terraform {
  required_version = ">= 0.12"
}

module "minecraft" {
  # Game configs
  source        = "../../../modules/google"
  servers_count = 1
  playbook = "minecraft-java.yml"
  instance_size = "s-1vcpu-2gb"
  instance_name_pattern = "minecraft-test-server"
  game_name = "minecraft-java-edition"

  # Provider specific configs
  disk_size = "10"
  region = ""
  machine_type = ""
}
