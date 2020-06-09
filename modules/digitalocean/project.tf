
resource "digitalocean_project" "gameservers" {
  name        = "gameservers-${var.game_name}"
  description = "A project to to create game servers for '${var.game_name}'."
  purpose     = "Game servers"
  environment = "Development"
  resources   = "${digitalocean_droplet.game_server.*.urn}"
}
