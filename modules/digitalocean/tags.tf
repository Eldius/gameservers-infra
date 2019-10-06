
resource "digitalocean_tag" "gameserver" {
  name = "gameserver"
}

resource "digitalocean_tag" "game_tag" {
  name = "${var.game_name}"
}

resource "digitalocean_tag" "disposable" {
  name = "disposable"
}

resource "digitalocean_tag" "test" {
  name = "test"
}
