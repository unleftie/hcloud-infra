resource "wireguard_asymmetric_key" "server" {}

resource "wireguard_asymmetric_key" "peers" {
  count = length(var.peers)
}

resource "hcloud_server" "this" {
  name         = var.name
  server_type  = var.type
  location     = var.location
  image        = "ubuntu-20.04"
  labels       = var.labels
  ssh_keys     = [hcloud_ssh_key.this.id]
  firewall_ids = [hcloud_firewall.this.id]

  user_data = templatefile("${path.module}/templates/create.sh", {
    public_ip   = hcloud_floating_ip.this.ip_address
    private_key = wireguard_asymmetric_key.server.private_key
    peers = [for idx, val in var.peers : {
      name       = val
      public_key = wireguard_asymmetric_key.peers[idx].public_key
    }]
  })
}

resource "hcloud_floating_ip" "this" {
  type          = "ipv4"
  name          = var.name
  home_location = var.location
}

resource "hcloud_floating_ip_assignment" "this" {
  server_id      = hcloud_server.this.id
  floating_ip_id = hcloud_floating_ip.this.id
}
