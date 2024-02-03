resource "hcloud_ssh_key" "ssh" {
  name       = "${var.service_name}-ssh"
  labels     = var.labels
  public_key = var.ssh_public_key_path

  lifecycle {
    ignore_changes = [public_key, labels]
  }
}
