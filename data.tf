data "http" "cloudflare_ips" {
  url = "https://www.cloudflare.com/ips-v4"
}

data "hcloud_ssh_keys" "this" {
  with_selector = "managed=terraform"
}

data "hcloud_image" "snapshot1" {
  with_selector     = "app=snapshot1"
  most_recent       = true
  with_architecture = "x86"
}
