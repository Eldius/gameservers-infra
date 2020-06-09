
resource "azurerm_virtual_machine" "game_server" {
  count               = var.servers_count
  name                = "${var.instance_name_pattern}-${count.index}"
  location            = azurerm_resource_group.game_servers_group.location
  resource_group_name = azurerm_resource_group.game_servers_group.name
  network_interface_ids = [
    azurerm_network_interface.main[count.index].id
  ]
  vm_size = var.instance_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.instance_name_pattern}-${count.index}"
    admin_username = var.user_name
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("~/.ssh/id_rsa.pub")
      path     = "/home/${var.user_name}/.ssh/authorized_keys"
    }

  }

  tags = var.tags

}

data "template_file" "local_exec" {
  template = file("${path.module}/template/local_exec.sh")
  vars = {
    playbook   = var.playbook
    user_name  = var.user_name
    hosts_ips  = join(",", data.azurerm_public_ip.datasourceip.*.ip_address)
    extra_vars = join(" ", var.ansible_extra_vars)
  }
}

resource "null_resource" "run_ansible" {
  triggers = {
    role_sha1         = sha1(file("../../../ansible/${var.playbook}"))
    requirements_sha1 = sha1(file("../../../ansible/roles/requirements.yml"))
  }

  provisioner "local-exec" {
    command = data.template_file.local_exec.rendered
  }
}
