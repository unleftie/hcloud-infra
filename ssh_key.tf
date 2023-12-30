resource "hcloud_ssh_key" "ssh" {
  name       = "${var.service_name}-ssh"
  labels     = var.labels
  public_key = try(file(var.ssh_public_key_path), null)
}
