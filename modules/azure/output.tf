
output "servers_ips" {
  #value = azurerm_public_ip.public_ip.*.ip_address
  value = data.azurerm_public_ip.datasourceip.*.ip_address
}
output "servers_fqdns" {
  #count = var.server_count
  #value = azurerm_public_ip.public_ip.*.fqdn
  value = data.azurerm_public_ip.datasourceip.*.fqdn
}
