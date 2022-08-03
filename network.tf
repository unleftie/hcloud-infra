resource "hcloud_network" "network1" {
  name     = "${var.service_name}-network1"
  labels   = var.labels
  ip_range = var.network_cidr_block1
}

resource "hcloud_network_subnet" "subnet1" {
  type         = "cloud"
  network_id   = hcloud_network.network1.id
  network_zone = "eu-central"
  ip_range     = var.subnet_cidr_block1
}
