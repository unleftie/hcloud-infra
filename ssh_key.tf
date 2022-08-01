resource "hcloud_ssh_key" "ssh1" {
  name       = "${var.service_name}-ssh1"
  labels     = var.labels
  public_key = file(var.ssh_public_key_path1)
}
