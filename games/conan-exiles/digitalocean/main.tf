
terraform {
  required_version = ">= 0.14"
}

module "conan_exiles" {
  source                = "../../../modules/digitalocean"
  servers_count         = 1
  playbook              = "conan-exiles.yml"
  instance_size         = "s-1vcpu-2gb"
  instance_name_pattern = "conan-exiles-test-server"
  game_name             = "conan-exiles"
}
