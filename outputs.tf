output "ipv4_address" {
  value       = hcloud_server.server1.ipv4_address
  sensitive   = false
  description = "Public ipv4 address"
}
