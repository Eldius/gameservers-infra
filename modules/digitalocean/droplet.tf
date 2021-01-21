resource "digitalocean_droplet" "game_server" {
  ssh_keys           = ["59:cf:b2:4e:eb:b7:93:94:f9:5a:76:2f:44:dd:17:d7"]
  image              = var.ubuntu2004
  region             = var.do_nyc3
  size               = var.instance_size
  private_networking = false
  backups            = false
  ipv6               = true
  name               = "digitalocean-${var.instance_name_pattern}-${count.index}"

  count = var.servers_count

  provisioner "local-exec" {
    command = "sleep 30 && cd ../../../ansible && ansible-galaxy install -r roles/requirements.yml --roles-path=roles/ -f && ansible-playbook -u root -i '${self.ipv4_address},' --private-key ~/.ssh/id_rsa ${var.playbook}"
  }

  tags = [
    digitalocean_tag.gameserver.id
    , digitalocean_tag.test.id
    , digitalocean_tag.disposable.id
    , digitalocean_tag.game_tag.id
  ]
}
