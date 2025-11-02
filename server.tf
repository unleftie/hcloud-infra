resource "hcloud_ssh_key" "ssh" {
  name       = "${var.service_name}-ssh"
  labels     = var.labels
  public_key = var.ssh_public_key_path

  lifecycle {
    ignore_changes = [public_key, labels]
  }
}

resource "hcloud_server" "server3" {
  count = 1

  name        = var.server_name3
  server_type = "cax11" # arm64
  location    = var.server_location
  image       = "debian-12"
  ssh_keys    = [for key in data.hcloud_ssh_keys.this.ssh_keys : key.id]
  keep_disk   = true

  firewall_ids = [
    hcloud_firewall.internal.id,
    hcloud_firewall.vpn.id,
    hcloud_firewall.ssh_knocking.id,
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

  labels = var.labels
}

resource "hcloud_server" "server6" {
  count = 0

  name        = var.server_name6
  server_type = "cx22" # amd64
  location    = var.server_location
  image       = "debian-12"
  ssh_keys    = [for key in data.hcloud_ssh_keys.this.ssh_keys : key.id]
  keep_disk   = true

  firewall_ids = [
    hcloud_firewall.internal.id,
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
    ignore_changes = [ssh_keys, image, network]
  }

  labels = var.labels
}
