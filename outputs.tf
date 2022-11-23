output "ipv4_address" {
  value = [
    hcloud_server.server2.ipv4_address,
  ]
  sensitive   = false
  description = "Public ipv4 address's'"
}

output "ipv6_address" {
  value = [
    hcloud_server.server2.ipv6_address,
  ]
  sensitive   = false
  description = "Public ipv6 address's'"
}
