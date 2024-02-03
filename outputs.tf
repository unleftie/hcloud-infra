output "ip4" {
  description = "Servers ipv4 addresses"
  value = {
    try(hcloud_server.server3[0].name, null) = try(hcloud_server.server3[0].ipv4_address, null)
    try(hcloud_server.server4[0].name, null) = try(hcloud_server.server4[0].ipv4_address, null)
    try(hcloud_server.server5[0].name, null) = try(hcloud_server.server5[0].ipv4_address, null)
  }
}

output "private_ip4" {
  description = "Servers private ipv4 addresses"
  value = {
    try(hcloud_server.server3[0].name, null) = try(one(hcloud_server.server3[0].network[*]).ip, null)
    try(hcloud_server.server4[0].name, null) = try(one(hcloud_server.server4[0].network[*]).ip, null)
    try(hcloud_server.server5[0].name, null) = try(one(hcloud_server.server5[0].network[*]).ip, null)
  }
}
