
resource "hcloud_firewall" "internal" {
  name   = "${var.service_name}-firewall-internal"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = [var.network_cidr_block1]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "any"
    source_ips = [var.network_cidr_block1]
  }

  rule {
    direction  = "in"
    protocol   = "udp"
    port       = "any"
    source_ips = [var.network_cidr_block1]
  }

  rule {
    direction  = "in"
    protocol   = "gre"
    source_ips = [var.network_cidr_block1]
  }

  rule {
    direction  = "in"
    protocol   = "esp"
    source_ips = [var.network_cidr_block1]
  }
}

resource "hcloud_firewall" "icmp" {
  name   = "${var.service_name}-firewall-icmp"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = ["0.0.0.0/0"]
  }
}

resource "hcloud_firewall" "ssh" {
  name   = "${var.service_name}-firewall-ssh"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "tcp"
    source_ips = ["0.0.0.0/0"]
    port       = "22"
  }
}

resource "hcloud_firewall" "vpn" {
  name   = "${var.service_name}-firewall-vpn"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "udp"
    source_ips = ["0.0.0.0/0"]
    port       = var.vpn_port
  }
}

resource "hcloud_firewall" "web" {
  name   = "${var.service_name}-firewall-web"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "tcp"
    source_ips = ["0.0.0.0/0"]
    port       = "80"
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    source_ips = ["0.0.0.0/0"]
    port       = "443"
  }
}

# see https://www.cloudflare.com/ips/
resource "hcloud_firewall" "cloudflare" {
  name   = "${var.service_name}-firewall-cloudflare"
  labels = var.labels

  rule {
    direction = "in"
    protocol  = "tcp"
    source_ips = [
      "103.21.244.0/22",
      "103.22.200.0/22",
      "103.31.4.0/22",
      "104.16.0.0/13",
      "104.24.0.0/14",
      "108.162.192.0/18",
      "131.0.72.0/22",
      "141.101.64.0/18",
      "162.158.0.0/15",
      "172.64.0.0/13",
      "173.245.48.0/20",
      "188.114.96.0/20",
      "190.93.240.0/20",
      "197.234.240.0/22",
      "198.41.128.0/17",
    ]
    port = "80"
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    source_ips = [
      "103.21.244.0/22",
      "103.22.200.0/22",
      "103.31.4.0/22",
      "104.16.0.0/13",
      "104.24.0.0/14",
      "108.162.192.0/18",
      "131.0.72.0/22",
      "141.101.64.0/18",
      "162.158.0.0/15",
      "172.64.0.0/13",
      "173.245.48.0/20",
      "188.114.96.0/20",
      "190.93.240.0/20",
      "197.234.240.0/22",
      "198.41.128.0/17",
    ]
    port = "443"
  }
}

resource "hcloud_firewall" "ssh_knocking" {
  name   = "${var.service_name}-firewall-ssh-knocking"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "tcp"
    source_ips = ["0.0.0.0/0"]
    port       = "22"
  }
  rule {
    direction  = "in"
    protocol   = "tcp"
    source_ips = ["0.0.0.0/0"]
    port       = var.knocking_port
  }

  rule {
    direction  = "in"
    protocol   = "udp"
    source_ips = ["0.0.0.0/0"]
    port       = var.knocking_port
  }
}
