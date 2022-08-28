resource "hcloud_server" "server1" {
  name         = var.server_name
  server_type  = var.server_type
  location     = var.server_location
  image        = var.server_image
  labels       = var.labels
  ssh_keys     = [hcloud_ssh_key.ssh1.id]
  firewall_ids = [hcloud_firewall.ssh.id, hcloud_firewall.icmp.id, hcloud_firewall.vpn.id, hcloud_firewall.web.id]

  network {
    network_id = hcloud_network.network1.id
    # ip          = "10.10.10.10"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  depends_on = [
    hcloud_network_subnet.subnet1
  ]
}
