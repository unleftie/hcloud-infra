output "ipv4_address" {
  value = {
    "server2" = try(hcloud_server.server2[0].ipv4_address, null)
    "server3" = try(hcloud_server.server3[0].ipv4_address, null)
  }
  description = "Public ipv4 address's'"
}

output "ipv6_address" {
  value = {
    "server2" = try(hcloud_server.server2[0].ipv6_address, null)
    "server3" = try(hcloud_server.server3[0].ipv6_address, null)
  }
  description = "Public ipv6 address's'"
}
