output "ipv4_address2" {
  value       = hcloud_server.server2.ipv4_address
  sensitive   = false
  description = "Public ipv4 address"
}
