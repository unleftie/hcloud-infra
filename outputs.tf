output "server3" {
  description = "Server 3 outputs"
  value = {
    id           = try(hcloud_server.server3[0].id, null)
    ipv4_address = try(hcloud_server.server3[0].ipv4_address, null)
    ipv6_address = try(hcloud_server.server3[0].ipv6_address, null)
    private_ip   = try(one(hcloud_server.server3[0].network[*]).ip, null)
  }
}

output "server6" {
  description = "Server 6 outputs"
  value = {
    id           = try(hcloud_server.server6[0].id, null)
    ipv4_address = try(hcloud_server.server6[0].ipv4_address, null)
    ipv6_address = try(hcloud_server.server6[0].ipv6_address, null)
    private_ip   = try(one(hcloud_server.server6[0].network[*]).ip, null)
  }
}
