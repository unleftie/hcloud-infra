resource "hcloud_firewall" "this" {
  name = var.name

  rule {
    direction  = "in"
    protocol   = "udp"
    source_ips = ["0.0.0.0/0", "::/0"]
    port       = "51820"
  }
}
