resource "hcloud_server" "server3" {
  count       = 1
  name        = var.server_name3
  server_type = "cax11"
  location    = var.server_location
  image       = "debian-12"
  labels      = var.labels
  ssh_keys    = data.hcloud_ssh_keys.this.ssh_keys.*.id
  keep_disk   = true

  firewall_ids = [
    hcloud_firewall.internal.id,
    hcloud_firewall.icmp.id,
    hcloud_firewall.ssh_knocking.id,
    hcloud_firewall.vpn.id,
  ]

  network {
    network_id = hcloud_network.network1.id
    ip         = "10.80.80.3"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  depends_on = [
    hcloud_network_subnet.subnet1
  ]

  lifecycle {
    ignore_changes = [ssh_keys, image, network]
  }
}

resource "hcloud_server" "server4" {
  count       = 1
  name        = var.server_name4
  server_type = "cax11"
  location    = var.server_location
  image       = "debian-12"
  labels      = var.labels
  ssh_keys    = data.hcloud_ssh_keys.this.ssh_keys.*.id
  keep_disk   = true

  firewall_ids = [
    hcloud_firewall.internal.id,
    hcloud_firewall.icmp.id,
    hcloud_firewall.ssh_knocking.id,
    hcloud_firewall.cloudflare.id,
  ]

  network {
    network_id = hcloud_network.network1.id
    ip         = "10.80.80.4"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  depends_on = [
    hcloud_network_subnet.subnet1
  ]

  lifecycle {
    ignore_changes = [ssh_keys, image, network]
  }
}

resource "hcloud_server" "server5" {
  count       = 0
  name        = var.server_name5
  server_type = "cax11"
  location    = var.server_location
  image       = "debian-12"
  labels      = var.labels
  ssh_keys    = data.hcloud_ssh_keys.this.ssh_keys.*.id
  keep_disk   = true

  firewall_ids = [
    hcloud_firewall.internal.id,
    hcloud_firewall.icmp.id,
    hcloud_firewall.ssh_knocking.id,
    hcloud_firewall.vpn.id,
  ]

  network {
    network_id = hcloud_network.network1.id
    ip         = "10.80.80.5"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  depends_on = [
    hcloud_network_subnet.subnet1
  ]

  lifecycle {
    ignore_changes = [ssh_keys, image, network]
  }
}

resource "hcloud_server" "server6" {
  count       = 0
  name        = var.server_name6
  server_type = "cx22"
  location    = var.server_location
  image       = data.hcloud_image.snapshot1.id
  labels      = var.labels
  ssh_keys    = data.hcloud_ssh_keys.this.ssh_keys.*.id
  keep_disk   = true

  firewall_ids = [
    hcloud_firewall.internal.id,
    hcloud_firewall.icmp.id,
    hcloud_firewall.ssh_knocking.id
  ]

  network {
    network_id = hcloud_network.network1.id
    ip         = "10.80.80.6"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  depends_on = [
    hcloud_network_subnet.subnet1
  ]

  lifecycle {
    ignore_changes = [ssh_keys, network]
  }

  timeouts {
    create = "25m"
  }
}
