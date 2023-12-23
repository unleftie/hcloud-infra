resource "hcloud_ssh_key" "ssh1" {
  name       = "${var.service_name}-ssh1"
  labels     = var.labels
  public_key = try(file(var.ssh_public_key_old_path), null)
}

resource "hcloud_ssh_key" "ssh" {
  name       = "${var.service_name}-ssh"
  labels     = var.labels
  public_key = try(file(var.ssh_public_key_path), null)
}
