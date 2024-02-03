output "ip4" {
  value = {
    try(hcloud_server.server3[0].name, null) = try(hcloud_server.server3[0].ipv4_address, null)
    try(hcloud_server.server4[0].name, null) = try(hcloud_server.server4[0].ipv4_address, null)
    try(hcloud_server.server5[0].name, null) = try(hcloud_server.server5[0].ipv4_address, null)
  }
  description = "Servers ipv4 addresses"
}
