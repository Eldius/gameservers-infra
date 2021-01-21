
output "server_ips" {
  value = digitalocean_droplet.game_server.*.ipv4_address
}
