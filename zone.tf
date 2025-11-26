resource "hcloud_zone" "zone1" {
  name = var.zone1_name
  mode = "primary"

  ttl = 10800

  delete_protection = false

  labels = var.labels
}

resource "hcloud_zone_rrset" "api1" {
  zone = hcloud_zone.zone1.name
  name = "api"
  type = "A"

  ttl = 300

  records = [
    {
      value = try(hcloud_server.server6[0].ipv4_address, null), comment = "api server 1"
    },
  ]

  change_protection = false

  labels = var.labels
}
