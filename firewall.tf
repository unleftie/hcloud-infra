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

# resource "hcloud_firewall" "web" {
#   name   = "${var.service_name}-firewall-web"
#   labels = var.labels

#   rule {
#     direction  = "in"
#     protocol   = "tcp"
#     source_ips = [var.personal_ip1]
#     port       = "80"
#   }

#   rule {
#     direction  = "in"
#     protocol   = "tcp"
#     source_ips = [var.personal_ip1]
#     port       = "443"
#   }
# }
