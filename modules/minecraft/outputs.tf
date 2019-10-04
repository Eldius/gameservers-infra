
output "minecraft_server_ip" {
  value = "${digitalocean_droplet.minecraft_test_server.*.ipv4_address}"
}
