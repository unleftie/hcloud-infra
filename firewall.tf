resource "hcloud_firewall" "all" {
  name   = "${var.service_name}-firewall-all"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "any"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction  = "in"
    protocol   = "udp"
    port       = "any"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction  = "in"
    protocol   = "gre"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction  = "in"
    protocol   = "esp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
}

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
    source_ips = ["0.0.0.0/0", "::/0"]
  }
}

resource "hcloud_firewall" "vpn" {
  name   = "${var.service_name}-firewall-vpn"
  labels = var.labels

  dynamic "rule" {
    for_each = var.vpn_ports

    content {
      direction  = "in"
      protocol   = "udp"
      source_ips = ["0.0.0.0/0", "::/0"]
      port       = rule.value
    }
  }
}

resource "hcloud_firewall" "ssh_knocking" {
  name   = "${var.service_name}-firewall-ssh-knocking"
  labels = var.labels

  rule {
    direction  = "in"
    protocol   = "tcp"
    source_ips = ["0.0.0.0/0", "::/0"]
    port       = "22"
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    source_ips = ["0.0.0.0/0", "::/0"]
    port       = join("-", tolist(var.knocking_ports_range))
  }

  rule {
    direction  = "in"
    protocol   = "udp"
    source_ips = ["0.0.0.0/0", "::/0"]
    port       = join("-", tolist(var.knocking_ports_range))
  }
}
