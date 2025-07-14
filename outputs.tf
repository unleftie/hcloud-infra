output "ip4" {
  description = "Servers ipv4 addresses"
  value = {
    try(hcloud_server.server3[0].name, var.server_name3) = try(hcloud_server.server3[0].ipv4_address, null)
    try(hcloud_server.server6[0].name, var.server_name6) = try(hcloud_server.server6[0].ipv4_address, null)
  }
}

output "ip6" {
  description = "Servers ipv6 addresses"
  value = {
    try(hcloud_server.server3[0].name, var.server_name3) = try(hcloud_server.server3[0].ipv6_address, null)
    try(hcloud_server.server6[0].name, var.server_name6) = try(hcloud_server.server6[0].ipv6_address, null)
  }
}

output "private_ip4" {
  description = "Servers private ipv4 addresses"
  value = {
    try(hcloud_server.server3[0].name, var.server_name3) = try(one(hcloud_server.server3[0].network[*]).ip, null)
    try(hcloud_server.server6[0].name, var.server_name6) = try(one(hcloud_server.server6[0].network[*]).ip, null)
  }
}
