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

resource "hcloud_zone_rrset" "api1_test" {
  zone = hcloud_zone.zone1.name
  name = "api-test"
  type = "A"

  ttl = 300

  records = [
    {
      value = try(hcloud_server.server6[0].ipv4_address, null), comment = "api test server 1"
    },
  ]

  change_protection = false

  labels = var.labels
}

resource "hcloud_zone_rrset" "front1" {
  zone = hcloud_zone.zone1.name
  name = "front"
  type = "CNAME"

  ttl = 300

  records = [
    {
      value = var.front1_cname, comment = "front server 1"
    },
  ]

  change_protection = false

  labels = var.labels
}

resource "hcloud_zone_rrset" "front1_test" {
  zone = hcloud_zone.zone1.name
  name = "front-test"
  type = "CNAME"

  ttl = 300

  records = [
    {
      value = var.front1_test_cname, comment = "front test server 1"
    },
  ]

  change_protection = false

  labels = var.labels
}
