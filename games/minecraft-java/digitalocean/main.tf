provider "digitalocean" {
  # You need to set this in your .bashrc  # export DIGITALOCEAN_TOKEN="Your API TOKEN"  #
  version = "= 1.7"
}

terraform {
  required_version = ">= 0.12"
}

module "minecraft" {
  source        = "../../../modules/digitalocean"
  servers_count = 1
  playbook = "minecraft-java.yml"
  instance_size = "size02"
  instance_name_pattern = "minecraft-test-server"
  minecraft = "minecraft-java-edition"
}
