
resource "digitalocean_tag" "gameserver" {
  name = "gameserver"
}

resource "digitalocean_tag" "minecraft" {
  name = "minecraft"
}

resource "digitalocean_tag" "disposable" {
  name = "disposable"
}

resource "digitalocean_tag" "test" {
  name = "test"
}

resource "digitalocean_tag" "java" {
  name = "java"
}
