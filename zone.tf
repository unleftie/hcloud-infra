resource "hcloud_zone" "zone1" {
  name = var.zone1_name
  mode = "primary"

  ttl = 300

  delete_protection = false

  labels = var.labels
}
