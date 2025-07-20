resource "hcloud_network" "network1" {
  name     = "${var.service_name}-network1"
  ip_range = var.network_cidr_block1

  labels = var.labels
}

resource "hcloud_network_subnet" "subnet1" {
  type         = "cloud"
  network_id   = hcloud_network.network1.id
  network_zone = "eu-central"
  ip_range     = var.subnet_cidr_block1
}
