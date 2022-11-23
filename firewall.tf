
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

resource "hcloud_firewall" "knocking" {
  name   = "${var.service_name}-firewall-knocking"
  labels = var.labels

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
