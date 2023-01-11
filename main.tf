resource "hcloud_server" "server2" {
  name        = var.server_name2
  server_type = "cpx21"
  location    = var.server_location
  image       = var.server_image
  labels      = var.labels
  ssh_keys    = [hcloud_ssh_key.ssh1.id]
  keep_disk   = true

  firewall_ids = [
    hcloud_firewall.internal.id,
    hcloud_firewall.icmp.id,
    hcloud_firewall.vpn.id,
    hcloud_firewall.ssh_knocking.id,
    hcloud_firewall.cloudflare.id,
  ]

  network {
    network_id = hcloud_network.network1.id
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  depends_on = [
    hcloud_network_subnet.subnet1
  ]

  lifecycle {
    ignore_changes = [
      network
    ]
  }
}
