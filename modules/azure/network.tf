# Create a virtual network within the resource group
resource "azurerm_virtual_network" "game_server_network" {
  name                = var.network_name
  resource_group_name = azurerm_resource_group.game_servers_group.name
  location            = azurerm_resource_group.game_servers_group.location
  address_space       = var.address_space

  tags = var.tags
}


resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.game_servers_group.name
  virtual_network_name = azurerm_virtual_network.game_server_network.name
  address_prefix       = var.subnet_address_prefix
}

resource "azurerm_network_interface" "main" {
  count               = var.servers_count
  name                = "${var.instance_name_pattern}-${count.index}-nic"
  location            = azurerm_resource_group.game_servers_group.location
  resource_group_name = azurerm_resource_group.game_servers_group.name

  ip_configuration {
    name                          = "${var.instance_name_pattern}-${count.index}-eth0"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }
  tags = var.tags
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.servers_count
  name                = "gameserver-public-ip-${count.index}"
  resource_group_name = azurerm_resource_group.game_servers_group.name
  location            = azurerm_resource_group.game_servers_group.location
  allocation_method   = "Dynamic"
  tags                = var.tags
}

data "azurerm_public_ip" "datasourceip" {
  count               = var.servers_count
  name                = azurerm_public_ip.public_ip[count.index].name
  resource_group_name = azurerm_virtual_machine.game_server[count.index].resource_group_name
}
