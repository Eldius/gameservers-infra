resource "digitalocean_droplet" "minecraft_test_server" {
  ssh_keys           = ["3d:90:f5:28:0e:22:c8:6d:4b:e7:3a:ee:65:3f:a3:d2", "8c:1b:19:ba:26:d3:e8:65:fb:17:12:eb:22:0b:eb:5e"]
  image              = var.ubuntu
  region             = var.do_nyc3
  size               = var.instance_size
  private_networking = false
  backups            = false
  ipv6               = true
  name               = "digitalocean-${var.instance_name_pattern}-${count.index}"

  count = var.servers_count

  provisioner "local-exec" {
    command = "sleep 30 && cd ../../ansible && ansible-galaxy install -r roles/requirements.yml --roles-path=roles/ -f && ansible-playbook -u root -i '${self.ipv4_address},' --private-key ~/.ssh/id_rsa ${var.playbook}"
  }

  tags = [
      "${digitalocean_tag.gameserver.id}"
      , "${digitalocean_tag.test.id}"
      , "${digitalocean_tag.disposable.id}"
      , "${digitalocean_tag.game_tag.id}"
    ]
}
